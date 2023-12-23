use v6;

use NativeCall;

use Raylib::Raw::Exceptions;
use Raylib::Bindings;

class Model is export is repr('CStruct') is rw {
    HAS Matrix        $.transform;
    has int32         $.meshCount;
    has int32         $.materialCount;
    has Pointer       $.meshes;        #= Array of Mesh
    has Pointer       $.materials;     #= Array of Material
    has CArray[int32] $.meshMaterial;
    has int32         $.boneCount;
    has Pointer       $.bones;         #= Array of BoneInfo
    has Pointer       $.bindPose;      #= Array of Transform

    method init(
      Matrix  $transform,
      int32   $meshCount,
      int32   $materialCount,
      Pointer $meshes,
      Pointer $materials,
      int32   $meshMaterial,
      int32   $boneCount,
      Pointer $bones,
      Pointer $bindPose
    )
      returns Model
    {
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
      );
    }

    submethod DESTROY {
      free-Model(self);
    }
}

class ModelRevised is export is repr('CStruct') is rw {
  my (%MATERIALS, %MESHES, %BONES);

  has Matrix        $.transform;
  has int32         $.meshCount;
  has int32         $.materialCount;
  has Pointer       $!meshes;         # ARRAY!
  has Pointer       $!materials;      # ARRAY!
  has CArray[int32] $.meshMaterial;
  has int32         $.boneCount;
  has Pointer       $!bones;          # ARRAY!
  has Pointer       $.bindPose;       # ARRAY!

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
    returns ModelRevised
  {
    nativecast(
      ModelRevised,
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
      Pointer.new( $!materials + $index * nativesizeof(Material) )
    );
  }

  method materials {
    unless %MATERIALS{ self.WHERE } {
      my ($s, $c) = (self, $!materialCount);

      %MATERIALS{ self.WHERE } = class :: does Positional   {
        method elems       { $c                           }
        method AT-POS (\k) { $s.material(k)               }
        method head        { $s.material(0)               }
        method tail        { $s.material(self.elems.pred) }
      }
    }
    %MATERIALS{ self.WHERE }
  }

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

our sub load-model (Str $fileName)
  returns Model
  is export
  is native(LIBRAYLIB)
  is symbol('LoadModel_pointerized'){ * }

our sub free-Model(Model $ptr) is native(LIBRAYLIB) is symbol('free_Model') is export {*}

our sub set-model-mesh-material (
  Model $model,
  int32 $meshId,
  int32 $materialId
) is export is native(LIBRAYLIB) is symbol('SetModelMeshMaterial'){ * }

our sub is-model-ready (Model $model) returns bool is export is native(LIBRAYLIB) is symbol('IsModelReady_pointerized'){ * }

our sub unload-model (Model $model)
  is export
  is native(LIBRAYLIB)
  is symbol('UnloadModel_pointerized'){ * }

our sub get-model-bounding-box (Model $model)
  returns BoundingBox
  is export
  is native(LIBRAYLIB)
  is symbol('GetModelBoundingBox_pointerized'){ * }

our sub draw-model (
  Model $model,
  Vector3 $position,
  num32 $scale,
  Color $tint
) is export is native(LIBRAYLIB) is symbol('DrawModel_pointerized'){ * }

our sub draw-model-ex (
  Model $model,
  Vector3 $position,
  Vector3 $rotationAxis,
  num32 $rotationAngle,
  Vector3 $scale,
  Color $tint
) is export is native(LIBRAYLIB) is symbol('DrawModelEx_pointerized'){ * }

our sub draw-model-wires (
  Model $model,
  Vector3 $position,
  num32 $scale,
  Color $tint
) is export is native(LIBRAYLIB) is symbol('DrawModelWires_pointerized'){ * }

our sub draw-model-wires-ex (
  Model $model,
  Vector3 $position,
  Vector3 $rotationAxis,
  num32 $rotationAngle,
  Vector3 $scale,
  Color $tint
) is export is native(LIBRAYLIB) is symbol('DrawModelWiresEx_pointerized'){ * }

our sub update-model-animation (
  Model $model,
  ModelAnimation $anim,
  int32 $frame
) is export is native(LIBRAYLIB) is symbol('UpdateModelAnimation_pointerized'){ * }

our sub is-model-animation-valid (
  Model $model,
  ModelAnimation $anim
) returns bool is export is native(LIBRAYLIB) is symbol('IsModelAnimationValid_pointerized'){ * }

our sub load-model-from-mesh (
  Mesh $mesh
)
  returns Model
  is export
  is native(LIBRAYLIB)
  is symbol('LoadModelFromMesh_pointerized'){ * }

our sub malloc-Model(
  Matrix $transform,
  int32 $meshCount,
  int32 $materialCount,
  Pointer $meshes,
  Pointer $materials,
  int32 $meshMaterial,
  int32 $boneCount,
  Pointer $bones,
  Pointer $bindPose
) returns Model is native(LIBRAYLIB) is symbol('malloc_Model') is export {*}
