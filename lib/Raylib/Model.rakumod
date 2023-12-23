use v6.c;

use NativeCall;

use Raylib::Bindings;
use Raylib::Raw::Model;

class Raylib::Model {
  # cw: There appears to be an issue with how this CStruct was converted.
  #     In several places there are arrays of structs which are masking
  #     themselves as struct pointers.
  #
  #     For now, the array aware version of the CStruct is now known as
  #     ModelRevised, where the original struct retains its same name.
  #     We only delegate from the array aware version.
  has Model        $!oldmodel;

  has ModelRevised $!model     handles(*) is built;

  has $!materials;
  has $!meshes;

  submethod BUILD ( :$model ) {
    $!oldmodel = $model;
    $!model    = nativecast(ModelRevised, $model);
  }

  method Raylib::Bindings::Model { $!oldmodel }

  multi method new (Model $model) {
    return Nil unless $model;
    self.bless( :$model );
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
    is-model-ready($!oldmodel)
  }

  method get-bounding-box ( :$raw = False ) {
    my $bb = get-model-bounding-box($!oldmodel);
    return $bb if $raw;
    #Raylib::BoundingBox.new($bb);
    $bb;
  }

  method draw (Vector3() $position, Num() $scale, Color() $tint) {
    my num32 $s = $scale;

    draw-model($!oldmodel, $position, $s, $tint);
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
      $!oldmodel,
      $position,
      $rotationAxis,
      $r,
      $scale,
      $tint
    )
  }

  method draw-wires (Vector3() $position, Num() $scale, Color() $tint) {
    my num32 $s = $scale;

    draw-model-wires($!oldmodel,  $position, $s, $tint);
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
      $!oldmodel,
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

      if $!meshes.can('^mesh') -> &m {
        &m.wrap: method (|c) {
          Raylib::Mesh.new( callsame );
        }
      }
    }

    $!meshes;
  }

  # method materials {
  #   unless $!materials {
  #     $!materials = $!model.materials;
  #
  #     if $!materials.can('^material') -> &m {
  #       unless &m.is-wrapped {
  #         &m.wrap: method (|c) {
  #           Raylib::Material.new( callsame );
  #         }
  #       }
  #     }
  #   }
  #
  #   nextsame;
  # }


  method set-mesh-material (Int() $meshId, Int() $materialId) {
    my int32 ($me, $ma) = ($meshId, $materialId);

    set-model-mesh-material($!oldmodel, $me, $ma);
  }

  method unload {
    unload-model($!oldmodel);
  }

  method update-animation (ModelAnimation() $anim, Int() $frame) {
    my int32 $f = $frame;

    update-model-animation($!oldmodel, $anim, $frame);
  }


}
