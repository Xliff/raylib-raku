use v6;

use NativeCall;

use Raylib::Raw::Definitions;
use Raylib::Raw::Structs;

unit package Raylib::Raw::Texture2D;

sub draw-texture (
    Texture2D $texture,
    int32 $posX,
    int32 $posY,
    Color $tint
  )
  is export
  is symbol("DrawTexture_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-texture-ex (
    Texture2D $texture,
    Vector2 $position,
    num32 $rotation,
    num32 $scale,
    Color $tint
  )
  is export
  is symbol("DrawTextureEx_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-texture-npatch (
    Texture2D $texture,
    NPatchInfo $nPatchInfo,
    Rectangle $dest,
    Vector2 $origin,
    num32 $rotation,
    Color $tint
  )
  is export
  is symbol("DrawTextureNPatch_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-texture-pro (
    Texture2D $texture,
    Rectangle $source,
    Rectangle $dest,
    Vector2 $origin,
    num32 $rotation,
    Color $tint
  )
  is export
  is symbol("DrawTexturePro_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-texture-rec (
  Texture2D $texture,
  Rectangle $source,
  Vector2 $position,
  Color $tint
)
is export
is symbol("DrawTextureRec_pointerized")
is native(LIBRAYLIB) {*};

sub draw-texture-v (
    Texture2D $texture,
    Vector2 $position,
    Color $tint
  )
  is export
  is symbol("DrawTextureV_pointerized")
  is native(LIBRAYLIB) {*};

sub gen-texture-mipmaps (
    Texture2D $texture
  )
  is export
  is symbol("GenTextureMipmaps")
  is native(LIBRAYLIB) {*};

sub is-texture-ready (
    Texture2D $texture
    --> bool
  )
  is export
  is symbol("IsTextureReady_pointerized")
  is native(LIBRAYLIB) {*};

sub load-image-from-texture (
    Texture2D $texture
    --> Image
  )
  is export
  is symbol("LoadImageFromTexture_pointerized")
  is native(LIBRAYLIB) {*};

sub set-shapes-texture (
    Texture2D $texture,
    Rectangle $source
  )
  is export
  is symbol("SetShapesTexture_pointerized")
  is native(LIBRAYLIB) {*};

sub set-texture-filter (
    Texture2D $texture,
    int32 $filter
  )
  is export
  is symbol("SetTextureFilter_pointerized")
  is native(LIBRAYLIB) {*};

sub set-texture-wrap (
    Texture2D $texture,
    int32 $wrap
  )
  is export
  is symbol("SetTextureWrap_pointerized")
  is native(LIBRAYLIB) {*};

sub unload-texture (
    Texture2D $texture
  )
  is export
  is symbol("UnloadTexture_pointerized")
  is native(LIBRAYLIB) {*};

sub update-texture (
    Texture2D $texture,
    Pointer[void] $pixels
  )
  is export
  is symbol("UpdateTexture_pointerized")
  is native(LIBRAYLIB) {*};

sub update-texture-rec (
    Texture2D $texture,
    Rectangle $rec,
    Pointer[void] $pixels
  )
  is export
  is symbol("UpdateTextureRec_pointerized")
  is native(LIBRAYLIB) {*};

our sub load-texture (Str $fileName)
  returns Texture2D
  is export
  is native(LIBRAYLIB)
  is symbol('LoadTexture_pointerized'){ * }

our sub load-texture-from-image (Image $image)
  returns Texture2D
  is export
  is native(LIBRAYLIB)
  is symbol('LoadTextureFromImage_pointerized'){ * }
