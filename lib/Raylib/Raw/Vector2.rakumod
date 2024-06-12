use v6;

use NativeCall;

use Raylib::Raw::Definitions;
use Raylib::Raw::Structs;

unit package Raylib::Raw::Vector2;

sub check-collision-circle-rec (
    Vector2 $center,
    num32 $radius,
    Rectangle $rec
    --> bool
  )
  is symbol("CheckCollisionCircleRec_pointerized")
  is native(LIBRAYLIB) {*};

sub check-collision-circles (
    Vector2 $center1,
    num32 $radius1,
    Vector2 $center2,
    num32 $radius2
    --> bool
  )
  is symbol("CheckCollisionCircles_pointerized")
  is native(LIBRAYLIB) {*};

sub check-collision-lines (
    Vector2 $startPos1,
    Vector2 $endPos1,
    Vector2 $startPos2,
    Vector2 $endPos2,
    Vector2 $collisionPoint
    --> bool
  )
  is symbol("CheckCollisionLines_pointerized")
  is native(LIBRAYLIB) {*};

sub check-collision-point-circle (
    Vector2 $point,
    Vector2 $center,
    num32 $radius
    --> bool
  )
  is symbol("CheckCollisionPointCircle_pointerized")
  is native(LIBRAYLIB) {*};

sub check-collision-point-line (
    Vector2 $point,
    Vector2 $p1,
    Vector2 $p2,
    int32 $threshold
    --> bool
  )
  is symbol("CheckCollisionPointLine_pointerized")
  is native(LIBRAYLIB) {*};

sub check-collision-point-poly (
    Vector2 $point,
    Vector2 $points,
    int32 $pointCount
    --> bool
  )
  is symbol("CheckCollisionPointPoly_pointerized")
  is native(LIBRAYLIB) {*};

sub check-collision-point-triangle (
    Vector2 $point,
    Vector2 $p1,
    Vector2 $p2,
    Vector2 $p3
    --> bool
  )
  is symbol("CheckCollisionPointTriangle_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-circle-lines-v (
    Vector2 $center,
    num32 $radius,
    Color $color
  )
  is symbol("DrawCircleLinesV_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-circle-sector (
    Vector2 $center,
    num32 $radius,
    num32 $startAngle,
    num32 $endAngle,
    int32 $segments,
    Color $color
  )
  is symbol("DrawCircleSector_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-circle-sector-lines (
    Vector2 $center,
    num32 $radius,
    num32 $startAngle,
    num32 $endAngle,
    int32 $segments,
    Color $color
  )
  is symbol("DrawCircleSectorLines_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-circle-v (
    Vector2 $center,
    num32 $radius,
    Color $color
  )
  is symbol("DrawCircleV_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-line-bezier (
    Vector2 $startPos,
    Vector2 $endPos,
    num32 $thick,
    Color $color
  )
  is symbol("DrawLineBezier_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-line-ex (
    Vector2 $startPos,
    Vector2 $endPos,
    num32 $thick,
    Color $color
  )
  is symbol("DrawLineEx_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-line-strip (
    Vector2 $points,
    int32 $pointCount,
    Color $color
  )
  is symbol("DrawLineStrip_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-line-v (
    Vector2 $startPos,
    Vector2 $endPos,
    Color $color
  )
  is symbol("DrawLineV_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-pixel-v (
    Vector2 $position,
    Color $color
  )
  is symbol("DrawPixelV_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-poly (
    Vector2 $center,
    int32 $sides,
    num32 $radius,
    num32 $rotation,
    Color $color
  )
  is symbol("DrawPoly_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-poly-lines (
    Vector2 $center,
    int32 $sides,
    num32 $radius,
    num32 $rotation,
    Color $color
  )
  is symbol("DrawPolyLines_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-poly-lines-ex (
    Vector2 $center,
    int32 $sides,
    num32 $radius,
    num32 $rotation,
    num32 $lineThick,
    Color $color
  )
  is symbol("DrawPolyLinesEx_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-ring (
    Vector2 $center,
    num32 $innerRadius,
    num32 $outerRadius,
    num32 $startAngle,
    num32 $endAngle,
    int32 $segments,
    Color $color
  )
  is symbol("DrawRing_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-ring-lines (
    Vector2 $center,
    num32 $innerRadius,
    num32 $outerRadius,
    num32 $startAngle,
    num32 $endAngle,
    int32 $segments,
    Color $color
  )
  is symbol("DrawRingLines_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-spline-basis (
    Vector2 $points,
    int32 $pointCount,
    num32 $thick,
    Color $color
  )
  is symbol("DrawSplineBasis_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-spline-bezier-cubic (
    Vector2 $points,
    int32 $pointCount,
    num32 $thick,
    Color $color
  )
  is symbol("DrawSplineBezierCubic_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-spline-bezier-quadratic (
    Vector2 $points,
    int32 $pointCount,
    num32 $thick,
    Color $color
  )
  is symbol("DrawSplineBezierQuadratic_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-spline-catmull-rom (
    Vector2 $points,
    int32 $pointCount,
    num32 $thick,
    Color $color
  )
  is symbol("DrawSplineCatmullRom_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-spline-linear (
    Vector2 $points,
    int32 $pointCount,
    num32 $thick,
    Color $color
  )
  is symbol("DrawSplineLinear_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-spline-segment-basis (
    Vector2 $p1,
    Vector2 $p2,
    Vector2 $p3,
    Vector2 $p4,
    num32 $thick,
    Color $color
  )
  is symbol("DrawSplineSegmentBasis_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-spline-segment-bezier-cubic (
    Vector2 $p1,
    Vector2 $c2,
    Vector2 $c3,
    Vector2 $p4,
    num32 $thick,
    Color $color
  )
  is symbol("DrawSplineSegmentBezierCubic_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-spline-segment-bezier-quadratic (
    Vector2 $p1,
    Vector2 $c2,
    Vector2 $p3,
    num32 $thick,
    Color $color
  )
  is symbol("DrawSplineSegmentBezierQuadratic_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-spline-segment-catmull-rom (
    Vector2 $p1,
    Vector2 $p2,
    Vector2 $p3,
    Vector2 $p4,
    num32 $thick,
    Color $color
  )
  is symbol("DrawSplineSegmentCatmullRom_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-spline-segment-linear (
    Vector2 $p1,
    Vector2 $p2,
    num32 $thick,
    Color $color
  )
  is symbol("DrawSplineSegmentLinear_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-triangle (
    Vector2 $v1,
    Vector2 $v2,
    Vector2 $v3,
    Color $color
  )
  is symbol("DrawTriangle_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-triangle-fan (
    Vector2 $points,
    int32 $pointCount,
    Color $color
  )
  is symbol("DrawTriangleFan_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-triangle-lines (
    Vector2 $v1,
    Vector2 $v2,
    Vector2 $v3,
    Color $color
  )
  is symbol("DrawTriangleLines_pointerized")
  is native(LIBRAYLIB) {*};

