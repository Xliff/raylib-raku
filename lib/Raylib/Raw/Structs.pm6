use v6.c;

use NativeCall;
use Method::Also;

use Raylib::Raw::Definitions;
use Raylib::Raw::Enums;

unit package Raylib::Raw::Structs;

class Vector2 is export is repr('CStruct') is rw {
    has num32 $.x is rw;
    has num32 $.y is rw;

    multi method new (Num() $x, Num() $y) {
      my num32 ($xx, $yy) = ($x, $y);

      self.init($x, $y);
    }

    method init(num32 $x,num32 $y) returns Vector2 {
        malloc-Vector2($x,$y);
    }
    submethod DESTROY {
        free-Vector2(self);
    }
}
class Vector3 is export is repr('CStruct') is rw {
    has num32 $.x is rw;
    has num32 $.y is rw;
    has num32 $.z is rw;
    method init(num32 $x,num32 $y,num32 $z) returns Vector3 {
        malloc-Vector3($x,$y,$z);
    }
    submethod DESTROY {
        free-Vector3(self);
    }
}
class Vector4 is export is repr('CStruct') is rw {
    has num32 $.x is rw;
    has num32 $.y is rw;
    has num32 $.z is rw;
    has num32 $.w is rw;
    method init(num32 $x,num32 $y,num32 $z,num32 $w) returns Vector4 {
        malloc-Vector4($x,$y,$z,$w);
    }
    submethod DESTROY {
        free-Vector4(self);
    }
}
class Quaternion is Vector4 is export is repr('CStruct') {}
class Matrix is export is repr('CStruct') is rw {
  has num32 $.m0  is rw;
  has num32 $.m4  is rw;
  has num32 $.m8  is rw;
  has num32 $.m12 is rw;
  has num32 $.m1  is rw;
  has num32 $.m5  is rw;
  has num32 $.m9  is rw;
  has num32 $.m13 is rw;
  has num32 $.m2  is rw;
  has num32 $.m6  is rw;
  has num32 $.m10 is rw;
  has num32 $.m14 is rw;
  has num32 $.m3  is rw;
  has num32 $.m7  is rw;
  has num32 $.m11 is rw;
  has num32 $.m15 is rw;

  method init(num32 $m0,num32 $m4,num32 $m8,num32 $m12,num32 $m1,num32 $m5,num32 $m9,num32 $m13,num32 $m2,num32 $m6,num32 $m10,num32 $m14,num32 $m3,num32 $m7,num32 $m11,num32 $m15) returns Matrix {
      malloc-Matrix($m0,$m4,$m8,$m12,$m1,$m5,$m9,$m13,$m2,$m6,$m10,$m14,$m3,$m7,$m11,$m15);
  }
  submethod DESTROY {
      free-Matrix(self);
  }

  method Array {
    [
      self.m0,
      self.m1,
      self.m2,
      self.m3,
      self.m4,
      self.m5,
      self.m6,
      self.m7,
      self.m8,
      self.m9,
      self.m10,
      self.m11,
      self.m12,
      self.m13,
      self.m14,
      self.m15
    ]
  }
}
class Color is export is repr('CStruct') is rw {
    has uint8 $.r is rw;
    has uint8 $.g is rw;
    has uint8 $.b is rw;
    has uint8 $.a is rw;

    method red   is rw { $!r }
    method green is rw { $!g }
    method blue  is rw { $!b }
    method alpha is rw { $!a }

    method init (uint8 $r,uint8 $g,uint8 $b,uint8 $a) returns Color {
        malloc-Color($r, $g, $b, $a);
    }
    submethod DESTROY {
        free-Color(self);
    }
}
class Rectangle is export is repr('CStruct') is rw {
    has num32 $.x      is rw;
    has num32 $.y      is rw;
    has num32 $.width  is rw;
    has num32 $.height is rw;

    method w is rw { $!width  }
    method h is rw { $!height }

    method size { ( $!width, $!height)  }

    multi method new (
      Num() $x1,
      Num() $y1,
      Num() $x2,
      Num() $y2
    ) {
      my num32 ($xx1, $yy1, $xx2, $yy2) = ($x1, $y1, $x2, $y2);

      self.init($xx1, $yy1, $xx2, $yy2);
    }

    method init(num32 $x,num32 $y,num32 $width,num32 $height) returns Rectangle {
        malloc-Rectangle($x,$y,$width,$height);
    }
    submethod DESTROY {
        free-Rectangle(self);
    }
}
class Image is export is repr('CStruct') is rw {
    has Pointer[void] $.data;
    has int32 $.width;
    has int32 $.height;
    has int32 $.mipmaps;
    has int32 $.format;
    method init(void $data,int32 $width,int32 $height,int32 $mipmaps,int32 $format) returns Image {
        malloc-Image($data,$width,$height,$mipmaps,$format);
    }

    method size { ( $!width, $!height)  }

    submethod DESTROY {
        free-Image(self);
    }
}
class Texture is export is repr('CStruct') is rw {
    has uint32 $.id;
    has int32  $.width;
    has int32  $.height;
    has int32  $.mipmaps;
    has int32  $.format;

    method init(int32 $id,int32 $width,int32 $height,int32 $mipmaps,int32 $format) returns Texture {
        malloc-Texture($id,$width,$height,$mipmaps,$format);
    }

