use v6;

use NativeCall;

use Raylib::Bindings;

unit package Raylib::Raw::Triangle;

our sub draw-triangle (Vector2 $v1, Vector2 $v2, Vector2 $v3, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangle_pointerized'){ * }
our sub draw-triangle-lines (Vector2 $v1, Vector2 $v2, Vector2 $v3, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleLines_pointerized'){ * }
our sub draw-triangle-fan (Vector2 $points is rw, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleFan_pointerized'){ * }
our sub draw-triangle-strip (Vector2 $points is rw, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleStrip_pointerized'){ * }
our sub check-collision-point-triangle (Vector2 $point, Vector2 $p1, Vector2 $p2, Vector2 $p3) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionPointTriangle_pointerized'){ * }
