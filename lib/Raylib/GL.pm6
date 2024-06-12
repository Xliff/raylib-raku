use v6.c;

use Raylib::Raw::Definitions;
use Raylib::Raw::Enums;
use Raylib::Raw::Structs;

use Raylib::Raw::GL;

class Raylib::GL {

  # method rlActiveDrawBuffers (int32 $count) {
  #   rlActiveDrawBuffers($count);
  # }
  #
  # method rlActiveTextureSlot (int32 $slot) {
  #   rlActiveTextureSlot($slot);
  # }
  #
  method begin (Int() $mode) {
    my int32 $m = $mode;

    rlBegin($m);
  }
  #
  # method rlBindFramebuffer (
  #   int32 $target,
  #   int32 $framebuffer
  # ) {
  #   rlBindFramebuffer($target, $framebuffer);
  # }
  #
  # method rlBindImageTexture (
  #   int32 $id,
  #   int32 $index,
  #   int32 $format,
  #   bool $readonly
  # ) {
  #   rlBindImageTexture($id, $index, $format, $readonly);
  # }
  #
  # method rlBindShaderBuffer (
  #   int32 $id,
  #   int32 $index
  # ) {
  #   rlBindShaderBuffer($id, $index);
  # }
  #
  # method rlBlitFramebuffer (
  #   int32 $srcX,
  #   int32 $srcY,
  #   int32 $srcWidth,
  #   int32 $srcHeight,
  #   int32 $dstX,
  #   int32 $dstY,
  #   int32 $dstWidth,
  #   int32 $dstHeight,
  #   int32 $bufferMask
  # ) {
  #   rlBlitFramebuffer($srcX, $srcY, $srcWidth, $srcHeight, $dstX, $dstY, $dstWidth, $dstHeight, $bufferMask);
  # }
  #
  method check-errors {
    rlCheckErrors();
  }

  method check-render-batch-limit (Int() $vCount) {
    my int32 $v = $vCount;

    rlCheckRenderBatchLimit($v);
  }

  method clear-color (
    Int() $r where * ~~ 0 .. 255,
    Int() $g where * ~~ 0 .. 255,
    Int() $b where * ~~ 0 .. 255,
    Int() $a where * ~~ 0 .. 255,

    :b(:$byte) is required
  ) {
    my uint8 ($rr, $gg, $bb, $aa) = ($r, $g, $b, $a);

    rlClearColor($rr, $gg, $bb, $aa);
  }
  #
  # method rlClearScreenBuffers {
  #   rlClearScreenBuffers();
  # }
  #
  multi method color (Num() $x, Num() $y, Num() $z, Num() $w) {
    my num32 ($xx, $yy, $zz) = ($x, $y, $z);

    rlColor3f($xx, $yy, $zz);
  }

  multi method color (Num() $x, Num() $y, Num() $z, Num() $w) {
    my num32 ($xx, $yy, $zz, $ww) = ($x, $y, $z, $w);

    rlColor4f($xx, $yy, $zz, $ww);
  }