    method size { ( $!width, $!height )  }

    submethod DESTROY {
        free-Texture(self);
    }
}
class Texture2D is Texture is export is repr('CStruct') {}
class TextureCubemap is Texture is export is repr('CStruct') {}
class RenderTexture is export is repr('CStruct') is rw {
    has uint32 $.id;
    HAS Texture $.texture;
    HAS Texture $.depth;

    method init(
      int32 $id,
      Texture2D $texture,
      Texture2D $depth
    )
      returns RenderTexture
    {
      malloc-RenderTexture(
        $id,
        $texture,
        $depth
      );
    }

    submethod DESTROY {
        free-RenderTexture(self);
    }
}

class RenderTexture2D is RenderTexture is export is repr('CStruct') {}

class NPatchInfo is export is repr('CStruct') is rw {
    HAS Rectangle $.source;
    has int32 $.left;
    has int32 $.top;
    has int32 $.right;
    has int32 $.bottom;
    has int32 $.layout;

    method init(
      Rectangle $source,
      int32     $left,
      int32     $top,
      int32     $right,
      int32     $bottom,
      int32     $layout
    )
      returns NPatchInfo
    {
      malloc-NPatchInfo($source,$left,$top,$right,$bottom,$layout);
    }

    submethod DESTROY {
      free-NPatchInfo(self);
    }
}

class GlyphInfo is export is repr('CStruct') is rw {
    has int32 $.value;
    has int32 $.offsetX;
    has int32 $.offsetY;
    has int32 $.advanceX;
    HAS Image $.image;

    method init(
      int32 $value,
      int32 $offsetX,
      int32 $offsetY,
      int32 $advanceX,
      Image $image
    )
      returns GlyphInfo
    {
      malloc-GlyphInfo($value,$offsetX,$offsetY,$advanceX,$image);
    }

    submethod DESTROY {
        free-GlyphInfo(self);
    }
}

class Font is export is repr('CStruct') is rw {
    has int32     $.baseSize;
    has int32     $.glyphCount;
    has int32     $.glyphPadding;
    HAS Texture2D $.texture;
    has Pointer   $.recs;         #= Array of Rectangle
    has Pointer   $.glyphs;       #= Array of GlyphInfo

    method init(
      int32     $baseSize,
      int32     $glyphCount,
      int32     $glyphPadding,
      Texture2D $texture,
      Pointer   $recs,
      Pointer   $glyphs
    )
      returns Font
    {
        malloc-Font(
          $baseSize,
          $glyphCount,
          $glyphPadding,
          $texture,
          $recs,
          $glyphs
        );
    }

    submethod DESTROY {
        free-Font(self);
    }
}
class Camera3D is export is repr('CStruct') is rw {
    HAS Vector3 $.position;
    HAS Vector3 $.target;
    HAS Vector3 $.up;
    has num32   $.fovy;
    has int32   $.projection;

    method init(
      Vector3 $position,
      Vector3 $target,
      Vector3 $up,
      num32   $fovy,
      int32   $projection
    )
      returns Camera3D
    {
      malloc-Camera3D(
        $position,
        $target,
        $up,
        $fovy,
        $projection
      );
    }

    submethod DESTROY {
        free-Camera3D(self);
    }
}

class Camera is Camera3D is export is repr('CStruct') {}

class Camera2D is export is repr('CStruct') is rw {
    HAS Vector2 $.offset;
    HAS Vector2 $.target;
    has num32   $.rotation;
    has num32   $.zoom;

    method init(
      Vector2 $offset,
      Vector2 $target,
      num32 $rotation,
      num32 $zoom
    )
      returns Camera2D
    {
      malloc-Camera2D(
        $offset,
        $target,
        $rotation,
        $zoom
      );
    }

    submethod DESTROY {
        free-Camera2D(self);
    }
}

class Mesh is export is repr('CStruct') is rw {
    has int32          $.vertexCount;
    has int32          $.triangleCount;
    has CArray[num32]  $.vertices;
    has CArray[num32]  $.texcoords;
    has CArray[num32]  $.texcoords2;
    has CArray[num32]  $.normals;
    has CArray[num32]  $.tangents;
    has CArray[uint8]  $.colors;
    has CArray[uint16] $.indices        is rw;
    has CArray[num32]  $.animVertices   is rw;
    has CArray[num32]  $.animNormals    is rw;
    has CArray[uint8]  $.boneIds        is rw;
    has CArray[num32]  $.boneWeights    is rw;
    has uint32         $.vaoId;
    has CArray[uint32] $.vboId          is rw;

    method init(
      int32          $vertexCount,
      int32          $triangleCount,
      CArray[num32]  $vertices,
      CArray[num32]  $texcoords,
      CArray[num32]  $texcoords2,
      CArray[num32]  $normals,
      CArray[num32]  $tangents,
      CArray[uint8]  $colors,
      CArray[uint16] $indices,
      CArray[num32]  $animVertices,
      CArray[num32]  $animNormals,
      CArray[uint8]  $boneIds,
      CArray[num32]  $boneWeights,
      int32          $vaoId,
      CArray[int32]  $vboId
    )
      returns Mesh
    {
      malloc-Mesh(
        $vertexCount,
        $triangleCount,
        $vertices,
        $texcoords,
        $texcoords2,
        $normals,
        $tangents,
        $colors,
        $indices,
        $animVertices,
        $animNormals,
        $boneIds,
        $boneWeights,
        $vaoId,
        $vboId
      );
    }

