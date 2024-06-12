use v6.c;

use NativeCall;

use Raylib::Raw::Definitions;
use Raylib::Raw::Structs;

unit package Raylib::Raw::RLGL;

### /home/cbwood/Projects//raylib-raku/rlgl-trimmed.h

sub rlActiveDrawBuffers (int32 $count)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlActiveTextureSlot (int32 $slot)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlBegin (int32 $mode)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlBindFramebuffer (
  int32 $target,
  int32 $framebuffer
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlBindImageTexture (
  int32 $id,
  int32 $index,
  int32 $format,
  uint32 $readonly
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlBindShaderBuffer (
  int32 $id,
  int32 $index
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlBlitFramebuffer (
  int32 $srcX,
  int32 $srcY,
  int32 $srcWidth,
  int32 $srcHeight,
  int32 $dstX,
  int32 $dstY,
  int32 $dstWidth,
  int32 $dstHeight,
  int32 $bufferMask
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlCheckErrors
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlCheckRenderBatchLimit (int32 $vCount)
  returns uint32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlClearColor (
  uint8 $r,
  uint8 $g,
  uint8 $b,
  uint8 $a
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlClearScreenBuffers
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlColor3f (
  num32 $x,
  num32 $y,
  num32 $z
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlColor4f (
  num32 $x,
  num32 $y,
  num32 $z,
  num32 $w
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlColor4ub (
  uint8 $r,
  uint8 $g,
  uint8 $b,
  uint8 $a
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlColorMask (
  uint32 $r,
  uint32 $g,
  uint32 $b,
  uint32 $a
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlCompileShader (
  Str  $shaderCode,
  int32 $type
)
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlComputeShaderDispatch (
  int32 $groupX,
  int32 $groupY,
  int32 $groupZ
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlCopyShaderBuffer (
  int32 $destId,
  int32 $srcId,
  int32 $destOffset,
  int32 $srcOffset,
  int32 $count
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlCubemapParameters (
  int32 $id,
  int32 $param,
  int32 $value
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDisableBackfaceCulling
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDisableColorBlend
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDisableDepthMask
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDisableDepthTest
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDisableFramebuffer
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDisableScissorTest
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDisableShader
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDisableSmoothLines
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDisableStatePointer (int32 $vertexAttribType)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDisableStereoRender
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDisableTexture
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDisableTextureCubemap
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDisableVertexArray
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDisableVertexAttribute (int32 $index)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDisableVertexBuffer
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDisableVertexBufferElement
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDisableWireMode
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDrawRenderBatch (rlRenderBatch $batch)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDrawRenderBatchActive
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDrawVertexArray (
  int32 $offset,
  int32 $count
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDrawVertexArrayElements (
  int32    $offset,
  int32    $count,
  Pointer $buffer
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDrawVertexArrayElementsInstanced (
  int32    $offset,
  int32    $count,
  Pointer $buffer,
  int32    $instances
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlDrawVertexArrayInstanced (
  int32 $offset,
  int32 $count,
  int32 $instances
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlEnableBackfaceCulling
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlEnableColorBlend
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlEnableDepthMask
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlEnableDepthTest
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlEnableFramebuffer (int32 $id)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlEnablePointMode
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlEnableScissorTest
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlEnableShader (int32 $id)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlEnableSmoothLines
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlEnableStatePointer (
  int32    $vertexAttribType,
  Pointer $buffer
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlEnableStereoRender
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlEnableTexture (int32 $id)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlEnableTextureCubemap (int32 $id)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlEnableVertexArray (int32 $vaoId)
  returns uint32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlEnableVertexAttribute (int32 $index)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlEnableVertexBuffer (int32 $id)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlEnableVertexBufferElement (int32 $id)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlEnableWireMode
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlEnd
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlFramebufferAttach (
  int32 $fboId,
  int32 $texId,
  int32 $attachType,
  int32 $texType,
  int32 $mipLevel
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlFramebufferComplete (int32 $id)
  returns uint32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlFrustum (
  num64 $left,
  num64 $right,
  num64 $bottom,
  num64 $top,
  num64 $znear,
  num64 $zfar
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGenTextureMipmaps (
  int32 $id,
  int32 $width,
  int32 $height,
  int32 $format,
  int32 $mipmaps is rw
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGetActiveFramebuffer
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGetCullDistanceFar
  returns num64
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGetCullDistanceNear
  returns num64
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGetFramebufferHeight
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGetFramebufferWidth
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGetGlTextureFormats (
  int32 $format,
  int32 $glInternalFormat is rw,
  int32 $glFormat         is rw,
  int32 $glType           is rw
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGetLineWidth
  returns num32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGetLocationAttrib (
  int32 $shaderId,
  Str  $attribName
)
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGetLocationUniform (
  int32 $shaderId,
  Str  $uniformName
)
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGetMatrixModelview
  returns Matrix
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGetMatrixProjection
  returns Matrix
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGetMatrixProjectionStereo (int32 $eye)
  returns Matrix
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGetMatrixTransform
  returns Matrix
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGetMatrixViewOffsetStereo (int32 $eye)
  returns Matrix
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGetPixelFormatName (int32 $format)
  returns Str
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGetShaderBufferSize (int32 $id)
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGetShaderIdDefault
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGetShaderLocsDefault
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGetTextureIdDefault
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlGetVersion
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlIsStereoRenderEnabled
  returns uint32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlLoadComputeShaderProgram (int32 $shaderId)
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlLoadDrawCube
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlLoadDrawQuad
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlLoadExtensions (Pointer $loader)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlLoadFramebuffer
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlLoadIdentity
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlLoadRenderBatch (
  int32 $numBuffers,
  int32 $bufferElements
)
  returns rlRenderBatch
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlLoadShaderBuffer (
  int32    $size,
  Pointer $data,
  int32    $usageHint
)
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlLoadShaderCode (
  Str $vsCode,
  Str $fsCode
)
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlLoadShaderProgram (
  int32 $vShaderId,
  int32 $fShaderId
)
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlLoadTexture (
  Pointer $data,
  int32    $width,
  int32    $height,
  int32    $format,
  int32    $mipmapCount
)
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlLoadTextureCubemap (
  Pointer $data,
  int32    $size,
  int32    $format
)
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlLoadTextureDepth (
  int32 $width,
  int32 $height,
  uint32 $useRenderBuffer
)
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlLoadVertexArray
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlLoadVertexBuffer (
  Pointer $buffer,
  int32    $size,
  uint32    $dynamic
)
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlLoadVertexBufferElement (
  Pointer $buffer,
  int32    $size,
  uint32    $dynamic
)
  returns int32
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlMatrixMode (int32 $mode)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlMultMatrixf (num32 $matf is rw)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlNormal3f (
  num32 $x,
  num32 $y,
  num32 $z
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlOrtho (
  num64 $left,
  num64 $right,
  num64 $bottom,
  num64 $top,
  num64 $znear,
  num64 $zfar
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlPopMatrix
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlPushMatrix
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlReadScreenPixels (
  int32 $width,
  int32 $height
)
  returns Str
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlReadShaderBuffer (
  int32    $id,
  Pointer $dest,
  int32    $count,
  int32    $offset
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlReadTexturePixels (
  int32 $id,
  int32 $width,
  int32 $height,
  int32 $format
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlRotatef (
  num32 $angle,
  num32 $x,
  num32 $y,
  num32 $z
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlScalef (
  num32 $x,
  num32 $y,
  num32 $z
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlScissor (
  int32 $x,
  int32 $y,
  int32 $width,
  int32 $height
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetBlendFactors (
  int32 $glSrcFactor,
  int32 $glDstFactor,
  int32 $glEquation
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetBlendFactorsSeparate (
  int32 $glSrcRGB,
  int32 $glDstRGB,
  int32 $glSrcAlpha,
  int32 $glDstAlpha,
  int32 $glEqRGB,
  int32 $glEqAlpha
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetBlendMode (int32 $mode)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetClipPlanes (
  num64 $near,
  num64 $far
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetCullFace (int32 $mode)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetFramebufferHeight (int32 $height)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetFramebufferWidth (int32 $width)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetLineWidth (num32 $width)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetMatrixModelview (Matrix $view)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetMatrixProjection (Matrix $proj)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetMatrixProjectionStereo (
  Matrix $right,
  Matrix $left
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetMatrixViewOffsetStereo (
  Matrix $right,
  Matrix $left
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetRenderBatchActive (rlRenderBatch $batch)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetShader (
  int32 $id,
  int32 $locs is rw
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetTexture (int32 $id)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetUniform (
  int32    $locIndex,
  Pointer $value,
  int32    $uniformType,
  int32    $count
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetUniformMatrix (
  int32   $locIndex,
  Matrix $mat
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetUniformSampler (
  int32 $locIndex,
  int32 $textureId
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetVertexAttribute (
  int32 $index,
  int32 $compSize,
  int32 $type,
  uint32 $normalized,
  int32 $stride,
  int32 $offset
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetVertexAttributeDefault (
  int32    $locIndex,
  Pointer $value,
  int32    $attribType,
  int32    $count
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlSetVertexAttributeDivisor (
  int32 $index,
  int32 $divisor
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlTexCoord2f (
  num32 $x,
  num32 $y
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlTextureParameters (
  int32 $id,
  int32 $param,
  int32 $value
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlTranslatef (
  num32 $x,
  num32 $y,
  num32 $z
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlUnloadFramebuffer (int32 $id)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlUnloadRenderBatch (rlRenderBatch $batch)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlUnloadShaderBuffer (int32 $ssboId)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlUnloadShaderProgram (int32 $id)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlUnloadTexture (int32 $id)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlUnloadVertexArray (int32 $vaoId)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlUnloadVertexBuffer (int32 $vboId)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlUpdateShaderBuffer (
  int32    $id,
  Pointer $data,
  int32    $dataSize,
  int32    $offset
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlUpdateTexture (
  int32    $id,
  int32    $offsetX,
  int32    $offsetY,
  int32    $width,
  int32    $height,
  int32    $format,
  Pointer $data
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlUpdateVertexBuffer (
  int32    $bufferId,
  Pointer $data,
  int32    $dataSize,
  int32    $offset
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlUpdateVertexBufferElements (
  int32    $id,
  Pointer $data,
  int32    $dataSize,
  int32    $offset
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlVertex2f (
  num32 $x,
  num32 $y
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlVertex2i (
  int32 $x,
  int32 $y
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlVertex3f (
  num32 $x,
  num32 $y,
  num32 $z
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlViewport (
  int32 $x,
  int32 $y,
  int32 $width,
  int32 $height
)
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlglClose
  is      native(LIBRAYLIB)
  is      export
{ * }

sub rlglInit (
  int32 $width,
  int32 $height
)
  is      native(LIBRAYLIB)
  is      export
{ * }
