use v6;

use Method::Also;

use Raylib::Bindings;
use Raylib::Raw::Exceptions;
use Raylib::Raw::Image;

use Raylib::Rectangle;

class Raylib::Image {
  has Image $!image handles(*) is built;

  method Raylib::Bindings::Image
    is also<Image>
  { $!image }

  method new (Image $image) {
    return Nil unless $image;
    self.bless( :$image );
  }

  method sized-rect ( :$raw = False ) {
    my $rect = Raylib::Rectangle.new(
      width => self.width,
      height => self.height
    );
    return $rect.Rectangle if $raw;
    $rect;
  }

  method export-image (Str() $fileName) {
    export-image($!image, $fileName);
  }

  method export-image-as-code (Str() $fileName) {
    export-image-as-code($!image, $fileName);
  }

  method export-image-to-memory (Str() $fileType, Int() $fileSize) {
    my int32 $f = $fileSize;

    export-image-to-memory($!image, $fileType, $f);
  }

  method gen-mesh-cubicmap (Vector3() $cubeSize) {
    gen-mesh-cubicmap($!image, $cubeSize);
  }

  method gen-mesh-heightmap (Vector3() $size) {
    gen-mesh-heightmap($!image, $size);
  }

  method get-image-alpha-border (Num() $threshold) {
    my num32 $t = $threshold;

    get-image-alpha-border($!image, $t);
  }

  # method get-image-color (
  #     int32 $x,
  #     int32 $y
  # ) {
  #   get-image-color($!image, ...);
  # }

  method alpha-clear (
    Color() $color,
    Num()   $threshold
  ) {
    my num32 $t = $threshold;

    image-alpha-clear($!image, $color, $t);
    self;
  }

  method alpha-crop (Num() $threshold) {
    my num32 $t = $threshold;

    image-alpha-crop($!image, $t);
    self;
  }

  method alpha-mask (Image() $alphaMask) {
    image-alpha-mask($!image, $alphaMask);
    self;
  }

  method alpha-premultiply {
    image-alpha-premultiply($!image);
    self;
  }

  method blur-gaussian (Int() $blurSize) {
    my int32 $b = $blurSize;

    image-blur-gaussian($!image, $b);
    self;
  }

  method clear-background (Color() $color) {
    image-clear-background($!image, $color);
    self;
  }

  method color-brightness (Int() $brightness) {
    my int32 $b = $brightness;

    image-color-brightness($!image, $b);
    self;
  }

  method color-contrast (Num() $contrast) {
    my num32 $c = $contrast;

    image-color-contrast($!image, $c);
    self;
  }

  method color-grayscale {
    image-color-grayscale($!image);
    self;
  }

  method color-invert {
    image-color-invert($!image);
    self;
  }

  method color-replace (Color() $color, Color() $replace) {
    image-color-replace($!image, $color, $replace);
    self;
  }

  method color-tint (Color() $color) {
    image-color-tint($!image, $color);
    self;
  }

  method copy {
    my $image = image-copy($!image);

    self.new($image);
  }

  method crop (Rectangle() $crop, :$raw = False) {
    image-crop($!image, $crop);
    self;
  }

  # method dither (
  #     int32 $rBpp,
  #     int32 $gBpp,
  #     int32 $bBpp,
  #     int32 $aBpp
  # ) {
  #   image-dither($!image, ...);
  # }

  method draw (
    Image()     $src,
    Rectangle() $srcRec,
    Rectangle() $dstRec,
    Color()     $tint
  ) {
    image-draw($!image, $src, $srcRec, $dstRec, $tint);
    self;
  }

  # method draw-circle (
  #     int32 $centerX,
  #     int32 $centerY,
  #     int32 $radius,
  #     Color $color
  # ) {
  #   image-draw-circle($!image, ...);
  # }

  method draw-circle-lines (
    Int()   $centerX,
    Int()   $centerY,
    Int()   $radius,
    Color() $color
  ) {
    my int32 ($x, $y, $r) = ($centerX, $centerY, $radius);

    image-draw-circle-lines($!image, $x, $y, $r, $color);
    self;
  }

  method draw-circle-lines-v (
      Vector2() $center,
      Int()     $radius,
      Color()   $color
  ) {
    my int32 $r = $radius;

    image-draw-circle-lines-v($!image, $center, $r, $color);
    self;
  }

  method draw-circle-v (
      Vector2() $center,
      Int()     $radius,
      Color()   $color
  ) {
    my int32 $r = $radius;

    image-draw-circle-v($!image, $center, $r, $color);
    self;
  }

  # method draw-line (
  #     int32 $startPosX,
  #     int32 $startPosY,
  #     int32 $endPosX,
  #     int32 $endPosY,
  #     Color $color
  # ) {
  #   image-draw-line($!image, ...);
  # }

  method draw-line-v (
    Vector2() $start,
    Vector2() $end,
    Color()   $color
  ) {
    image-draw-line-v($!image, $start, $end, $color);
    self;
  }

  method draw-pixel (
    Int()   $posX,
    Int()   $posY,
    Color() $color
  ) {
    my int32 ($x, $y) = ($posX, $posY);

    image-draw-pixel($!image, $x, $y, $color);
    self;
  }

  method draw-pixel-v (Vector2() $position, Color() $color) {
    image-draw-pixel-v($!image, $position, $color);
    self;
  }