    submethod DESTROY {
      say "Destroying Mesh...";
      free-Mesh(self);
    }
}

class Shader is export is repr('CStruct') is rw {
    has uint32        $.id;
    has CArray[int32] $.locs;

    method locations is also<location> {
      state %locations;

      unless %locations{ self.WHERE } {
        %locations{ self.WHERE } = {
          position      => $!locs[SHADER_LOC_VERTEX_POSITION],
          texcoord01    => $!locs[SHADER_LOC_VERTEX_TEXCOORD01],
          texcoord02    => $!locs[SHADER_LOC_VERTEX_TEXCOORD02],
          vertex-normal => $!locs[SHADER_LOC_VERTEX_NORMAL],
          tangent       => $!locs[SHADER_LOC_VERTEX_TANGENT],
          color         => $!locs[SHADER_LOC_VERTEX_COLOR],
          mvp           => $!locs[SHADER_LOC_MATRIX_MVP],
          matrix-view   => $!locs[SHADER_LOC_MATRIX_VIEW],
          projection    => $!locs[SHADER_LOC_MATRIX_PROJECTION],
          model         => $!locs[SHADER_LOC_MATRIX_MODEL],
          matrix-normal => $!locs[SHADER_LOC_MATRIX_NORMAL],
          vector-view   => $!locs[SHADER_LOC_VECTOR_VIEW],
          diffuse       => $!locs[SHADER_LOC_COLOR_DIFFUSE],
          specular      => $!locs[SHADER_LOC_COLOR_SPECULAR],
          ambient       => $!locs[SHADER_LOC_COLOR_AMBIENT],
          albedo        => $!locs[SHADER_LOC_MAP_ALBEDO]
        };
      }
      %locations{ self.WHERE }
    }

    method position   is rw {
      self.location<position>
    }

    method texcoord01 is rw {
      self.location<texcoord01>
    }

    method texcoord02 is rw {
      self.location<texcoord02>
    }

    method vertex-normal is rw {
      self.location<vertex-normal>
    }

    method tangent is rw {
      self.location<tangent>
    }

    method color is rw {
      self.location<color>
    }

    method mvp is rw {
      self.location<mvp>
    }

    method matrix-view is rw {
      self.location<matrix-view>
    }

    method projection is rw {
      self.location<projection>
    }

    method model is rw {
      self.location<model>
    }

    method matrix-normal is rw {
      self.location<matrix-normal>
    }

    method vector-view is rw {
      self.location<vector-view>
    }

    method diffuse is rw {
      self.location<diffuse>
    }

    method specular is rw {
      self.location<specular>
    }

    method ambient is rw {
      self.location<ambient>
    }

    method albedo is rw {
      self.location<albedo>
    }

    method init(int32 $id, CArray[int32] $locs) returns Shader {
      malloc-Shader($id, $locs);
    }

    submethod DESTROY {
      free-Shader(self);
    }
}

class MaterialMap is export is repr('CStruct') is rw {
    HAS Texture2D $!texture;
    HAS Color     $!color;
    has num32     $.value;

    method texture is rw {
      Proxy.new:
        FETCH => -> $ { $!texture },

        STORE => -> $, Texture() $v {
          say "T: { $v }";

          $!texture.id      = $v.id;
          $!texture.width   = $v.width;
          $!texture.height  = $v.height;
          $!texture.mipmaps = $v.mipmaps;
          $!texture.format  = $v.format;
        }
    }

    method color is rw {
      Proxy.new:
        FETCH => -> $ { $!color },

        STORE => -> $, Color() $v {
          $!color.r = $v.r;
          $!color.g = $v.g;
          $!color.b = $v.b;
          $!color.a = $v.a;
        }
     }

    method init(
      Texture2D $texture,
      Color     $color,
      num32     $value
    )
      returns MaterialMap
    {
        malloc-MaterialMap($texture, $color, $value);
    }

    submethod DESTROY {
        free-MaterialMap(self);
    }
}

class Material is export is repr('CStruct') is rw {
  HAS Shader    $.shader;
  has Pointer   $.maps;                  # Dynamically allocated Array of MAX_MATERIAL_MAPS MaterialMap
  HAS num32     @.params[4]  is CArray;

  method init (Shader $shader, CArray[num32] $params) returns Material {
    # cw: Check the helper lib to ensure that MaterialMaps are preallocated!
    #     if so, then malloc-Materisl SHOULD NOT touch them!
    malloc-Material($shader, MaterialMap, $params);
  }

  submethod DESTROY {
    free-Material(self);
  }
}


class Transform is export is repr('CStruct') is rw {
    HAS Vector3    $.translation;
    HAS Quaternion $.rotation;
    HAS Vector3    $.scale;

    method init(
      Vector3    $translation,
      Quaternion $rotation,
      Vector3    $scale
    )
      returns Transform
    {
        malloc-Transform($translation, $rotation, $scale);
    }

    submethod DESTROY {
      free-Transform(self);
    }
}

class BoneInfo is export is repr('CStruct') is rw {
  HAS uint8 @!name[32] is CArray;
  has int32 $.parent;

