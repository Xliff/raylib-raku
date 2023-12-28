use v6;

use NativeCall;

use Raylib::Bindings;

unit package Raylib::Raw::Image;

sub export-image (
    Image $image,
    Str $fileName
    --> bool
  )
  is export
  is symbol("ExportImage_pointerized")
  is native(LIBRAYLIB) {*};

sub export-image-as-code (
    Image $image,
    Str $fileName
    --> bool
  )
  is export
  is symbol("ExportImageAsCode_pointerized")
  is native(LIBRAYLIB) {*};

sub export-image-to-memory (
    Image $gimage,
    Str $fileType,
    int32 $fileSize
    --> Str
  )
  is export
  is symbol("ExportImageToMemory_pointerized")
  is native(LIBRAYLIB) {*};

sub gen-mesh-cubicmap (
    Image $cubicmap,
    Vector3 $cubeSize
    --> Mesh
  )
  is export
  is symbol("GenMeshCubicmap_pointerized")
  is native(LIBRAYLIB) {*};

sub gen-mesh-heightmap (
    Image $heightmap,
    Vector3 $size
    --> Mesh
  )
  is export
  is symbol("GenMeshHeightmap_pointerized")
  is native(LIBRAYLIB) {*};

sub get-image-alpha-border (
    Image $image,
    num32 $threshold
    --> Rectangle
  )
  is export
  is symbol("GetImageAlphaBorder_pointerized")
  is native(LIBRAYLIB) {*};

sub get-image-color (
    Image $image,
    int32 $x,
    int32 $y
    --> Color
  )
  is export
  is symbol("GetImageColor_pointerized")
  is native(LIBRAYLIB) {*};

sub image-alpha-clear (
    Image $image,
    Color $color,
    num32 $threshold
  )
  is export
  is symbol("ImageAlphaClear_pointerized")
  is native(LIBRAYLIB) {*};

sub image-alpha-crop (
    Image $image,
    num32 $threshold
  )
  is export
  is symbol("ImageAlphaCrop")
  is native(LIBRAYLIB) {*};

sub image-alpha-mask (
    Image $image,
    Image $alphaMask
  )
  is export
  is symbol("ImageAlphaMask_pointerized")
  is native(LIBRAYLIB) {*};

sub image-alpha-premultiply (
    Image $image
  )
  is export
  is symbol("ImageAlphaPremultiply")
  is native(LIBRAYLIB) {*};

sub image-blur-gaussian (
    Image $image,
    int32 $blurSize
  )
  is export
  is symbol("ImageBlurGaussian")
  is native(LIBRAYLIB) {*};

sub image-clear-background (
    Image $dst,
    Color $color
  )
  is export
  is symbol("ImageClearBackground_pointerized")
  is native(LIBRAYLIB) {*};

sub image-color-brightness (
    Image $image,
    int32 $brightness
  )
  is export
  is symbol("ImageColorBrightness")
  is native(LIBRAYLIB) {*};

sub image-color-contrast (
    Image $image,
    num32 $contrast
  )
  is export
  is symbol("ImageColorContrast")
  is native(LIBRAYLIB) {*};

sub image-color-grayscale (
    Image $image
  )
  is export
  is symbol("ImageColorGrayscale")
  is native(LIBRAYLIB) {*};

sub image-color-invert (
    Image $image
  )
  is export
  is symbol("ImageColorInvert")
  is native(LIBRAYLIB) {*};

sub image-color-replace (
    Image $image,
    Color $color,
    Color $replace
  )
  is export
  is symbol("ImageColorReplace_pointerized")
  is native(LIBRAYLIB) {*};

sub image-color-tint (
    Image $image,
    Color $color
  )
  is export
  is symbol("ImageColorTint_pointerized")
  is native(LIBRAYLIB) {*};

sub image-copy (
    Image $image
    --> Image
  )
  is export
  is symbol("ImageCopy_pointerized")
  is native(LIBRAYLIB) {*};

