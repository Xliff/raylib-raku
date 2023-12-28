use v6;

use NativeCall;
use Method::Also;

use Raylib::Bindings;
use Raylib::Raw::Texture2D;

use Raylib::Vector2;

use Raylib::Roles::Reapable;

class Raylib::Texture does Reapable {
  has Texture2D $!texture handles(*) is built;

  method Raylib::Bindings::Texture2D
    is also<Texture2D>
  { $!texture }

  method Raylib::Bindings::Texture
    is also<Texture>
  { $!texture }

  multi method new (Texture $texture) {
    return Nil unless $texture;
    self.bless( :$texture );
  }
  multi method new (Texture2D $texture) {
    return Nil unless $texture;
    self.bless( :$texture );
  }
  multi method new (
    Int() $id,
    Int() $width,
    Int() $height,
    Int() $mipmaps,
    Int() $format
  ) {
    my int32 ($i, $w, $h, $m, $f) = ($id, $width, $height, $mipmaps, $format);

    my $texture = Texture.init($i, $w, $h, $m, $f);
    return Nil unless $texture;
    my $o = self.bless( :$texture );
    $o.addReapable($texture);
    $o;
  }

  method draw-midscreen (Color() $tint) {
    self.draw(
      (get-screen-width  - self.width )  / 2,
      (get-screen-height - self.height ) / 2,
      $tint
    );
  }
  method draw-centered ($y, Color() $tint) {
    self.draw(
      (get-screen-width  - self.width )  / 2,
      $y,
      $tint
    );
  }

  multi method draw (
    Vector2() $pos,
    Color()   $tint
  ) {
    samewith( $pos.x, $pos.y, $tint );
  }
  multi method draw (
      Int()   $posX,
      Int()   $posY,
      Color() $tint
  ) {
    my int32 ($x, $y) = ($posX, $posY);

    draw-texture($!texture, $x, $y, $tint);
  }

  multi method draw-ex (
    Num()   $xx,
    Num()   $yy,
    Num()   $rotation,
    Num()   $scale,
    Color() $tint
  ) {
    my num32 ($r, $s) = ($rotation, $scale);

    my $v = Raylib::Vector2.new($xx, $yy);

    samewith($v, $r, $s, $tint);
  }
  multi method draw-ex (
      Vector2() $position,
      Num()     $rotation,
      Num()     $scale,
      Color()   $tint
  ) {
    my num32 ($r, $s) = ($rotation, $scale);

    draw-texture-ex($!texture, $position, $r, $s, $tint);
  }

  method draw-npatch (
      NPatchInfo() $nPatchInfo,
      Rectangle()  $dest,
      Vector2()    $origin,
      Num()        $rotation,
      Color()      $tint
  ) {
    my num32 $r = $rotation;

    draw-texture-npatch($!texture, $nPatchInfo, $dest, $origin, $r, $tint);
  }

  method draw-pro (
      Rectangle() $source,
      Rectangle() $dest,
      Vector2()   $origin,
      Num()       $rotation,
      Color()     $tint
  ) {
    my num32 $r = $rotation;

    draw-texture-pro($!texture, $source, $dest, $origin, $r, $tint);
  }

  method draw-rec (
      Rectangle() $source,
      Vector2()   $position,
      Color()     $tint
  ) {
    draw-texture-rec($!texture, $source, $position, $tint);
  }

  method draw-v (Vector2() $position, Color() $tint) {
    draw-texture-v($!texture, $position, $tint);
  }

  method gen-mipmaps {
    gen-texture-mipmaps($!texture);
  }

  method is-ready {
    is-texture-ready($!texture);
  }

  multi method load (
    Raylib::Texture:U:

    Distribution::Resource $file
  ) {
    samewith($file.absolute);
  }
  multi method load (
    Raylib::Texture:U:

    IO $file
  ) {
    samewith($file.absolute);
  }
  # cw: Is this a reapable situation?
  multi method load (
    Raylib::Texture:U:

    Str $filename
  ) {
    my $texture = load-texture($filename);
    return Nil unless $texture;
    self.new($texture);
  }

  # cw: Is this a reapable situation?
  multi method load-from-image (
    Raylib::Texture:U:

    Image() $image
  ) {
    my $texture = load-texture-from-image($image);
    return Nil unless $texture;
    self.new($texture);
  }

  method load-image-from ( :$raw = False ) is also<get-image> {
    my $i = load-image-from-texture($!texture);
    return Nil unless $i;
    return $i if $raw;
    #Raylib::Image.new($i);
    $i
  }

  method set-shapes (Rectangle() $source) {
    set-shapes-texture($!texture, $source);
  }

  method set-filter (Int() $filter) {
    my int32 $f = $filter;

    set-texture-filter($!texture, $f);
  }

  method set-wrap (Int() $wrap) {
    my int32 $w = $wrap;

    set-texture-wrap($!texture, $w);
  }

  method unload {
    unload-texture($!texture);
  }

  method update (Pointer $pixels) {
    update-texture($!texture, $pixels);
  }

  method update-rec (Rectangle() $rec, Pointer $pixels) {
    update-texture-rec($!texture, $rec, $pixels);
  }

}

class  Raylib::Texture2D is Raylib::Texture { }