  method name ( :$raw = False, :$encoding = 'utf8' ) {
    Proxy.new:
      FETCH => -> $             { Buf.new(@!name).decode($encoding) }
      STORE => -> $, $v is copy {
        given $v {
          when Str           { $_ = $v.encode; proceed;           }
          when Blob          { $_ = CArray[uint32].new($v);       }
          when CArray[uint8] { 1                                  }
          when Pointer       { $_ = nativecast(CArray[uint8], $_) }

          default {
            X::Raylib::UnknownType.new($_).throw
          }
        }

        for ^32 {
          @!name[$_] = $v[$_] ;
          last if $v[$_].not;
        }
    }

  }

  method init(Str $name, int32 $parent)
    returns BoneInfo
  {
    my $n = CArray[uint8].new( $name.comb[^32] );
    malloc-BoneInfo($n, $parent);
  }

  submethod DESTROY {
    free-BoneInfo(self);
  }
}



class ModelAnimation is export is repr('CStruct') is rw {
    has int32                     $.boneCount;
    has int32                     $.frameCount;
    has Pointer                   $.bones;                 #= Array of BoneInfo
    has CArray[CArray[Transform]] $.framePoses;
    HAS uint8                     @.name[32]    is CArray;

    method init(
      int32                     $boneCount,
      int32                     $frameCount,
      Pointer                   $bones,
      CArray[CArray[Transform]] $framePoses,
      CArray[uint8]             $name
    )
      returns ModelAnimation
    {
      malloc-ModelAnimation(
        $boneCount,
        $frameCount,
        $bones,
        $framePoses,
        $name
      );
    }

    submethod DESTROY {
        free-ModelAnimation(self);
    }
}

class Ray is export is repr('CStruct') is rw {
    has Vector3 $.position;
    has Vector3 $.direction;
    method init(Vector3 $position,Vector3 $direction) returns Ray {
        malloc-Ray($position,$direction);
    }
    submethod DESTROY {
        free-Ray(self);
    }
}
class RayCollision is export is repr('CStruct') is rw {
    has bool $.hit;
    has num32 $.distance;
    has Vector3 $.point;
    has Vector3 $.normal;
    method init(bool $hit,num32 $distance,Vector3 $point,Vector3 $normal) returns RayCollision {
        malloc-RayCollision($hit,$distance,$point,$normal);
    }
    submethod DESTROY {
        free-RayCollision(self);
    }
}
class BoundingBox is export is repr('CStruct') is rw {
    HAS Vector3 $.min is rw;
    HAS Vector3 $.max is rw;

    method size ( :$hash = False ) {
      my $r = (
        self.max.x - self.min.x,
        self.max.y - self.min.y,
        self.max.z - self.min.z
      );
      return $r unless $hash;
      %( x => $r[0], y => $r[1], z => $r[2] );
    }

    method init(Vector3 $min,Vector3 $max) returns BoundingBox {
        malloc-BoundingBox($min,$max);
    }
    submethod DESTROY {
        free-BoundingBox(self);
    }
}

class Wave is export is repr('CStruct') {
    has uint32  $.frameCount;
    has uint32  $.sampleRate;
    has uint32  $.sampleSize;
    has uint32  $.channels;
    has Pointer $.data;

    method init(
      int32   $frameCount,
      int32   $sampleRate,
      int32   $sampleSize,
      int32   $channels,
      Pointer $data
    )
      returns Wave
    {
        malloc-Wave($frameCount,$sampleRate,$sampleSize,$channels,$data);
    }

    submethod DESTROY {
        free-Wave(self);
    }
}

class rAudioBuffer    does StructSkipsTest is export is repr('CStruct') {
  has int32 $.dummy;
}

class rAudioProcessor does StructSkipsTest is export is repr('CStruct') {
  has int32 $.dummy;
}

