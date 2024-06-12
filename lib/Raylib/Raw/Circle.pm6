use v6;

use NativeCall;

use Raylib::Raw::Definitions;
use Raylib::Raw::Structs;

unit package Raylib::Raw::Circle;

our sub draw-circle (int32 $centerX, int32 $centerY, num32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircle_pointerized'){ * }
our sub draw-circle-sector (Vector2 $center, num32 $radius, num32 $startAngle, num32 $endAngle, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircleSector_pointerized'){ * }
our sub draw-circle-sector-lines (Vector2 $center, num32 $radius, num32 $startAngle, num32 $endAngle, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircleSectorLines_pointerized'){ * }
our sub draw-circle-gradient (int32 $centerX, int32 $centerY, num32 $radius, Color $color1, Color $color2) is export is native(LIBRAYLIB) is symbol('DrawCircleGradient_pointerized'){ * }
our sub draw-circle-v (Vector2 $center, num32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircleV_pointerized'){ * }
our sub draw-circle-lines (int32 $centerX, int32 $centerY, num32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircleLines_pointerized'){ * }
our sub draw-circle-lines-v (Vector2 $center, num32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircleLinesV_pointerized'){ * }
our sub check-collision-circles (Vector2 $center1, num32 $radius1, Vector2 $center2, num32 $radius2) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionCircles_pointerized'){ * }
our sub check-collision-circle-rec (Vector2 $center, num32 $radius, Rectangle $rec) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionCircleRec_pointerized'){ * }
our sub check-collision-point-circle (Vector2 $point, Vector2 $center, num32 $radius) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionPointCircle_pointerized'){ * }
our sub draw-circle3d (Vector3 $center, num32 $radius, Vector3 $rotationAxis, num32 $rotationAngle, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircle3D_pointerized'){ * }