  multi method color (
    Int() $r where * ~~ 0 .. 255,
    Int() $g where * ~~ 0 .. 255,
    Int() $b where * ~~ 0 .. 255,
    Int() $a where * ~~ 0 .. 255,

    :b(:$byte) is required
  ) {
    my uint8 ($rr, $gg, $bb, $aa) = ($r, $g, $b, $a);

    rlColor4ub($rr, $gg, $bb, $aa);
  }
  #
  # method rlColorMask (
  #   bool $r,
  #   bool $g,
  #   bool $b,
  #   bool $a
  # ) {
  #   rlColorMask($r, $g, $b, $a);
  # }
  #
  # method rlCompileShader (
  #   Str  $shaderCode,
  #   int32 $type
  # ) {
  #   rlCompileShader($shaderCode, $type);
  # }
  #
  # method rlComputeShaderDispatch (
  #   int32 $groupX,
  #   int32 $groupY,
  #   int32 $groupZ
  # ) {
  #   rlComputeShaderDispatch($groupX, $groupY, $groupZ);
  # }
  #
  # method rlCopyShaderBuffer (
  #   int32 $destId,
  #   int32 $srcId,
  #   int32 $destOffset,
  #   int32 $srcOffset,
  #   int32 $count
  # ) {
  #   rlCopyShaderBuffer($destId, $srcId, $destOffset, $srcOffset, $count);
  # }
  #
  # method rlCubemapParameters (
  #   int32 $id,
  #   int32 $param,
  #   int32 $value
  # ) {
  #   rlCubemapParameters($id, $param, $value);
  # }
  #
  # method rlDisableBackfaceCulling {
  #   rlDisableBackfaceCulling();
  # }
  #
  # method rlDisableColorBlend {
  #   rlDisableColorBlend();
  # }
  #
  # method rlDisableDepthMask {
  #   rlDisableDepthMask();
  # }
  #
  # method rlDisableDepthTest {
  #   rlDisableDepthTest();
  # }
  #
  # method rlDisableFramebuffer {
  #   rlDisableFramebuffer();
  # }
  #
  # method rlDisableScissorTest {
  #   rlDisableScissorTest();
  # }
  #
  # method rlDisableShader {
  #   rlDisableShader();
  # }
  #
  # method rlDisableSmoothLines {
  #   rlDisableSmoothLines();
  # }
  #
  # method rlDisableStatePointer (int32 $vertexAttribType) {
  #   rlDisableStatePointer($vertexAttribType);
  # }
  #
  # method rlDisableStereoRender {
  #   rlDisableStereoRender();
  # }
  #
  # method rlDisableTexture {
  #   rlDisableTexture();
  # }
  #
  # method rlDisableTextureCubemap {
  #   rlDisableTextureCubemap();
  # }
  #
  # method rlDisableVertexArray {
  #   rlDisableVertexArray();
  # }
  #
  # method rlDisableVertexAttribute (int32 $index) {
  #   rlDisableVertexAttribute($index);
  # }
  #
  # method rlDisableVertexBuffer {
  #   rlDisableVertexBuffer();
  # }
  #
  # method rlDisableVertexBufferElement {
  #   rlDisableVertexBufferElement();
  # }
  #
  # method rlDisableWireMode {
  #   rlDisableWireMode();
  # }
  #
  # method rlDrawRenderBatch (rlRenderBatch $batch) {
  #   rlDrawRenderBatch($batch);
  # }
  #
  # method rlDrawRenderBatchActive {
  #   rlDrawRenderBatchActive();
  # }
  #
  # method rlDrawVertexArray (
  #   int32 $offset,
  #   int32 $count
  # ) {
  #   rlDrawVertexArray($offset, $count);
  # }
  #
  # method rlDrawVertexArrayElements (
  #   int32    $offset,
  #   int32    $count,
  #   Pointer $buffer
  # ) {
  #   rlDrawVertexArrayElements($offset, $count, $buffer);
  # }
  #
  # method rlDrawVertexArrayElementsInstanced (
  #   int32    $offset,
  #   int32    $count,
  #   Pointer $buffer,
  #   int32    $instances
  # ) {
  #   rlDrawVertexArrayElementsInstanced($offset, $count, $buffer, $instances);
  # }
  #
  # method rlDrawVertexArrayInstanced (
  #   int32 $offset,
  #   int32 $count,
  #   int32 $instances
  # ) {
  #   rlDrawVertexArrayInstanced($offset, $count, $instances);
  # }
  #
  # method rlEnableBackfaceCulling {
  #   rlEnableBackfaceCulling();
  # }
  #
  # method rlEnableColorBlend {
  #   rlEnableColorBlend();
  # }
  #
  # method rlEnableDepthMask {
  #   rlEnableDepthMask();
  # }
  #
  # method rlEnableDepthTest {
  #   rlEnableDepthTest();
  # }
  #
  # method rlEnableFramebuffer (int32 $id) {
  #   rlEnableFramebuffer($id);
  # }
  #
  # method rlEnablePointMode {
  #   rlEnablePointMode();
  # }
  #
  # method rlEnableScissorTest {
  #   rlEnableScissorTest();
  # }
  #
  # method rlEnableShader (int32 $id) {
  #   rlEnableShader($id);
  # }
  #
  # method rlEnableSmoothLines {
  #   rlEnableSmoothLines();
  # }
  #
  # method rlEnableStatePointer (
  #   int32    $vertexAttribType,
  #   Pointer $buffer
  # ) {
  #   rlEnableStatePointer($vertexAttribType, $buffer);
  # }
  #
  # method rlEnableStereoRender {
  #   rlEnableStereoRender();
  # }
  #
  # method rlEnableTexture (int32 $id) {
  #   rlEnableTexture($id);
  # }
  #
  # method rlEnableTextureCubemap (int32 $id) {
  #   rlEnableTextureCubemap($id);
  # }
  #
  # method rlEnableVertexArray (int32 $vaoId) {
  #   rlEnableVertexArray($vaoId);
  # }
  #
  # method rlEnableVertexAttribute (int32 $index) {
  #   rlEnableVertexAttribute($index);
  # }
  #
  # method rlEnableVertexBuffer (int32 $id) {
  #   rlEnableVertexBuffer($id);
  # }
  #
  # method rlEnableVertexBufferElement (int32 $id) {
  #   rlEnableVertexBufferElement($id);
  # }
  #
  # method rlEnableWireMode {
  #   rlEnableWireMode();
  # }
  #
  method end {
    rlEnd();
  }
  #
  # method rlFramebufferAttach (
  #   int32 $fboId,
  #   int32 $texId,
  #   int32 $attachType,
  #   int32 $texType,
  #   int32 $mipLevel
  # ) {
  #   rlFramebufferAttach($fboId, $texId, $attachType, $texType, $mipLevel);
  # }
  #
  # method rlFramebufferComplete (int32 $id) {
  #   rlFramebufferComplete($id);
  # }
  #
  # method rlFrustum (
  #   gdouble $left,
  #   gdouble $right,
  #   gdouble $bottom,
  #   gdouble $top,
  #   gdouble $znear,
  #   gdouble $zfar
  # ) {
  #   rlFrustum($left, $right, $bottom, $top, $znear, $zfar);
  # }
  #
  # method rlGenTextureMipmaps (
  #   int32 $id,
  #   int32 $width,
  #   int32 $height,
  #   int32 $format,
  #   int32 $mipmaps is rw
  # ) {
  #   rlGenTextureMipmaps($id, $width, $height, $format, $mipmaps);
  # }
  #
  # method rlGetActiveFramebuffer {
  #   rlGetActiveFramebuffer();
  # }
  #
  # method rlGetCullDistanceFar {
  #   rlGetCullDistanceFar();
  # }
  #
  # method rlGetCullDistanceNear {
  #   rlGetCullDistanceNear();
  # }
  #
  # method rlGetFramebufferHeight {
  #   rlGetFramebufferHeight();
  # }
  #
  # method rlGetFramebufferWidth {
  #   rlGetFramebufferWidth();
  # }
  #
  # method rlGetGlTextureFormats (
  #   int32 $format,
  #   int32 $glInternalFormat is rw,
  #   int32 $glFormat is rw,
  #   int32 $glType is rw
  # ) {
  #   rlGetGlTextureFormats($format, $glInternalFormat, $glFormat, $glType);
  # }
  #
  # method rlGetLineWidth {
  #   rlGetLineWidth();
  # }
  #
  # method rlGetLocationAttrib (
  #   int32 $shaderId,
  #   Str  $attribName
  # ) {
  #   rlGetLocationAttrib($shaderId, $attribName);
  # }
  #
  # method rlGetLocationUniform (
  #   int32 $shaderId,
  #   Str  $uniformName
  # ) {
  #   rlGetLocationUniform($shaderId, $uniformName);
  # }
  #
  # method rlGetMatrixModelview {
  #   rlGetMatrixModelview();
  # }
  #
  # method rlGetMatrixProjection {
  #   rlGetMatrixProjection();
  # }
  #
  # method rlGetMatrixProjectionStereo (int32 $eye) {
  #   rlGetMatrixProjectionStereo($eye);
  # }
  #
  # method rlGetMatrixTransform {
  #   rlGetMatrixTransform();
  # }
  #
  # method rlGetMatrixViewOffsetStereo (int32 $eye) {
  #   rlGetMatrixViewOffsetStereo($eye);
  # }
  #
  # method rlGetPixelFormatName (int32 $format) {
  #   rlGetPixelFormatName($format);
  # }
  #
  # method rlGetShaderBufferSize (int32 $id) {
  #   rlGetShaderBufferSize($id);
  # }
  #
  # method rlGetShaderIdDefault {
  #   rlGetShaderIdDefault();
  # }
  #
  # method rlGetShaderLocsDefault {
  #   rlGetShaderLocsDefault();
  # }
  #
  # method rlGetTextureIdDefault {
  #   rlGetTextureIdDefault();
  # }
  #
  # method rlGetVersion {
  #   rlGetVersion();
  # }
  #
  # method rlIsStereoRenderEnabled {
  #   rlIsStereoRenderEnabled();
  # }
  #
  # method rlLoadComputeShaderProgram (int32 $shaderId) {
  #   rlLoadComputeShaderProgram($shaderId);
  # }
  #
  # method rlLoadDrawCube {
  #   rlLoadDrawCube();
  # }
  #
  # method rlLoadDrawQuad {
  #   rlLoadDrawQuad();
  # }
  #
  # method rlLoadExtensions (Pointer $loader) {
  #   rlLoadExtensions($loader);
  # }
  #
  # method rlLoadFramebuffer {
  #   rlLoadFramebuffer();
  # }
  #
  # method rlLoadIdentity {
  #   rlLoadIdentity();
  # }
  #
  # method rlLoadRenderBatch (
  #   int32 $numBuffers,
  #   int32 $bufferElements
  # ) {
  #   rlLoadRenderBatch($numBuffers, $bufferElements);
  # }
  #
  # method rlLoadShaderBuffer (
  #   int32    $size,
  #   Pointer $data,
  #   int32    $usageHint
  # ) {
  #   rlLoadShaderBuffer($size, $data, $usageHint);
  # }
  #
  # method rlLoadShaderCode (
  #   Str $vsCode,
  #   Str $fsCode
  # ) {
  #   rlLoadShaderCode($vsCode, $fsCode);
  # }
  #
  # method rlLoadShaderProgram (
  #   int32 $vShaderId,
  #   int32 $fShaderId
  # ) {
  #   rlLoadShaderProgram($vShaderId, $fShaderId);
  # }
  #
  # method rlLoadTexture (
  #   Pointer $data,
  #   int32    $width,
  #   int32    $height,
  #   int32    $format,
  #   int32    $mipmapCount
  # ) {
  #   rlLoadTexture($data, $width, $height, $format, $mipmapCount);
  # }
  #
  # method rlLoadTextureCubemap (
  #   Pointer $data,
  #   int32    $size,
  #   int32    $format
  # ) {
  #   rlLoadTextureCubemap($data, $size, $format);
  # }
  #
  # method rlLoadTextureDepth (
  #   int32 $width,
  #   int32 $height,
  #   bool $useRenderBuffer
  # ) {
  #   rlLoadTextureDepth($width, $height, $useRenderBuffer);
  # }
  #
  # method rlLoadVertexArray {
  #   rlLoadVertexArray();
  # }
  #
  # method rlLoadVertexBuffer (
  #   Pointer $buffer,
  #   int32    $size,
  #   bool    $dynamic
  # ) {
  #   rlLoadVertexBuffer($buffer, $size, $dynamic);
  # }
  #
  # method rlLoadVertexBufferElement (
  #   Pointer $buffer,
  #   int32    $size,
  #   bool    $dynamic
  # ) {
  #   rlLoadVertexBufferElement($buffer, $size, $dynamic);
  # }
  #
  # method rlMatrixMode (int32 $mode) {
  #   rlMatrixMode($mode);
  # }
  #
  # method rlMultMatrixf (num32 $matf is rw) {
  #   rlMultMatrixf($matf);
  # }
  #
  method normal (Num() $x, Num() $y, Num() $z) {
    my num32 ($xx, $yy, $zz) = ($x, $y, $z);

    rlNormal3f($xx, $yy, $zz);
  }
  #
  # method rlOrtho (
  #   gdouble $left,
  #   gdouble $right,
  #   gdouble $bottom,
  #   gdouble $top,
  #   gdouble $znear,
  #   gdouble $zfar
  # ) {
  #   rlOrtho($left, $right, $bottom, $top, $znear, $zfar);
  # }
  #
  method pop {
    rlPopMatrix();
  }