class AudioStream is export is repr('CStruct') is rw {
    has rAudioBuffer $.buffer is rw;
    has rAudioProcessor $.processor is rw;
    has uint32 $.sampleRate;
    has uint32 $.sampleSize;
    has uint32 $.channels;


}
class Sound is export is repr('CStruct') is rw {
    has AudioStream $.stream;
    has uint32 $.frameCount;
    method init(AudioStream $stream,int32 $frameCount) returns Sound {
        malloc-Sound($stream,$frameCount);
    }
    submethod DESTROY {
        free-Sound(self);
    }
}
class Music is export is repr('CStruct') is rw {
    has AudioStream $.stream;
    has uint32 $.frameCount;
    has bool $.looping;
    has int32 $.ctxType;
    has Pointer[void] $.ctxData;
    method init(AudioStream $stream,int32 $frameCount,bool $looping,int32 $ctxType,void $ctxData) returns Music {
        malloc-Music($stream,$frameCount,$looping,$ctxType,$ctxData);
    }
    submethod DESTROY {
        free-Music(self);
    }
}
class VrDeviceInfo is export is repr('CStruct') is rw {
    has int32 $.hResolution;
    has int32 $.vResolution;
    has num32 $.hScreenSize;
    has num32 $.vScreenSize;
    has num32 $.eyeToScreenDistance;
    has num32 $.lensSeparationDistance;
    has num32 $.interpupillaryDistance;
    has CArray[num32] $.lensDistortionValues is rw;
    has CArray[num32] $.chromaAbCorrection is rw;
    method init(int32 $hResolution,int32 $vResolution,num32 $hScreenSize,num32 $vScreenSize,num32 $eyeToScreenDistance,num32 $lensSeparationDistance,num32 $interpupillaryDistance,CArray[num32] $lensDistortionValues,CArray[num32] $chromaAbCorrection) returns VrDeviceInfo {
        malloc-VrDeviceInfo($hResolution,$vResolution,$hScreenSize,$vScreenSize,$eyeToScreenDistance,$lensSeparationDistance,$interpupillaryDistance,$lensDistortionValues,$chromaAbCorrection);
    }
    submethod DESTROY {
        free-VrDeviceInfo(self);
    }
}
class VrStereoConfig is export is repr('CStruct') is rw {
    has CArray[Matrix] $.projection is rw;
    has CArray[Matrix] $.viewOffset is rw;
    has CArray[num32] $.leftLensCenter is rw;
    has CArray[num32] $.rightLensCenter is rw;
    has CArray[num32] $.leftScreenCenter is rw;
    has CArray[num32] $.rightScreenCenter is rw;
    has CArray[num32] $.scale is rw;
    has CArray[num32] $.scaleIn is rw;
    method init(CArray[Matrix] $projection,CArray[Matrix] $viewOffset,CArray[num32] $leftLensCenter,CArray[num32] $rightLensCenter,CArray[num32] $leftScreenCenter,CArray[num32] $rightScreenCenter,CArray[num32] $scale,CArray[num32] $scaleIn) returns VrStereoConfig {
        malloc-VrStereoConfig($projection,$viewOffset,$leftLensCenter,$rightLensCenter,$leftScreenCenter,$rightScreenCenter,$scale,$scaleIn);
    }
    submethod DESTROY {
        free-VrStereoConfig(self);
    }
}
class FilePathList is export is repr('CStruct') is rw {
    has uint32 $.capacity;
    has uint32 $.count;
    has Str $.paths is rw;
    method init(int32 $capacity,int32 $count,Str $paths) returns FilePathList {
        malloc-FilePathList($capacity,$count,$paths);
    }
    submethod DESTROY {
        free-FilePathList(self);
    }
}
class AutomationEvent is export is repr('CStruct') is rw {
    has uint32 $.frame;
    has uint32 $.type;
    HAS int32  @.params[4] is CArray;

    method init(int32 $frame,int32 $type,CArray[int32] $params) returns AutomationEvent {
        malloc-AutomationEvent($frame,$type,$params);
    }
    submethod DESTROY {
        free-AutomationEvent(self);
    }
}
class AutomationEventList is export is repr('CStruct') is rw {
    has uint32 $.capacity;
    has uint32 $.count;
    has AutomationEvent $.events is rw;
    method init(int32 $capacity,int32 $count,AutomationEvent $events) returns AutomationEventList {
        malloc-AutomationEventList($capacity,$count,$events);
    }
    submethod DESTROY {
        free-AutomationEventList(self);
    }
}

our sub free-Vector2(Vector2 $ptr) is native(LIBRAYLIB) is symbol('free_Vector2') {*}
our sub free-Vector3(Vector3 $ptr) is native(LIBRAYLIB) is symbol('free_Vector3') {*}
our sub free-Vector4(Vector4 $ptr) is native(LIBRAYLIB) is symbol('free_Vector4') {*}
our sub free-Matrix(Matrix $ptr) is native(LIBRAYLIB) is symbol('free_Matrix') {*}
our sub free-Color(Color $ptr) is native(LIBRAYLIB) is symbol('free_Color') {*}

our sub free-Image(Image $ptr) is native(LIBRAYLIB) is symbol('free_Image') {*}
our sub free-Texture(Texture $ptr) is native(LIBRAYLIB) is symbol('free_Texture') {*}
our sub free-RenderTexture(RenderTexture $ptr) is native(LIBRAYLIB) is symbol('free_RenderTexture') {*}
our sub free-NPatchInfo(NPatchInfo $ptr) is native(LIBRAYLIB) is symbol('free_NPatchInfo') {*}
our sub free-GlyphInfo(GlyphInfo $ptr) is native(LIBRAYLIB) is symbol('free_GlyphInfo') {*}
our sub free-Font(Font $ptr) is native(LIBRAYLIB) is symbol('free_Font') {*}
our sub free-Camera3D(Camera3D $ptr) is native(LIBRAYLIB) is symbol('free_Camera3D') {*}
our sub free-Camera2D(Camera2D $ptr) is native(LIBRAYLIB) is symbol('free_Camera2D') {*}

our sub free-Mesh(Mesh $ptr) is native(LIBRAYLIB) is symbol('free_Mesh') {*}
our sub free-Shader(Shader $ptr) is native(LIBRAYLIB) is symbol('free_Shader') {*}
our sub free-MaterialMap(MaterialMap $ptr) is native(LIBRAYLIB) is symbol('free_MaterialMap') {*}
our sub free-Material(Material $ptr) is native(LIBRAYLIB) is symbol('free_Material') {*}
our sub free-Transform(Transform $ptr) is native(LIBRAYLIB) is symbol('free_Transform') {*}
our sub free-BoneInfo(BoneInfo $ptr) is native(LIBRAYLIB) is symbol('free_BoneInfo') {*}

our sub free-ModelAnimation(ModelAnimation $ptr)
  is native(LIBRAYLIB)
  is symbol('free_ModelAnimation')
  is export {*}