  method draw-rectangle (
    Int()   $posX,
    Int()   $posY,
    Int()   $width,
    Int()   $height,
    Color() $color
  ) {
    my int32 ($x, $y, $w, $h) = ($posX, $posY, $width, $height);

    image-draw-rectangle($!image, $x, $y, $w, $h, $color);
    self;
  }

  method draw-rectangle-lines (
    Rectangle() $rec,
    Int()       $thick,
    Color()     $color
  ) {
    my int32 $t = $thick;

    image-draw-rectangle-lines($!image, $rec, $t, $color);
    self;
  }

  method draw-rectangle-rec (Rectangle() $rec, Color() $color) {
    image-draw-rectangle-rec($!image, $rec, $color);
    self;
  }

  method draw-rectangle-v (
      Vector2() $position,
      Vector2() $size,
      Color()   $color
  ) {
    image-draw-rectangle-v($!image, $position, $size, $color);
    self;
  }

  method draw-text (
      Str()   $text,
      Int()   $posX,
      Int()   $posY,
      Int()   $fontSize,
      Color() $color
  ) {
    my int32 ($x, $y, $f) = ($posX, $posY, $fontSize);

    image-draw-text($!image, $text, $x, $y, $f);
    self;
  }

  multi method draw-text-ex (
    Font()     $font,
    Str()      $text,
    Vector2()  $position,
    Num()      $spacing,
    Color()    $tint,
    Num()     :$size      = $font.baseSize,
  ) {
    samewith($font, $text, $position, $size, $spacing, $tint);
  }
  multi method draw-text-ex (
    Font()    $font,
    Str()     $text,
    Vector2() $position,
    Num()     $fontSize,
    Num()     $spacing,
    Color()   $tint
  ) {
    my num32 ($f, $s) = ($fontSize, $spacing);

    image-draw-text-ex($!image, $font, $text, $position, $f, $s, $tint);
    self;
  }

  method flip-horizontal {
    image-flip-horizontal($!image);
    self;
  }

  method flip-vertical {
    image-flip-vertical($!image);
    self;
  }

  method format (Int() $newFormat) {
    my int32 $f = $newFormat;

    image-format($!image, $f);
    self;
  }

  method from-image (Rectangle() $rec) {
    my $image = image-from-image($!image, $rec);
    self.new($image);
  }

  # method kernel-convolution (
  #     num32 $kernel,
  #     int32 $kernelSize
  # ) {
  #   image-kernel-convolution($!image, ...);
  # }

  method mipmaps {
    image-mipmaps($!image);
  }

  method resize (Int() $newWidth, Int() $newHeight) {
    my int32 ($w, $h) = ($newWidth, $newHeight);

    image-resize($!image, $w, $h);
    self;
  }

  # method resize-canvas (
  #     int32 $newWidth,
  #     int32 $newHeight,
  #     int32 $offsetX,
  #     int32 $offsetY,
  #     Color $fill
  # ) {
  #   image-resize-canvas($!image, ...);
  # }

  # method resize-nn (
  #     int32 $newWidth,
  #     int32 $newHeight
  # ) {
  #   image-resize-nn($!image, ...);
  # }

  method rotate (Int() $degrees) {
    my int32 $d = $degrees;

    image-rotate($!image, $d);
    self;
  }

  method rotate-ccw {
    image-rotate-ccw($!image);
    self;
  }

  method rotate-cw {
    image-rotate-cw($!image);
    self;
  }

  method to-pot (Color() $fill) {
    image-to-pot($!image, $fill);
    self;
  }

  method is-ready {
    is-image-ready($!image);
  }

  # method load-font-from (
  #     Color $key,
  #     int32 $firstChar
  # ) {
  #   load-font-from-image($!image, ...);
  # }

  method load-colors {
    load-image-colors($!image);
    self;
  }

  # method load-palette (
  #     int32 $maxPaletteSize,
  #     int32 $colorCount
  # ) {
  #   load-image-palette($!image, ...);
  # }

  # cw: Belongs with TextureCubemap
  # method load-texture-cubemap (Int() $layout) {
  #   my int32 $l = $layout;
  #
  #   load-texture-cubemap($!image, $l);
  # }

  method set-window-icon {
    set-window-icon($!image);
  }

  method set-window-icons (Int() $count) {
    my int32 $c = $count;

    set-window-icons($!image, $c);
  }

  method unload {
    unload-image($!image);
  }

  multi method load (ResourceFile $file) {
    samewith($file.absolute);
  }
  multi method load (Str $fileName) {
    my $image = load-image($fileName);
    self.new($image);
  }
  multi method load ($_) {
    when Distribution::Resource { samewith( .absolute ) }
    when IO                     { samewith( .absolute ) }
    when .^can('IO')            { samewith( .absolute ) }
    when .^can('Str')           { samewith( .Str      ) }

    default {
      X::Raylib::InvalidObject.new( object => $_ ).throw;
    }
  }

  # load-image-raw (
  #   Str   $fileName,
  #   int32 $width,
  #   int32 $height,
  #   int32 $format,
  #   int32 $headerSize
  # )
  # load-image-svg (
  #   Str   $fileNameOrString,
  #   int32 $width,
  #   int32 $height
  # )
  # load-image-anim (
  #   Str   $fileName,
  #   int32 $frames    is rw
  # )
  # load-image-from-memory (
  #   Str           $fileType,
  #   CArray[uint8] $fileData,
  #   int32         $dataSize
  # )
  # load-image-from-screen

}