sub image-crop (
    Image $image,
    Rectangle $crop
  )
  is export
  is symbol("ImageCrop_pointerized")
  is native(LIBRAYLIB) {*};

sub image-dither (
    Image $image,
    int32 $rBpp,
    int32 $gBpp,
    int32 $bBpp,
    int32 $aBpp
  )
  is export
  is symbol("ImageDither")
  is native(LIBRAYLIB) {*};

sub image-draw (
    Image $dst,
    Image $src,
    Rectangle $srcRec,
    Rectangle $dstRec,
    Color $tint
  )
  is export
  is symbol("ImageDraw_pointerized")
  is native(LIBRAYLIB) {*};

sub image-draw-circle (
    Image $dst,
    int32 $centerX,
    int32 $centerY,
    int32 $radius,
    Color $color
  )
  is export
  is symbol("ImageDrawCircle_pointerized")
  is native(LIBRAYLIB) {*};

sub image-draw-circle-lines (
    Image $dst,
    int32 $centerX,
    int32 $centerY,
    int32 $radius,
    Color $color
  )
  is export
  is symbol("ImageDrawCircleLines_pointerized")
  is native(LIBRAYLIB) {*};

sub image-draw-circle-lines-v (
    Image $dst,
    Vector2 $center,
    int32 $radius,
    Color $color
  )
  is export
  is symbol("ImageDrawCircleLinesV_pointerized")
  is native(LIBRAYLIB) {*};

sub image-draw-circle-v (
    Image $dst,
    Vector2 $center,
    int32 $radius,
    Color $color
  )
  is export
  is symbol("ImageDrawCircleV_pointerized")
  is native(LIBRAYLIB) {*};

sub image-draw-line (
    Image $dst,
    int32 $startPosX,
    int32 $startPosY,
    int32 $endPosX,
    int32 $endPosY,
    Color $color
  )
  is export
  is symbol("ImageDrawLine_pointerized")
  is native(LIBRAYLIB) {*};

sub image-draw-line-v (
    Image $dst,
    Vector2 $start,
    Vector2 $end,
    Color $color
  )
  is export
  is symbol("ImageDrawLineV_pointerized")
  is native(LIBRAYLIB) {*};

sub image-draw-pixel (
    Image $dst,
    int32 $posX,
    int32 $posY,
    Color $color
  )
  is export
  is symbol("ImageDrawPixel_pointerized")
  is native(LIBRAYLIB) {*};

sub image-draw-pixel-v (
    Image $dst,
    Vector2 $position,
    Color $color
  )
  is export
  is symbol("ImageDrawPixelV_pointerized")
  is native(LIBRAYLIB) {*};

sub image-draw-rectangle (
    Image $dst,
    int32 $posX,
    int32 $posY,
    int32 $width,
    int32 $height,
    Color $color
  )
  is export
  is symbol("ImageDrawRectangle_pointerized")
  is native(LIBRAYLIB) {*};

sub image-draw-rectangle-lines (
    Image $dst,
    Rectangle $rec,
    int32 $thick,
    Color $color
  )
  is export
  is symbol("ImageDrawRectangleLines_pointerized")
  is native(LIBRAYLIB) {*};

sub image-draw-rectangle-rec (
    Image $dst,
    Rectangle $rec,
    Color $color
  )
  is export
  is symbol("ImageDrawRectangleRec_pointerized")
  is native(LIBRAYLIB) {*};

sub image-draw-rectangle-v (
    Image $dst,
    Vector2 $position,
    Vector2 $size,
    Color $color
  )
  is export
  is symbol("ImageDrawRectangleV_pointerized")
  is native(LIBRAYLIB) {*};

sub image-draw-text (
    Image $dst,
    Str $text,
    int32 $posX,
    int32 $posY,
    int32 $fontSize,
    Color $color
  )
  is export
  is symbol("ImageDrawText_pointerized")
  is native(LIBRAYLIB) {*};