our sub free-Ray(Ray $ptr) is native(LIBRAYLIB) is symbol('free_Ray') {*}
our sub free-RayCollision(RayCollision $ptr) is native(LIBRAYLIB) is symbol('free_RayCollision') {*}
our sub free-Wave(Wave $ptr) is native(LIBRAYLIB) is symbol('free_Wave') {*}
our sub free-Sound(Sound $ptr) is native(LIBRAYLIB) is symbol('free_Sound') {*}
our sub free-Music(Music $ptr) is native(LIBRAYLIB) is symbol('free_Music') {*}
our sub free-VrDeviceInfo(VrDeviceInfo $ptr) is native(LIBRAYLIB) is symbol('free_VrDeviceInfo') {*}
our sub free-VrStereoConfig(VrStereoConfig $ptr) is native(LIBRAYLIB) is symbol('free_VrStereoConfig') {*}
our sub free-FilePathList(FilePathList $ptr) is native(LIBRAYLIB) is symbol('free_FilePathList') {*}
our sub free-AutomationEvent(AutomationEvent $ptr) is native(LIBRAYLIB) is symbol('free_AutomationEvent') {*}
our sub free-AutomationEventList(AutomationEventList $ptr) is native(LIBRAYLIB) is symbol('free_AutomationEventList') {*}
our sub free-Rectangle(Rectangle $ptr) is native(LIBRAYLIB) is symbol('free_Rectangle') {*}

our sub free-BoundingBox(
  BoundingBox $ptr
)
  is native(LIBRAYLIB)
  is symbol('free_BoundingBox') {*}

