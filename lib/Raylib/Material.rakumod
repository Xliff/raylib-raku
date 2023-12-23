use v6;

use NativeCall;

use Raylib::Bindings;

class Raylib::Material {
  has Material $!material handles(*) is built;

  method Raylib::Bindings::Material { $!material }

  multi method new (Material $material) {
    return Nil unless $material;
    self.bless( :$material );
  }
  multi method new (
    Shader()      $shader,
    MaterialMap() $maps,
                  @params
  ) {
    samewith(
      $shader,
      $maps,
      CArray[num32].new( @params )
    );
  }
  multi method new (
    Shader()      $shader,
    MaterialMap() $maps,
    CArray[num32] $params
  ) {
    self.bless(
      material => Material.init($shader, $maps, $params)
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
