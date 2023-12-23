use v6;

use NativeCall;

use Raylib::Bindings;

class Raylib::Texture {
  has Texture $!texture;

  method Raylib::Bindings::Texture { $!texture }

  multi method new (Texture $texture) {
    return Nil unless $texture;
    self.bless( :$texture );
  }
  multi method new (
    Int() :$id      = 0,
    Int() :$width   = 0,
    Int() :$height  = 0,
    Int() :$mipmaps = 0,
    Int() :$format  = 0
  ) {
    my int32 ($i, $w, $h, $m, $f) = ($id, $width, $height, $mipmaps, $format);

    self.bless(
      texture => Texture.init( $i, $w, $h, $m, $f )
    );
  }
  multi method new (
    Int() $id,
    Int() $width,
    Int() $height,
    Int() $mipmaps,
    Int() $format
  ) {
    my int32 ($i, $w, $h, $m, $f) = ($id, $width, $height, $mipmaps, $format);

    self.bless(
      texture => Texture.init( $i, $w, $h, $m, $f )
    );
  }
  multi method new (IO $file) {
    self.load($file.absolute);
  }
  multi method new (Str $file) {
    self.load($file);
  }

  method load (
    ::?CLASS:U:

    Str()  $fileName,
          :$raw        = False
  ) {
    my $t = load-texture($fileName);
    return $t if $raw;
    self.new($t);
  }

  method get-image ( :$raw ) {
    my $i = load-image-from-texture($!texture);
    return $i if $raw;
    Raylib::Image.new($i);
  }

  method gen-mipmaps {
    gen-texture-mipmaps($!texture);
  }

  method is-ready {
    is-texture-ready($!texture);
  }

  method unload {
    unload-texture($!texture);
  }

  method set-shapes (Rectangle() $source) {
    set-shapes-texture($!texture, $source);
  }

  method update-rec (Rectangle() $rec, Pointer $pixels) {
    update-texture-rec($!texture, $rec, $pixels);
  }

  method set-filter (Int() $filter) {
    my int32 $f = $filter;

    set-texture-filter($!texture, $filter);
  }

  method set-wrap (Int() $wrap) {
    my int32 $w = $wrap;

    set-texture-wrap($!texture, $w);
  }

  method draw (int32 $posX, int32 $posY, Color() $tint) {
    my int32 ($x, $y) = ($posX, $posY);

    draw-texture($!texture, $x, $y, $tint);
  }

  method draw-v (Vector2() $position, Color() $tint) {
    draw-texture-v ($!texture, $position, $tint);
  }

  method draw-ex (
    Vector2() $position,
    Num()     $rotation,
    Num()     $scale,
    Color()   $tint
  ) {
    my num32 ($r, $s) = ($rotation, $scale);

    draw-texture-ex($!texture, $position, $r, $s, $tint);
  }

  method draw-rec (
    Rectangle() $source,
    Vector2()   $position,
    Color()     $tint
  ) {
    draw-texture-rec($!texture, $source, $position, $tint);
  }

  method draw-pro (
    Rectangle() $source,
    Rectangle() $dest,
    Vector2()   $origin,
    Num()       $rotation,
    Color()     $tint
  ) {
    my num32 $r = $rotation;

    draw-texture-pro($!texture, $source, $dest, $origin, $r, $tint)
  }

  method draw-npatch (
    NPatchInfo() $nPatchInfo,
    Rectangle()  $dest,
    Vector2()    $origin,
    Num()        $rotation,
    Color()      $tint
  ) {
    my num32 $r = $rotation;

    draw-texture-npatch(
      $!texture,
      $nPatchInfo,
      $dest,
      $origin,
      $r,
      $tint
    )
  }

}