our sub malloc-BoundingBox(
  Vector3 $min,
  Vector3 $max
)
  returns BoundingBox
  is native(LIBRAYLIB)
  is symbol('malloc_BoundingBox') {*}


  our sub malloc-Mesh(
    int32          $vertexCount,
    int32          $triangleCount,
    CArray[num32]  $vertices,
    CArray[num32]  $texcoords,
    CArray[num32]  $texcoords2,
    CArray[num32]  $normals,
    CArray[num32]  $tangents,
    CArray[uint8]  $colors,
    CArray[uint16] $indices,
    CArray[num32]  $animVertices,
    CArray[num32]  $animNormals,
    CArray[uint8]  $boneIds,
    CArray[num32]  $boneWeights,
    int32          $vaoId,
    CArray[int32]  $vboId
  )
    returns Mesh
  is native(LIBRAYLIB)
  is symbol('malloc_Mesh') {*}

  our sub malloc-ModelAnimation(
    int32                     $boneCount,
    int32                     $frameCount,
    Pointer                   $bones,
    CArray[CArray[Transform]] $framePoses,
    CArray[uint8]             $name
  )
    returns ModelAnimation
    is native(LIBRAYLIB)
    is symbol('malloc_ModelAnimation')
    is export {*}

  our sub malloc-Vector2(num32 $x,num32 $y) returns Vector2 is native(LIBRAYLIB) is symbol('malloc_Vector2') {*}
  our sub malloc-Vector3(num32 $x,num32 $y,num32 $z) returns Vector3 is native(LIBRAYLIB) is symbol('malloc_Vector3') {*}
  our sub malloc-Vector4(num32 $x,num32 $y,num32 $z,num32 $w) returns Vector4 is native(LIBRAYLIB) is symbol('malloc_Vector4') {*}
  our sub malloc-Matrix(num32 $m0,num32 $m4,num32 $m8,num32 $m12,num32 $m1,num32 $m5,num32 $m9,num32 $m13,num32 $m2,num32 $m6,num32 $m10,num32 $m14,num32 $m3,num32 $m7,num32 $m11,num32 $m15) returns Matrix is native(LIBRAYLIB) is symbol('malloc_Matrix') {*}
  our sub malloc-Color(uint8 $r,uint8 $g,uint8 $b,uint8 $a) returns Color is native(LIBRAYLIB) is symbol('malloc_Color') {*}
  our sub malloc-Rectangle(num32 $x,num32 $y,num32 $width,num32 $height) returns Rectangle is native(LIBRAYLIB) is symbol('malloc_Rectangle') {*}
  our sub malloc-Image(void $data,int32 $width,int32 $height,int32 $mipmaps,int32 $format) returns Image is native(LIBRAYLIB) is symbol('malloc_Image') {*}
  our sub malloc-Texture(int32 $id,int32 $width,int32 $height,int32 $mipmaps,int32 $format) returns Texture is native(LIBRAYLIB) is symbol('malloc_Texture') {*}
  our sub malloc-RenderTexture(int32 $id,Texture $texture,Texture $depth) returns RenderTexture is native(LIBRAYLIB) is symbol('malloc_RenderTexture') {*}
  our sub malloc-NPatchInfo(Rectangle $source,int32 $left,int32 $top,int32 $right,int32 $bottom,int32 $layout) returns NPatchInfo is native(LIBRAYLIB) is symbol('malloc_NPatchInfo') {*}
  our sub malloc-GlyphInfo(int32 $value,int32 $offsetX,int32 $offsetY,int32 $advanceX,Image $image) returns GlyphInfo is native(LIBRAYLIB) is symbol('malloc_GlyphInfo') {*}
  our sub malloc-Font(int32 $baseSize,int32 $glyphCount,int32 $glyphPadding,Texture2D $texture,Pointer $recs,Pointer $glyphs) returns Font is native(LIBRAYLIB) is symbol('malloc_Font') {*}
  our sub malloc-Camera3D(Vector3 $position,Vector3 $target,Vector3 $up,num32 $fovy,int32 $projection) returns Camera3D is native(LIBRAYLIB) is symbol('malloc_Camera3D') {*}
  our sub malloc-Camera2D(Vector2 $offset,Vector2 $target,num32 $rotation,num32 $zoom) returns Camera2D is native(LIBRAYLIB) is symbol('malloc_Camera2D') {*}
  our sub malloc-Shader(int32 $id, CArray[int32] $locs) returns Shader is native(LIBRAYLIB) is symbol('malloc_Shader') {*}
  our sub malloc-MaterialMap(Texture2D $texture,Color $color,num32 $value) returns MaterialMap is native(LIBRAYLIB) is symbol('malloc_MaterialMap') {*}
  our sub malloc-Material(Shader $shader,MaterialMap $maps,CArray[num32] $params) returns Material is native(LIBRAYLIB) is symbol('malloc_Material') {*}
  our sub malloc-Transform(Vector3 $translation,Quaternion $rotation,Vector3 $scale) returns Transform is native(LIBRAYLIB) is symbol('malloc_Transform') {*}
  our sub malloc-BoneInfo(CArray[Str] $name,int32 $parent) returns BoneInfo is native(LIBRAYLIB) is symbol('malloc_BoneInfo') {*}
  our sub malloc-Ray(Vector3 $position,Vector3 $direction) returns Ray is native(LIBRAYLIB) is symbol('malloc_Ray') {*}
  our sub malloc-RayCollision(bool $hit,num32 $distance,Vector3 $point,Vector3 $normal) returns RayCollision is native(LIBRAYLIB) is symbol('malloc_RayCollision') {*}
  our sub malloc-Wave(int32 $frameCount,int32 $sampleRate,int32 $sampleSize,int32 $channels,Pointer $data) returns Wave is native(LIBRAYLIB) is symbol('malloc_Wave') {*}
  our sub malloc-Sound(AudioStream $stream,int32 $frameCount) returns Sound is native(LIBRAYLIB) is symbol('malloc_Sound') {*}
  our sub malloc-Music(AudioStream $stream,int32 $frameCount,bool $looping,int32 $ctxType,void $ctxData) returns Music is native(LIBRAYLIB) is symbol('malloc_Music') {*}
  our sub malloc-VrDeviceInfo(int32 $hResolution,int32 $vResolution,num32 $hScreenSize,num32 $vScreenSize,num32 $eyeToScreenDistance,num32 $lensSeparationDistance,num32 $interpupillaryDistance,CArray[num32] $lensDistortionValues,CArray[num32] $chromaAbCorrection) returns VrDeviceInfo is native(LIBRAYLIB) is symbol('malloc_VrDeviceInfo') {*}
  our sub malloc-VrStereoConfig(CArray[Matrix] $projection,CArray[Matrix] $viewOffset,CArray[num32] $leftLensCenter,CArray[num32] $rightLensCenter,CArray[num32] $leftScreenCenter,CArray[num32] $rightScreenCenter,CArray[num32] $scale,CArray[num32] $scaleIn) returns VrStereoConfig is native(LIBRAYLIB) is symbol('malloc_VrStereoConfig') {*}
  our sub malloc-FilePathList(int32 $capacity,int32 $count,Str $paths) returns FilePathList is native(LIBRAYLIB) is symbol('malloc_FilePathList') {*}
  our sub malloc-AutomationEvent(int32 $frame,int32 $type,CArray[int32] $params) returns AutomationEvent is native(LIBRAYLIB) is symbol('malloc_AutomationEvent') {*}
  our sub malloc-AutomationEventList(int32 $capacity,int32 $count,AutomationEvent $events) returns AutomationEventList is native(LIBRAYLIB) is symbol('malloc_AutomationEventList') {*}

# class Model is export is repr('CStruct') is rw {
#     HAS Matrix        $.transform;
#     has int32         $.meshCount;
#     has int32         $.materialCount;
#     has Pointer       $.meshes;        #= Array of Mesh
#     has Pointer       $.materials;     #= Array of Material
#     has CArray[int32] $.meshMaterial;
#     has int32         $.boneCount;
#     has Pointer       $.bones;         #= Array of BoneInfo
#     has Pointer       $.bindPose;      #= Array of Transform
#
#     method init(
#       Matrix  $transform,
#       int32   $meshCount,
#       int32   $materialCount,
#       Pointer $meshes,
#       Pointer $materials,
#       int32   $meshMaterial,
#       int32   $boneCount,
#       Pointer $bones,
#       Pointer $bindPose
#     )
#       returns Model
#     {
#       malloc-Model(
#         $transform,
#         $meshCount,
#         $materialCount,
#         $meshes,
#         $materials,
#         $meshMaterial,
#         $boneCount,
#         $bones,
#         $bindPose
#       );
#     }
#
#     submethod DESTROY {
#       free-Model(self);
#     }
# }

class Model is export is repr('CStruct') is rw {
  my (%MATERIALS, %MESHES, %BONES);

