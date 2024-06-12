use v6;

use NativeCall;

use Raylib::Raw::Definitions;
use Raylib::Raw::Structs;

unit package Raylib::Raw::Sphere;

our sub check-collision-box-sphere (
  BoundingBox $box,
  Vector3     $center,
  num32       $radius
)
  returns bool
  is export
  is native(LIBRAYLIB)
  is symbol('CheckCollisionBoxSphere_pointerized'){ * }

our sub gen-mesh-sphere (num32 $radius, int32 $rings, int32 $slices) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshSphere_pointerized'){ * }
our sub gen-mesh-hemisphere (num32 $radius, int32 $rings, int32 $slices) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshHemiSphere_pointerized'){ * }
our sub check-collision-spheres (Vector3 $center1, num32 $radius1, Vector3 $center2, num32 $radius2) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionSpheres_pointerized'){ * }
our sub draw-sphere (Vector3 $centerPos, num32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSphere_pointerized'){ * }
our sub draw-sphere-ex (Vector3 $centerPos, num32 $radius, int32 $rings, int32 $slices, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSphereEx_pointerized'){ * }
our sub draw-sphere-wires (Vector3 $centerPos, num32 $radius, int32 $rings, int32 $slices, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSphereWires_pointerized'){ * }