sub image-draw-text-ex (
    Image $dst,
    Font $font,
    Str $text,
    Vector2 $position,
    num32 $fontSize,
    num32 $spacing,
    Color $tint
  )
  is export
  is symbol("ImageDrawTextEx_pointerized")
  is native(LIBRAYLIB) {*};

sub image-flip-horizontal (
    Image $image
  )
  is export
  is symbol("ImageFlipHorizontal")
  is native(LIBRAYLIB) {*};

sub image-flip-vertical (
    Image $image
  )
  is export
  is symbol("ImageFlipVertical")
  is native(LIBRAYLIB) {*};

sub image-format (
    Image $image,
    int32 $newFormat
  )
  is export
  is symbol("ImageFormat")
  is native(LIBRAYLIB) {*};

sub image-from-image (
    Image $image,
    Rectangle $rec
    --> Image
  )
  is export
  is symbol("ImageFromImage_pointerized")
  is native(LIBRAYLIB) {*};

sub image-kernel-convolution (
    Image $image,
    num32 $kernel,
    int32 $kernelSize
  )
  is export
  is symbol("ImageKernelConvolution")
  is native(LIBRAYLIB) {*};

sub image-mipmaps (
    Image $image
  )
  is export
  is symbol("ImageMipmaps")
  is native(LIBRAYLIB) {*};

sub image-resize (
    Image $image,
    int32 $newWidth,
    int32 $newHeight
  )
  is export
  is symbol("ImageResize")
  is native(LIBRAYLIB) {*};

sub image-resize-canvas (
    Image $image,
    int32 $newWidth,
    int32 $newHeight,
    int32 $offsetX,
    int32 $offsetY,
    Color $fill
  )
  is export
  is symbol("ImageResizeCanvas_pointerized")
  is native(LIBRAYLIB) {*};

sub image-resize-nn (
    Image $image,
    int32 $newWidth,
    int32 $newHeight
  )
  is export
  is symbol("ImageResizeNN")
  is native(LIBRAYLIB) {*};

sub image-rotate (
    Image $image,
    int32 $degrees
  )
  is export
  is symbol("ImageRotate")
  is native(LIBRAYLIB) {*};

sub image-rotate-ccw (
    Image $image
  )
  is export
  is symbol("ImageRotateCCW")
  is native(LIBRAYLIB) {*};

sub image-rotate-cw (
    Image $image
  )
  is export
  is symbol("ImageRotateCW")
  is native(LIBRAYLIB) {*};

sub image-to-pot (
    Image $image,
    Color $fill
  )
  is export
  is symbol("ImageToPOT_pointerized")
  is native(LIBRAYLIB) {*};

sub is-image-ready (
    Image $image
    --> bool
  )
  is export
  is symbol("IsImageReady_pointerized")
  is native(LIBRAYLIB) {*};

sub load-font-from-image (
    Image $image,
    Color $key,
    int32 $firstChar
    --> Font
  )
  is export
  is symbol("LoadFontFromImage_pointerized")
  is native(LIBRAYLIB) {*};

sub load-image-colors (
    Image $image
    --> Color
  )
  is export
  is symbol("LoadImageColors_pointerized")
  is native(LIBRAYLIB) {*};

sub load-image-palette (
    Image $image,
    int32 $maxPaletteSize,
    int32 $colorCount
    --> Color
  )
  is export
  is symbol("LoadImagePalette_pointerized")
  is native(LIBRAYLIB) {*};

# cw: Belongs with TextureCubemap
# sub load-texture-cubemap (
#     Image $image,
#     int32 $layout
#     --> TextureCubemap
#   )
#   is export
#   is symbol("LoadTextureCubemap_pointerized")
#   is native(LIBRAYLIB) {*};

sub set-window-icon (
    Image $image
  )
  is export
  is symbol("SetWindowIcon_pointerized")
  is native(LIBRAYLIB) {*};