  HAS Matrix        $!transform;
  has int32         $.meshCount;
  has int32         $.materialCount;
  has Pointer       $!meshes;         # Array of Mesh
  has Pointer       $.materials;      # Array of Material
  has CArray[int32] $.meshMaterial;
  has int32         $.boneCount;
  has Pointer       $!bones;          # Array of BoneInfo
  has Pointer       $.bindPose;       # Array of Transform

  method init(
    Matrix    $transform,
    int32     $meshCount,
    int32     $materialCount,
    Pointer   $meshes,
    Pointer   $materials,
    int32     $meshMaterial,
    int32     $boneCount,
    Pointer   $bones,
    Pointer   $bindPose
  )
    returns Model
  {
    nativecast(
      Model,
      malloc-Model(
        $transform,
        $meshCount,
        $materialCount,
        $meshes,
        $materials,
        $meshMaterial,
        $boneCount,
        $bones,
        $bindPose
      )
    );
  }

  method transform is rw {
    Proxy.new:
      FETCH => -> $            { $!transform      },
      STORE => -> $, Matrix \v { $!transform := v }
  }

  method mesh ($index) {
    X::Raylib::OutOfRange.new.throw if $index > $!meshCount;

    nativecast(
      Mesh,
      Pointer.new( $!meshes + $index * nativesizeof(Mesh) )
    );
  }

  method meshes {
    unless %MESHES{ self.WHERE } {
      my ($s, $c) = (self, $!meshCount);

      %MESHES{ self.WHERE } = class :: does Positional {
        method elems       { $c                       }
        method AT-POS (\k) { $s.mesh(k)               }
        method head        { $s.mesh(0)               }
        method tail        { $s.mesh(self.elems.pred) }
      }
    }
    %MESHES{ self.WHERE }
  }

  method material ($index) {
    X::Raylib::OutOfRange.new.throw if $index > $!materialCount;

    nativecast(
      Material,
      Pointer.new( +$!materials + $index * nativesizeof(Material) )
    );
  }

  # multi method materials {
  #   my sub dump-model (Model $model)
  #     is native(LIBRAYLIB)
  #     is symbol('DumpModel')
  #   { * }
  #
  #   dump-model(self);
  #   say "A: { +$!materials }";
  #   say "R :{ +Pointer.new( +$!materials + 0 * nativesizeof(Material) ) }";
  #
  #   unless %MATERIALS{ self.WHERE } {
  #     my ($s, $c) = (self, $!materialCount);
  #
  #     %MATERIALS{ self.WHERE } = class :: does Positional   {
  #       method elems       { $c                           }
  #       method AT-POS (\k) { $s.material(k)               }
  #       method head        { $s.material(0)               }
  #       method tail        { $s.material(self.elems.pred) }
  #     }
  #   }
  #   %MATERIALS{ self.WHERE }
  # }
  # multi method materials ( :$raw is required where *.so ) {
  #   $!materials;
  # }

  method bone ($index) {
    X::Raylib::OutOfRange.new.throw if $index > $!boneCount;

    nativecast(
      BoneInfo,
      Pointer.new( $!bones + $index * nativesizeof(BoneInfo) )
    );
  }

  method bones {
    unless %BONES{ self.WHERE } {
      my ($s, $c) = (self, $!boneCount);

      %BONES{ self.WHERE } = class :: does Positional    {
        method elems       { $c                       }
        method AT-POS (\k) { $s.bone(k)               }
        method head        { $s.bone(0)               }
        method tail        { $s.bone(self.elems.pred) }
      }
    }
    %BONES{ self.WHERE }
  }

  submethod DESTROY {
      %BONES{ self.WHERE }:delete;
      %MATERIALS{ self.WHERE }:delete;
      %MESHES{ self.WHERE }:delete;
      free-Model( nativecast(Model, self) );
  }
}


our sub free-Model(Model $ptr) is native(LIBRAYLIB) is symbol('free_Model') is export {*}

our sub malloc-Model(
  Matrix  $transform,
  int32   $meshCount,
  int32   $materialCount,
  Pointer $meshes,         # Array of Mesh
  Pointer $materials,      # Array of Material
  int32   $meshMaterial,
  int32   $boneCount,
  Pointer $bones,          # Array of BoneInfo
  Pointer $bindPose        # Array of Transform
) returns Model is native(LIBRAYLIB) is symbol('malloc_Model') is export {*}


class Light does StructSkipsTest is repr<CStruct> is export {
  has int     $.type           is rw;
  has uint32  $.enabled        is rw;
  has Vector3 $!position;
  has Vector3 $!target;
  has Color   $!color;
  has num32   $.attenuation    is rw;
  has int32   $.enabledLoc     is rw;
  has int32   $.typeLoc        is rw;
  has int32   $.positionLoc    is rw;
  has int32   $.targetLoc      is rw;
  has int32   $.colorLoc       is rw;
  has int32   $.attenuationLoc is rw;

  method position is rw {
    Proxy.new:
      FETCH => -> $     { $!position },
      STORE => -> $, \v { $!position := v }
  }

  method target is rw {
    Proxy.new:
      FETCH => -> $     { $!target },
      STORE => -> $, \v { $!target := v }
  }

  method color is rw {
    Proxy.new:
      FETCH => -> $     { $!color },
      STORE => -> $, \v { $!color := v }
  }

}
