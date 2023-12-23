use v6;

use NativeCall;

use Raylib::Bindings;

unit package Raylib::Raw::BoundingBox;

our sub check-collision-box-sphere (
  BoundingBox $box,
  Vector3     $center,
  num32       $radius
)
  returns bool
  is export
  is native(LIBRAYLIB)
  is symbol('CheckCollisionBoxSphere_pointerized'){ * }

our sub check-collision-boxes (
  BoundingBox $box1,
  BoundingBox $box2
)
  returns bool
  is export
  is native(LIBRAYLIB)
  is symbol('CheckCollisionBoxes_pointerized'){ * }

our sub draw-bounding-box (
  BoundingBox $box,
  Color       $color
)
  is export
  is native(LIBRAYLIB)
  is symbol('DrawBoundingBox_pointerized'){ * }

our sub draw-sphere (
  Vector3 $centerPos,
  num32   $radius,
  Color   $color
)
  is export
  is native(LIBRAYLIB)
  is symbol('DrawSphere_pointerized'){ * }

our sub draw-sphere-ex (
  Vector3 $centerPos,
  num32   $radius,
  int32   $rings,
  int32   $slices,
  Color   $color
)
  is export
  is native(LIBRAYLIB)
  is symbol('DrawSphereEx_pointerized'){ * }

our sub draw-sphere-wires (
  Vector3 $centerPos,
  num32   $radius,
  int32   $rings,
  int32   $slices,
  Color   $color
)
  is export
  is native(LIBRAYLIB)
  is symbol('DrawSphereWires_pointerized'){ * }
