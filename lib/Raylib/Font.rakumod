use v6;

use NativeCall;
use Method::Also;

use Raylib::Bindings;
use Raylib::Raw::Exceptions;
use Raylib::Raw::Font;

class Raylib::Font {
  has Font $!font handles(*) is built;

  method Raylib::Bindings::Font
    is also<Font>
  { $!font }

  multi method new (Font $font) {
    return Nil unless $font;
    self.bless( :$font );
  }

  method get-default {
    my $font = get-font-default();
    $font.gist.say;
    self.new($font);
  }

  method draw-codepoint (
    Int()     $codepoint,
    Vector2() $position,
    Num()     $fontSize,
    Color()   $tint
  ) {
    my int32 $c = $codepoint;
    my num32 $f = $fontSize;

    draw-text-codepoint($!font, $c, $position, $f, $tint);
  }

  multi method draw-codepoints (
                  @codepoints,
    Vector2()     $position,
    Num()         $fontSize,
    Num()         $spacing,
    Color()       $tint
  ) {
    if @codepoints.grep( * !~~ Int ) -> $i {
      X::Raylib::InvalidObject.new( object => $i.head ).throw
    }

    samewith(
      CArray[int32].new(@codepoints),
      @codepoints.elems,
      $position,
      $fontSize,
      $spacing,
      $tint
    );
  }
  multi method draw-codepoints (
    CArray[int32] $codepoints,
    Int()         $codepointCount,
    Vector2()     $position,
    Num()         $fontSize,
    Num()         $spacing,
    Color()       $tint
  ) {
    my num32 ($f, $s) = ($fontSize, $spacing);
    my int32  $c      =  $codepointCount;

    draw-text-codepoints($!font, $codepoints, $c, $position, $f, $s, $tint);
  }

  multi method draw-ex (
    Str()      $text,
    Vector2()  $position,
    Num()      $spacing,
    Color()    $tint,
    Num()     :$size       = self.baseSize,
  ) {
    samewith($text, $position, $size, $spacing, $tint);
  }
  multi method draw-ex (
    Str()     $text,
    Vector2() $position,
    Num()     $fontSize,
    Num()     $spacing,
    Color()   $tint
  ) {
    my num32 ($f, $s) = ($fontSize, $spacing);

    draw-text-ex($!font, $text, $position, $f, $s, $tint);
  }

  method draw-pro (
      Str()     $text,
      Vector2() $position,
      Vector2() $origin,
      Num()     $rotation,
      Num()     $fontSize,
      Num()     $spacing,
      Color()   $tint
  ) {
    my num32 ($r, $f, $s) = ($rotation, $fontSize, $spacing);

    draw-text-pro($!font, $text, $position, $origin, $r, $f, $s, $tint);
  }

  method export-as-code (Str() $fileName) {
    export-font-as-code($!font, $fileName);
  }

  method get-glyph-atlas-rec (Int() $codepoint) {
    my int32 $c = $codepoint;

    get-glyph-atlas-rec($!font, $c);
  }

  method get-glyph-index (Int() $codepoint) {
    my int32 $c = $codepoint;

    get-glyph-index($!font, $c);
  }

  method get-glyph-info (Int() $codepoint) {
    my int32 $c = $codepoint;

    get-glyph-info($!font, $c);
  }

  method is-ready {
    is-font-ready($!font);
  }

  multi method load (ResourceFile $file) {
    samewith($file.absolute);
  }
  multi method load (Str $fileName) {
    my $font = load-font($fileName);
    self.new($font);
  }
  multi method load ($_) {
    when Distribution::Resource { samewith( .absolute ) }
    when .^can('IO')            { samewith( .IO  )      }
    when .^can('Str')           { samewith( .Str )      }

    default {
      X::Raylib::InvalidObject.new( object => $_ ).throw
    }
  }

  multi method load-ex ($_, Int() $fontSize, @codepoints) {
    when .^can('IO')  { samewith( .IO  ) }
    when .^can('Str') { samewith( .Str ) }

    default {
      X::Raylib::InvalidObject.new( object => $_ ).throw
    }
  }
  multi method load-ex (
    ResourceFile $file,
    Int()        $fontSize,
                 @codepoints
  ) {
    samewith($file.absolute, $fontSize, @codepoints);
  }
  multi method load-ex (
    Str   $fileName,
    Int() $fontSize,
          @codepoints,
  ) {
    if @codepoints.grep( * !~~ Int ) -> $i {
      X::Raylib::InvalidObject.new( object => $i.head ).throw
    }

    samewith(
      $fileName,
      $fontSize,
      CArray[int32].new(@codepoints),
      @codepoints.elems
    );
  }
  multi method load-ex (
    Str()         $fileName,
    Int()         $fontSize,
    CArray[int32] $codepoints,
    Int()         $codepointCount
  ) {
    my int32 ($f, $c) = ($fontSize, $codepointCount);

    my $font = load-font-ex($fileName, $f, $codepoints, $c);
    self.new($font);
  }

  # method load-from-memory (
  #   Str           $fileType,
  #   CArray[uint8] $fileData,
  #   int32         $dataSize,
  #   int32         $fontSize,
  #   CArray[int32] $codepoints,
  #   int32         $codepointCount
  # ) {
  #   my $font = load-font-from-memory (
  #     $fileType,
  #     $fileData,
  #     $dataSize,
  #     $fontSize,
  #     $codepoints,
  #     $codepointCount
  #   )
  #   self.new($font);
  # }

  multi method measure-ex (
    Str()  $text,
    Num()  $spacing,
    Num() :$size     = self.baseSize
  ) {
    samewith($text, $size, $spacing);
  }
  multi method measure-ex (Str() $text, Num() $fontSize, Num() $spacing) {
    my num32 ($f, $s) = ($fontSize, $spacing);

    measure-text-ex($!font, $text, $f, $s);
  }

  method unload {
    unload-font($!font);
  }

}
