use v6.c;

use NativeCall;

use Raylib::Raw::Definitions;
use Raylib::Raw::Structs;

use Raylib::Bindings;
use Raylib::Material;

use Raylib::Raw::Model;

class Raylib::Model {
  # cw: There appears to be an issue with how this CStruct was converted.
  #     In several places there are arrays of structs which are masking
  #     themselves as struct pointers.
  #
  #     For now, the array aware version of the CStruct is now known as
  #     ModelRevised, where the original struct retains its same name.
  #     We only delegate from the array aware version.
  #has Model        $!model;

  has Model $!model     handles(*) is built;

  has $!materials;
  has $!meshes;
  has $!transforms;

  submethod BUILD ( :$model ) {
    $!model = $model;
  }

  method Raylib::Raw::Structs::Model
  { $!model }

  method Model { $!model }

  multi method new (Model $model) {
    return Nil unless $model;
    self.bless( :$model );
  }

  method dump {
    dump-model($!model);
  }

  multi method load (
    ::?CLASS:U:

    IO $file
  ) {
    samewith($file.absolute);
  }
  multi method load (
    ::?CLASS:U:

    Str() $fileName
  ) {
    my $model = load-model($fileName);

    return Nil unless $model;
    self.bless( :$model );
  }

  method load-from-mesh (
    ::?CLASS:U:

    Mesh() $mesh
  ) {
    return Nil unless $mesh;

    my $model = load-model-from-mesh($mesh);
    return Nil unless $model;
    self.bless( :$model );
  }

  method is-ready {
    is-model-ready($!model)
  }

  method get-bounding-box ( :$raw = False ) {
    my $bb = get-model-bounding-box($!model);
    return $bb if $raw;
    #Raylib::BoundingBox.new($bb);
    $bb;
  }

  method draw (Vector3() $position, Num() $scale, Color() $tint) {
    my num32 $s = $scale;

    draw-model($!model, $position, $s, $tint);
  }

  method draw-ex (
    Vector3() $position,
    Vector3() $rotationAxis,
    Num()     $rotationAngle,
    Vector3() $scale,
    Color()   $tint
  ) {
    my num32 $r = $rotationAngle;

    draw-model-ex(
      $!model,
      $position,
      $rotationAxis,
      $r,
      $scale,
      $tint
    )
  }

  method draw-wires (Vector3() $position, Num() $scale, Color() $tint) {
    my num32 $s = $scale;

    draw-model-wires($!model,  $position, $s, $tint);
  }

  method draw-wires-ex(
    Vector3() $position,
    Vector3() $rotationAxis,
    Num()     $rotationAngle,
    Vector3() $scale,
    Color()   $tint
  ) {
    my num32 $r = $rotationAngle;

    draw-model-wires-ex(
      $!model,
      $position,
      $rotationAxis,
      $r,
      $scale,
      $tint
    );
  }

  method meshes {
    unless $!meshes {
      $!meshes = $!model.meshes;

      if $!meshes.^can('mesh') -> &m {
        unless &m.is-wrapped {
          &m.wrap: method (|c) {
            my $m = callsame;
            $m ?? Raylib::Mesh.new($m) !! Nil;
          }
        }
      }
    }

    $!meshes;
  }

  method materials {
    say "Materials: { +( nativecast(Pointer, $!model.materials( :raw ) ) ) }";

    $!materials = Raylib::Material.new(
      nativecast( Material, $!model.materials( :raw )  )
    ) unless $!materials;

    $!materials
  }

  method transforms {
    unless $!transforms {
      $!transforms = $!model.transforms;

      if $!materials.can('^transform') -> &m {
        unless &m.is-wrapped {
          &m.wrap: method (|c) {
            my $m = callsame;
            $m ?? Raylib::Transform.new($m) !! Nil;
          }
        }
      }
    }

    $!transforms;
  }

  method set-mesh-material (Int() $meshId, Int() $materialId) {
    my int32 ($me, $ma) = ($meshId, $materialId);

    set-model-mesh-material($!model, $me, $ma);
  }

  method unload {
    unload-model($!model);
  }

  method update-animation (ModelAnimation() $anim, Int() $frame) {
    my int32 $f = $frame;

    update-model-animation($!model, $anim, $frame);
  }


}