sub set-window-icons (
    Image $images,
    int32 $count
  )
  is export
  is symbol("SetWindowIcons")
  is native(LIBRAYLIB) {*};

sub unload-image (
    Image $image
  )
  is export
  is symbol("UnloadImage_pointerized")
  is native(LIBRAYLIB) {*};

our sub load-image (Str $fileName)
  returns Image
  is      export
  is      native(LIBRAYLIB)
  is      symbol('LoadImage_pointerized'){ * }

our sub load-image-raw (
  Str   $fileName,
  int32 $width,
  int32 $height,
  int32 $format,
  int32 $headerSize
)
  returns Image
  is      export
  is      native(LIBRAYLIB)
  is      symbol('LoadImageRaw_pointerized'){ * }

our sub load-image-svg (
  Str   $fileNameOrString,
  int32 $width,
  int32 $height
)
  returns Image
  is      export
  is      native(LIBRAYLIB)
  is      symbol('LoadImageSvg_pointerized'){ * }

our sub load-image-anim (
  Str   $fileName,
  int32 $frames    is rw
)
  returns Image
  is      export
  is      native(LIBRAYLIB)
  is      symbol('LoadImageAnim_pointerized'){ * }

our sub load-image-from-memory (
  Str           $fileType,
  CArray[uint8] $fileData,
  int32         $dataSize
)
  returns Image
  is      export
  is      native(LIBRAYLIB)
  is      symbol('LoadImageFromMemory_pointerized'){ * }

our sub load-image-from-screen ()
  returns Image
  is      export
  is      native(LIBRAYLIB)
  is      symbol('LoadImageFromScreen_pointerized'){ * }

our sub gen-image-color (
  int32 $width,
  int32 $height,
  Color $color
)
  returns Image
  is      export
  is      native(LIBRAYLIB)
  is      symbol('GenImageColor_pointerized'){ * }

our sub gen-image-gradient-linear (
  int32 $width,
  int32 $height,
  int32 $direction,
  Color $start,
  Color $end
)
  returns Image
  is      export
  is      native(LIBRAYLIB)
  is      symbol('GenImageGradientLinear_pointerized'){ * }

our sub gen-image-gradient-radial (
  int32 $width,
  int32 $height,
  num32 $density,
  Color $inner,
  Color $outer
)
  returns Image
  is      export
  is      native(LIBRAYLIB)
  is      symbol('GenImageGradientRadial_pointerized'){ * }

our sub gen-image-gradient-square (
  int32 $width,
  int32 $height,
  num32 $density,
  Color $inner,
  Color $outer
)
  returns Image
  is      export
  is      native(LIBRAYLIB)
  is      symbol('GenImageGradientSquare_pointerized'){ * }

our sub gen-image-checked (
  int32 $width,
  int32 $height,
  int32 $checksX,
  int32 $checksY,
  Color $col1,
  Color $col2
)
  returns Image
  is      export
  is      native(LIBRAYLIB)
  is      symbol('GenImageChecked_pointerized'){ * }

our sub gen-image-white-noise (
  int32 $width,
  int32 $height,
  num32 $factor
)
  returns Image
  is      export
  is      native(LIBRAYLIB)
  is      symbol('GenImageWhiteNoise_pointerized'){ * }

our sub gen-image-perlin-noise (
  int32 $width,
  int32 $height,
  int32 $offsetX,
  int32 $offsetY,
  num32 $scale
)
  returns Image
  is      export
  is      native(LIBRAYLIB)
  is      symbol('GenImagePerlinNoise_pointerized'){ * }

our sub gen-image-cellular (
  int32 $width,
  int32 $height,
  int32 $tileSize
)
  returns Image
  is      export
  is      native(LIBRAYLIB)
  is      symbol('GenImageCellular_pointerized'){ * }

our sub gen-image-text (
  int32 $width,
  int32 $height,
  Str   $text
)
  returns Image
  is      export
  is      native(LIBRAYLIB)
  is      symbol('GenImageText_pointerized'){ * }