  method push  {
    rlPushMatrix();
  }
  #
  # method rlReadScreenPixels (
  #   int32 $width,
  #   int32 $height
  # ) {
  #   rlReadScreenPixels($width, $height);
  # }
  #
  # method rlReadShaderBuffer (
  #   int32    $id,
  #   Pointer $dest,
  #   int32    $count,
  #   int32    $offset
  # ) {
  #   rlReadShaderBuffer($id, $dest, $count, $offset);
  # }
  #
  # method rlReadTexturePixels (
  #   int32 $id,
  #   int32 $width,
  #   int32 $height,
  #   int32 $format
  # ) {
  #   rlReadTexturePixels($id, $width, $height, $format);
  # }

  multi method rotate (
     $angle,
    :$x      = 0,
    :$y      = 0,
    :$z      = 0
  ) {
    samewith($angle, $x, $y, $z);
  }
  multi method rotate (
    Num() $angle,
    Num() $x,
    Num() $y,
    Num() $z
  ) {
    my num32 ($a, $xx, $yy, $zz) = ($angle, $x, $y, $z);

    rlRotatef($angle, $x, $y, $z);
  }
  #
  # method rlScalef (
  #   num32 $x,
  #   num32 $y,
  #   num32 $z
  # ) {
  #   rlScalef($x, $y, $z);
  # }
  #
  # method rlScissor (
  #   int32 $x,
  #   int32 $y,
  #   int32 $width,
  #   int32 $height
  # ) {
  #   rlScissor($x, $y, $width, $height);
  # }
  #
  # method rlSetBlendFactors (
  #   int32 $glSrcFactor,
  #   int32 $glDstFactor,
  #   int32 $glEquation
  # ) {
  #   rlSetBlendFactors($glSrcFactor, $glDstFactor, $glEquation);
  # }
  #
  # method rlSetBlendFactorsSeparate (
  #   int32 $glSrcRGB,
  #   int32 $glDstRGB,
  #   int32 $glSrcAlpha,
  #   int32 $glDstAlpha,
  #   int32 $glEqRGB,
  #   int32 $glEqAlpha
  # ) {
  #   rlSetBlendFactorsSeparate($glSrcRGB, $glDstRGB, $glSrcAlpha, $glDstAlpha, $glEqRGB, $glEqAlpha);
  # }
  #
  # method rlSetBlendMode (int32 $mode) {
  #   rlSetBlendMode($mode);
  # }
  #
  # method rlSetClipPlanes (
  #   gdouble $near,
  #   gdouble $far
  # ) {
  #   rlSetClipPlanes($near, $far);
  # }
  #
  # method rlSetCullFace (int32 $mode) {
  #   rlSetCullFace($mode);
  # }
  #
  # method rlSetFramebufferHeight (int32 $height) {
  #   rlSetFramebufferHeight($height);
  # }
  #
  # method rlSetFramebufferWidth (int32 $width) {
  #   rlSetFramebufferWidth($width);
  # }
  #
  # method rlSetLineWidth (num32 $width) {
  #   rlSetLineWidth($width);
  # }
  #
  # method rlSetMatrixModelview (Matrix $view) {
  #   rlSetMatrixModelview($view);
  # }
  #
  # method rlSetMatrixProjection (Matrix $proj) {
  #   rlSetMatrixProjection($proj);
  # }
  #
  # method rlSetMatrixProjectionStereo (
  #   Matrix $right,
  #   Matrix $left
  # ) {
  #   rlSetMatrixProjectionStereo($right, $left);
  # }
  #
  # method rlSetMatrixViewOffsetStereo (
  #   Matrix $right,
  #   Matrix $left
  # ) {
  #   rlSetMatrixViewOffsetStereo($right, $left);
  # }
  #
  # method rlSetRenderBatchActive (rlRenderBatch $batch) {
  #   rlSetRenderBatchActive($batch);
  # }
  #
  # method rlSetShader (
  #   int32 $id,
  #   int32 $locs is rw
  # ) {
  #   rlSetShader($id, $locs);
  # }
  #
  method set-texture (Int() $id) {
    my int32 $i = $id;

    rlSetTexture($i);
  }
  method unset-texture {
    self.set-texture(0);
  }
  #
  # method rlSetUniform (
  #   int32    $locIndex,
  #   Pointer $value,
  #   int32    $uniformType,
  #   int32    $count
  # ) {
  #   rlSetUniform($locIndex, $value, $uniformType, $count);
  # }
  #
  # method rlSetUniformMatrix (
  #   int32   $locIndex,
  #   Matrix $mat
  # ) {
  #   rlSetUniformMatrix($locIndex, $mat);
  # }
  #
  # method rlSetUniformSampler (
  #   int32 $locIndex,
  #   int32 $textureId
  # ) {
  #   rlSetUniformSampler($locIndex, $textureId);
  # }
  #
  # method rlSetVertexAttribute (
  #   int32 $index,
  #   int32 $compSize,
  #   int32 $type,
  #   bool $normalized,
  #   int32 $stride,
  #   int32 $offset
  # ) {
  #   rlSetVertexAttribute($index, $compSize, $type, $normalized, $stride, $offset);
  # }
  #
  # method rlSetVertexAttributeDefault (
  #   int32    $locIndex,
  #   Pointer $value,
  #   int32    $attribType,
  #   int32    $count
  # ) {
  #   rlSetVertexAttributeDefault($locIndex, $value, $attribType, $count);
  # }
  #
  # method rlSetVertexAttributeDivisor (
  #   int32 $index,
  #   int32 $divisor
  # ) {
  #   rlSetVertexAttributeDivisor($index, $divisor);
  # }
  #
  method tex-coord (Num() $x,Num() $y) {
    my num32 ($xx, $yy) = ($x, $y);

    rlTexCoord2f($xx, $yy);
  }
  #
  # method rlTextureParameters (
  #   int32 $id,
  #   int32 $param,
  #   int32 $value
  # ) {
  #   rlTextureParameters($id, $param, $value);
  # }
  #
  method translate (Num() $x, Num() $y, Num() $z) {
    my num32 ($xx, $yy, $zz) = ($x, $y, $z);

    rlTranslatef($xx, $yy, $zz);
  }
  #
  # method rlUnloadFramebuffer (int32 $id) {
  #   rlUnloadFramebuffer($id);
  # }
  #
  # method rlUnloadRenderBatch (rlRenderBatch $batch) {
  #   rlUnloadRenderBatch($batch);
  # }
  #
  # method rlUnloadShaderBuffer (int32 $ssboId) {
  #   rlUnloadShaderBuffer($ssboId);
  # }
  #
  # method rlUnloadShaderProgram (int32 $id) {
  #   rlUnloadShaderProgram($id);
  # }
  #
  # method rlUnloadTexture (int32 $id) {
  #   rlUnloadTexture($id);
  # }
  #
  # method rlUnloadVertexArray (int32 $vaoId) {
  #   rlUnloadVertexArray($vaoId);
  # }
  #
  # method rlUnloadVertexBuffer (int32 $vboId) {
  #   rlUnloadVertexBuffer($vboId);
  # }
  #
  # method rlUpdateShaderBuffer (
  #   int32    $id,
  #   Pointer $data,
  #   int32    $dataSize,
  #   int32    $offset
  # ) {
  #   rlUpdateShaderBuffer($id, $data, $dataSize, $offset);
  # }
  #
  # method rlUpdateTexture (
  #   int32    $id,
  #   int32    $offsetX,
  #   int32    $offsetY,
  #   int32    $width,
  #   int32    $height,
  #   int32    $format,
  #   Pointer $data
  # ) {
  #   rlUpdateTexture($id, $offsetX, $offsetY, $width, $height, $format, $data);
  # }
  #
  # method rlUpdateVertexBuffer (
  #   int32    $bufferId,
  #   Pointer $data,
  #   int32    $dataSize,
  #   int32    $offset
  # ) {
  #   rlUpdateVertexBuffer($bufferId, $data, $dataSize, $offset);
  # }
  #
  # method rlUpdateVertexBufferElements (
  #   int32    $id,
  #   Pointer $data,
  #   int32    $dataSize,
  #   int32    $offset
  # ) {
  #   rlUpdateVertexBufferElements($id, $data, $dataSize, $offset);
  # }
  #
  # method rlVertex2f (
  #   num32 $x,
  #   num32 $y
  # ) {
  #   rlVertex2f($x, $y);
  # }
  #
  # method rlVertex2i (
  #   int32 $x,
  #   int32 $y
  # ) {
  #   rlVertex2i($x, $y);
  # }
  #
  method vertex (Num() $x, Num() $y, Num() $z) {
    my num32 ($xx, $yy, $zz) = ($x, $y, $z);

    rlVertex3f($xx, $yy, $zz);
  }
  #
  # method rlViewport (
  #   int32 $x,
  #   int32 $y,
  #   int32 $width,
  #   int32 $height
  # ) {
  #   rlViewport($x, $y, $width, $height);
  # }
  #
  # method rlglClose {
  #   rlglClose();
  # }
  #
  # method rlglInit (
  #   int32 $width,
  #   int32 $height
  # ) {
  #   rlglInit($width, $height);
  # }

}

constant GL is export := Raylib::GL;
