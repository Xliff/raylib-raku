use v6;

use NativeCall;

use Raylib::Bindings;

unit package Raylib::Raw::Font;

sub draw-text-codepoint (
    Font $font,
    int32 $codepoint,
    Vector2 $position,
    num32 $fontSize,
    Color $tint
  )
  is export
  is symbol("DrawTextCodepoint_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-text-codepoints (
    Font $font,
    int32 $codepoints,
    int32 $codepointCount,
    Vector2 $position,
    num32 $fontSize,
    num32 $spacing,
    Color $tint
  )
  is export
  is symbol("DrawTextCodepoints_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-text-ex (
    Font $font,
    Str $text,
    Vector2 $position,
    num32 $fontSize,
    num32 $spacing,
    Color $tint
  )
  is export
  is symbol("DrawTextEx_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-text-pro (
    Font $font,
    Str $text,
    Vector2 $position,
    Vector2 $origin,
    num32 $rotation,
    num32 $fontSize,
    num32 $spacing,
    Color $tint
  )
  is export
  is symbol("DrawTextPro_pointerized")
  is native(LIBRAYLIB) {*};

sub export-font-as-code (
    Font $font,
    Str $fileName
    --> bool
  )
  is export
  is symbol("ExportFontAsCode_pointerized")
  is native(LIBRAYLIB) {*};

sub get-glyph-atlas-rec (
    Font $font,
    int32 $codepoint
    --> Rectangle
  )
  is export
  is symbol("GetGlyphAtlasRec_pointerized")
  is native(LIBRAYLIB) {*};

sub get-glyph-index (
    Font $font,
    int32 $codepoint
    --> int32
  )
  is export
  is symbol("GetGlyphIndex_pointerized")
  is native(LIBRAYLIB) {*};

sub get-glyph-info (
    Font $font,
    int32 $codepoint
    --> GlyphInfo
  )
  is export
  is symbol("GetGlyphInfo_pointerized")
  is native(LIBRAYLIB) {*};

sub is-font-ready (
    Font $font
    --> bool
)
  is export
  is symbol("IsFontReady_pointerized")
  is native(LIBRAYLIB) {*};

sub measure-text-ex (
    Font $font,
    Str $text,
    num32 $fontSize,
    num32 $spacing
    --> Vector2
)
  is export
  is symbol("MeasureTextEx_pointerized")
  is native(LIBRAYLIB) {*};

sub unload-font (Font $font)
  is export
  is symbol("UnloadFont_pointerized")
  is native(LIBRAYLIB) {*};

our sub get-font-default ()
  returns Font
  is      export
  is      native(LIBRAYLIB)
  is      symbol('GetFontDefault_pointerized'){ * }

our sub load-font (Str $fileName)
  returns Font
  is      export
  is      native(LIBRAYLIB)
  is      symbol('LoadFont_pointerized'){ * }

our sub load-font-ex (
  Str           $fileName,
  int32         $fontSize,
  CArray[int32] $codepoints,
  int32         $codepointCount
)
  returns Font
  is      export
  is      native(LIBRAYLIB)
  is      symbol('LoadFontEx_pointerized'){ * }

our sub load-font-from-memory (
  Str           $fileType,
  CArray[uint8] $fileData,
  int32         $dataSize,
  int32         $fontSize,
  CArray[int32] $codepoints,
  int32         $codepointCount
)
  returns Font
  is      export
  is      native(LIBRAYLIB)
  is      symbol('LoadFontFromMemory_pointerized'){ * }
