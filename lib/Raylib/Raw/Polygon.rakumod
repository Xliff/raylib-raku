use v6.c;

use NativeCall;

use Raylib::Raw::Definitions;
use Raylib::Raw::Structs;

unit package Raylib::Raw::Polygon;

our sub draw-poly (Vector2 $center, int32 $sides, num32 $radius, num32 $rotation, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPoly_pointerized'){ * }
our sub draw-poly-lines (Vector2 $center, int32 $sides, num32 $radius, num32 $rotation, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPolyLines_pointerized'){ * }

our sub draw-poly-lines-ex (
  Vector2 $center,
  int32 $sides,
  num32 $radius,
  num32 $rotation,
  num32 $lineThick,
  Color $color
)
  is export
  is native(LIBRAYLIB)
  is symbol('DrawPolyLinesEx_pointerized'){ * }

our sub check-collision-point-poly (Vector2 $point, Vector2 $points is rw, int32 $pointCount) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionPointPoly_pointerized'){ * }
our sub gen-mesh-poly (int32 $sides, num32 $radius) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshPoly_pointerized'){ * }
