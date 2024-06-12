use v6;

use NativeCall;

use Raylib::Raw::Definitions;
use Raylib::Raw::Enums;
use Raylib::Raw::Structs;
use Raylib::Raw::Exceptions;
use Raylib::Bindings;

our sub load-model (Str $fileName)
  returns Model
  is export
  is native(LIBRAYLIB)
  is symbol('LoadModel_pointerized'){ * }

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

our sub dump-model (Model $model)
    is export
    is native(LIBRAYLIB)
    is symbol('DumpModel')
  { * }