sub draw-triangle-strip (
    Vector2 $points,
    int32 $pointCount,
    Color $color
  )
  is symbol("DrawTriangleStrip_pointerized")
  is native(LIBRAYLIB) {*};

sub get-mouse-ray (
    Vector2 $mousePosition,
    Camera $camera
    --> Ray
  )
  is symbol("GetMouseRay_pointerized")
  is native(LIBRAYLIB) {*};

sub get-screen-to-world2d (
    Vector2 $position,
    Camera2D $camera
    --> Vector2
  )
  is symbol("GetScreenToWorld2D_pointerized")
  is native(LIBRAYLIB) {*};

sub get-spline-point-basis (
    Vector2 $p1,
    Vector2 $p2,
    Vector2 $p3,
    Vector2 $p4,
    num32 $t
    --> Vector2
  )
  is symbol("GetSplinePointBasis_pointerized")
  is native(LIBRAYLIB) {*};

sub get-spline-point-bezier-cubic (
    Vector2 $p1,
    Vector2 $c2,
    Vector2 $c3,
    Vector2 $p4,
    num32 $t
    --> Vector2
  )
  is symbol("GetSplinePointBezierCubic_pointerized")
  is native(LIBRAYLIB) {*};

sub get-spline-point-bezier-quad (
    Vector2 $p1,
    Vector2 $c2,
    Vector2 $p3,
    num32 $t
    --> Vector2
  )
  is symbol("GetSplinePointBezierQuad_pointerized")
  is native(LIBRAYLIB) {*};

sub get-spline-point-catmull-rom (
    Vector2 $p1,
    Vector2 $p2,
    Vector2 $p3,
    Vector2 $p4,
    num32 $t
    --> Vector2
  )
  is symbol("GetSplinePointCatmullRom_pointerized")
  is native(LIBRAYLIB) {*};

sub get-spline-point-linear (
    Vector2 $startPos,
    Vector2 $endPos,
    num32 $t
    --> Vector2
  )
  is symbol("GetSplinePointLinear_pointerized")
  is native(LIBRAYLIB) {*};

sub get-world-to-screen2d (
    Vector2 $position,
    Camera2D $camera
    --> Vector2
  )
  is symbol("GetWorldToScreen2D_pointerized")
  is native(LIBRAYLIB) {*};
