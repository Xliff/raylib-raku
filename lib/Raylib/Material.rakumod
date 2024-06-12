use v6;

use NativeCall;

use Raylib::Raw::Definitions;
use Raylib::Raw::Structs;
use Raylib::Raw::Events;
use Raylib::Bindings;

my %material-maps;

class Raylib::Material {
  has Material $!material handles<shader params> is built handles(*);

  method maps {
    my $b = $!material.maps;
    unless %material-maps{ self.WHERE } {
      %material-maps{ self.WHERE } = class :: {

        method Array {
          my @a;
          @a[$_] = self[$_] for self.elems;
          @a;
        }

        # Cribbed from MySQL::Native. Thanks, ctilmes!
        method AT-POS (Int $field) {
          $field < self.elems
            ?? nativecast(
                 MaterialMap,
                 Pointer.new( $b + $field * nativesizeof(MaterialMap) )
               )
            !! MaterialMap;
        }

        method elems { MAX_MATERIAL_MAPS }

      }
    }
    %material-maps{ self.WHERE }
  }

  method Raylib::Raw::Structs::Material { $!material }

  proto method new (|)
  { * }

  multi method new (Material $material) {
    return Nil unless $material;
    self.bless( :$material );
  }

  multi method new (
    Shader()      $shader,
    CArray[num32] $params
  ) {
    self.bless(
      material => Material.init($shader, $params)
    );
  }

  method load-default ( ::?CLASS:U: ) {
    load-material-default;
  }

  method is-ready {
    is-material-ready($!material);
  }

  method set-texture (Int() $mapType, Texture2D $texture) {
    my int32 $m = $mapType;

    set-material-texture ($m, $texture);
  }

  multi method load (IO $file, $materialCount is rw, :$raw = False) {
    my $mat = self.load($file.absolute, $materialCount, :$raw);

  }
  multi method load (
    Str()  $fileName,
           $materialCount is rw,
          :$raw                  = False
  ) {
    my int32 $m = 0;

    my $mat = load-materials($fileName, $m);
    return Nil unless $mat;
    $materialCount = $m;
    return $mat if $raw;
    self.new($mat);
  }

  method unload {
    unload-material($!material);
  }

}
