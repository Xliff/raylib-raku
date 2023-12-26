use v6;

use Raylib::Bindings;

use Raylib::Raw::Circle;
use Raylib::Raw::Font;
use Raylib::Raw::Rectangle;
use Raylib::Raw::Triangle;
use Raylib::Raw::Polygon;
use Raylib::Color;

class Raylib::Draw {

  method begin {
    begin-drawing;
  }

  method end {
    end-drawing;
  }

  method fps (Int() $posX, Int() $posY) {
    my int32 ($x, $y) = ($posX, $posY);

    draw-fps($x, $y);
  }

  multi method cube (
     $position,
    :$width      = 1,
    :$height     = 1,
    :$length     = 1,
    :$color      = BLACK
  ) {
    samewith($position, $width, $height, $length, $color);
  }
  multi method cube (
     $position,
    :w(:$wires) is required,
    :$width                  = 1,
    :$height                 = 1,
    :$length                 = 1,
    :$color                  = BLACK,
  ) {
    self.cube-wires($position, $width, $height, $length, $color);
  }
  multi method cube (
     $position,
     $size,
     $color                   = BLACK,
    :v(:$vector) is required,
  ) {
    self.cube-v($position, $size, $color);
  }
  multi method cube (
    Vector3() $position,
    Num()     $width,
    Num()     $height,
    Num()     $length,
    Color()   $color      = BLACK
  ) {
    my num32 ($w, $h, $l) = ($width, $height, $length);

    draw-cube($position, $w, $h, $l, $color);
  }

  multi method cube-wires (
     $position,
    :$width      = 1,
    :$height     = 1,
    :$length     = 1,
    :$color      = BLACK
  ) {
    samewith($position, $width, $height, $length, $color);
  }
  multi method cube-wires (
    Vector3() $position,
    Num()     $width,
    Num()     $height,
    Num()     $length,
    Color()   $color      = BLACK
  ) {
    my num32 ($w, $h, $l) = ($width, $height, $length);

    draw-cube-wires($position, $w, $h, $l);
  }

  method cube-v (
    Vector3() $position,
    Vector3() $size,
    Color()   $color      = BLACK
  ) {
    draw-cube-v($position, $size, $color);
  }

  method cube-wires-v (
    Vector3() $position,
    Vector3() $size,
    Color()   $color      = BLACK
  ) {
    draw-cube-wires-v($position, $size, $color);
  }

  method grid (Int() $slices, Num() $spacing) {
    my int32 $sl = $slices;
    my num32 $sp = $spacing;

    draw-grid($sl, $sp);
  }

  multi method text (
    Str()      $text,
    Vector2()  $pos,
    Color()    $color,
    Int()     :$size   = 10
  ) {
    samewith($text, $pos.x, $pos.y, $size, $color);
  }
  multi method text (
    Str()   $text,
    Int()   $posX,
    Int()   $posY,
    Int()   $fontSize,
    Color() $color
  ) {
    my int32 ($x, $y, $f) = ($posX, $posY, $fontSize);

    draw-text($text, $x, $y, $f, $color);
  }

  method text-ex (
    Font()    $font,
    Str()     $text,
    Vector2() $position,
    Num()     $fontSize,
    Num()     $spacing,
    Color()   $tint
  ) {
    my num32 ($f, $s) = ($fontSize, $spacing);

    draw-text-ex($font, $text, $position, $f, $s, $tint);
  }

  method text-pro (
    Font()    $font,
    Str()     $text,
    Vector2() $position,
    Vector2() $origin,
    Num()     $rotation,
    Num()     $fontSize,
    Num()     $spacing,
    Color()   $tint
  ) {
    my num32 ($r, $f, $s) = ($rotation, $fontSize, $spacing);

    draw-text-pro($font, $text, $position, $origin, $r, $f, $s, $tint);
  }

  # method  text-codepoint (Font $font, int32 $codepoint, Vector2 $position, num32 $fontSize, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextCodepoint_pointerized'){ * }
  #   our sub draw-text-codepoint (Font $font, int32 $codepoint, Vector2 $position, num32 $fontSize, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextCodepoint_pointerized'){ * }
  # method  text-codepoints (Font $font, int32 $codepoints is rw, int32 $codepointCount, Vector2 $position, num32 $fontSize, num32 $spacing, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextCodepoints_pointerized'){ * }
  #   our sub draw-text-codepoints (Font $font, int32 $codepoints is rw, int32 $codepointCount, Vector2 $position, num32 $fontSize, num32 $spacing, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextCodepoints_pointerized'){ * }

# our sub draw-pixel (int32 $posX, int32 $posY, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPixel_pointerized'){ * }
# our sub draw-pixel-v (Vector2 $position, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPixelV_pointerized'){ * }

method line (
  Int()   $startPosX,
  Int()   $startPosY,
  Int()   $endPosX,
  Int()   $endPosY,
  Color() $color
) {
  my ($sx, $sy, $ex, $ey) = ($startPosX, $startPosY, $endPosX, $endPosY);

  draw-line($sx, $sy, $ex, $ey, $color);
}

# our sub draw-line-v (Vector2 $startPos, Vector2 $endPos, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLineV_pointerized'){ * }
# our sub draw-line-ex (Vector2 $startPos, Vector2 $endPos, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLineEx_pointerized'){ * }
# our sub draw-line-strip (Vector2 $points is rw, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLineStrip_pointerized'){ * }

method line-bezier (
  Vector2() $startPos,
  Vector2() $endPos,
  Num()     $thick,
  Color()   $color
) {
  my num32 $t = $thick;

  draw-line-bezier($startPos, $endPos, $t, $color);
}

# our sub draw-circle (int32 $centerX, int32 $centerY, num32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircle_pointerized'){ * }
# our sub draw-circle-sector (Vector2 $center, num32 $radius, num32 $startAngle, num32 $endAngle, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircleSector_pointerized'){ * }
# our sub draw-circle-sector-lines (Vector2 $center, num32 $radius, num32 $startAngle, num32 $endAngle, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircleSectorLines_pointerized'){ * }
# our sub draw-circle-gradient (int32 $centerX, int32 $centerY, num32 $radius, Color $color1, Color $color2) is export is native(LIBRAYLIB) is symbol('DrawCircleGradient_pointerized'){ * }

method circle-v (Vector2() $center, Num() $radius, Color() $color) {
  my num32 $r = $radius;

  draw-circle-v($center, $r, $color);
}

# our sub draw-circle-lines (int32 $centerX, int32 $centerY, num32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircleLines_pointerized'){ * }
# our sub draw-circle-lines-v (Vector2 $center, num32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircleLinesV_pointerized'){ * }
# our sub draw-ellipse (int32 $centerX, int32 $centerY, num32 $radiusH, num32 $radiusV, Color $color) is export is native(LIBRAYLIB) is symbol('DrawEllipse_pointerized'){ * }
# our sub draw-ellipse-lines (int32 $centerX, int32 $centerY, num32 $radiusH, num32 $radiusV, Color $color) is export is native(LIBRAYLIB) is symbol('DrawEllipseLines_pointerized'){ * }
# our sub draw-ring (Vector2 $center, num32 $innerRadius, num32 $outerRadius, num32 $startAngle, num32 $endAngle, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRing_pointerized'){ * }
# our sub draw-ring-lines (Vector2 $center, num32 $innerRadius, num32 $outerRadius, num32 $startAngle, num32 $endAngle, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRingLines_pointerized'){ * }

method rectangle (
  Int()   $posX,
  Int()   $posY,
  Int()   $width,
  Int()   $height,
  Color() $color
) {
  my int32 ($x, $y, $w, $h) = ($posX, $posY, $width, $height);

  draw-rectangle($x, $y, $w, $h, $color);
}

# our sub draw-rectangle-v (Vector2 $position, Vector2 $size, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleV_pointerized'){ * }
# our sub draw-rectangle-rec (Rectangle $rec, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleRec_pointerized'){ * }
# our sub draw-rectangle-pro (Rectangle $rec, Vector2 $origin, num32 $rotation, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectanglePro_pointerized'){ * }
# our sub draw-rectangle-gradient-v (int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color1, Color $color2) is export is native(LIBRAYLIB) is symbol('DrawRectangleGradientV_pointerized'){ * }
# our sub draw-rectangle-gradient-h (int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color1, Color $color2) is export is native(LIBRAYLIB) is symbol('DrawRectangleGradientH_pointerized'){ * }
# our sub draw-rectangle-gradient-ex (Rectangle $rec, Color $col1, Color $col2, Color $col3, Color $col4) is export is native(LIBRAYLIB) is symbol('DrawRectangleGradientEx_pointerized'){ * }
# our sub draw-rectangle-lines (int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleLines_pointerized'){ * }
# our sub draw-rectangle-lines-ex (Rectangle $rec, num32 $lineThick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleLinesEx_pointerized'){ * }
# our sub draw-rectangle-rounded (Rectangle $rec, num32 $roundness, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleRounded_pointerized'){ * }
# our sub draw-rectangle-rounded-lines (Rectangle $rec, num32 $roundness, int32 $segments, num32 $lineThick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleRoundedLines_pointerized'){ * }

multi method triangle (
  Vector2() $v1,
  Vector2() $v2,
  Vector2() $v3,
  Color() $color
) {
  draw-triangle($v1, $v2, $v3, $color);
}
multi method triangle (
  Num() $x1,
  Num() $y1,
  Num() $x2,
  Num() $y2,
  Num() $x3,
  Num() $y3,
  Color() $color
) {
  samewith(
    Vector2.new($x1, $y1),
    Vector2.new($x2, $y2),
    Vector2.new($x3, $y3),
    $color
  );
}
method triangle-lines (
  Vector2() $v1,
  Vector2() $v2,
  Vector2() $v3,
  Color() $color
) {
  draw-triangle-lines($v1, $v2, $v3, $color);
}

# method draw-triangle-fan (Vector2 $points is rw, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleFan_pointerized'){ * }
# our sub draw-triangle-fan (Vector2 $points is rw, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleFan_pointerized'){ * }
# our sub draw-triangle-strip (Vector2 $points is rw, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleStrip_pointerized'){ * }
# our sub draw-triangle-strip (Vector2 $points is rw, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleStrip_pointerized'){ * }

method poly (
  Vector2() $center,
  Int()     $sides,
  Num()     $radius,
  Num()     $rotation,
  Color()   $color
) {
  my int32  $s        =  $sides;
  my num32 ($ra, $ro) = ($radius, $rotation);

  draw-poly($center, $s, $ra, $ro, $color);
}

method poly-lines (
  Vector2() $center,
  Int()     $sides,
  Num()     $radius,
  Num()     $rotation,
  Color()   $color
) {
  my int32  $s        =  $sides;
  my num32 ($ra, $ro) = ($radius, $rotation);

  draw-poly-lines($center, $s, $ra, $ro, $color);
}

method poly-lines-ex (
  Vector2() $center,
  Int()     $sides,
  Num()     $radius,
  Num()     $rotation,
  Num()     $thick,
  Color()   $color
) {
  my int32  $s            =  $sides;
  my num32 ($ra, $ro, $t) = ($radius, $rotation, $thick);

  draw-poly-lines-ex($center, $s, $ra, $ro, $t, $color);
}

# our sub draw-spline-linear (Vector2 $points is rw, int32 $pointCount, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineLinear_pointerized'){ * }
# our sub draw-spline-basis (Vector2 $points is rw, int32 $pointCount, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineBasis_pointerized'){ * }
# our sub draw-spline-catmull-rom (Vector2 $points is rw, int32 $pointCount, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineCatmullRom_pointerized'){ * }
# our sub draw-spline-bezier-quadratic (Vector2 $points is rw, int32 $pointCount, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineBezierQuadratic_pointerized'){ * }
# our sub draw-spline-bezier-cubic (Vector2 $points is rw, int32 $pointCount, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineBezierCubic_pointerized'){ * }
# our sub draw-spline-segment-linear (Vector2 $p1, Vector2 $p2, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineSegmentLinear_pointerized'){ * }
# our sub draw-spline-segment-basis (Vector2 $p1, Vector2 $p2, Vector2 $p3, Vector2 $p4, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineSegmentBasis_pointerized'){ * }
# our sub draw-spline-segment-catmull-rom (Vector2 $p1, Vector2 $p2, Vector2 $p3, Vector2 $p4, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineSegmentCatmullRom_pointerized'){ * }
# our sub draw-spline-segment-bezier-quadratic (Vector2 $p1, Vector2 $c2, Vector2 $p3, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineSegmentBezierQuadratic_pointerized'){ * }
# our sub draw-spline-segment-bezier-cubic (Vector2 $p1, Vector2 $c2, Vector2 $c3, Vector2 $p4, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineSegmentBezierCubic_pointerized'){ * }

# our sub draw-line3d (Vector3 $startPos, Vector3 $endPos, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLine3D_pointerized'){ * }
# our sub draw-point3d (Vector3 $position, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPoint3D_pointerized'){ * }
# our sub draw-circle3d (Vector3 $center, num32 $radius, Vector3 $rotationAxis, num32 $rotationAngle, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircle3D_pointerized'){ * }
# our sub draw-triangle3d (Vector3 $v1, Vector3 $v2, Vector3 $v3, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangle3D_pointerized'){ * }
# our sub draw-triangle-strip3d (Vector3 $points is rw, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleStrip3D_pointerized'){ * }
# our sub draw-sphere (Vector3 $centerPos, num32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSphere_pointerized'){ * }
# our sub draw-sphere-ex (Vector3 $centerPos, num32 $radius, int32 $rings, int32 $slices, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSphereEx_pointerized'){ * }
# our sub draw-sphere-wires (Vector3 $centerPos, num32 $radius, int32 $rings, int32 $slices, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSphereWires_pointerized'){ * }
# our sub draw-cylinder (Vector3 $position, num32 $radiusTop, num32 $radiusBottom, num32 $height, int32 $slices, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCylinder_pointerized'){ * }
# our sub draw-cylinder-ex (Vector3 $startPos, Vector3 $endPos, num32 $startRadius, num32 $endRadius, int32 $sides, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCylinderEx_pointerized'){ * }
# our sub draw-cylinder-wires (Vector3 $position, num32 $radiusTop, num32 $radiusBottom, num32 $height, int32 $slices, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCylinderWires_pointerized'){ * }
# our sub draw-cylinder-wires-ex (Vector3 $startPos, Vector3 $endPos, num32 $startRadius, num32 $endRadius, int32 $sides, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCylinderWiresEx_pointerized'){ * }
# our sub draw-capsule (Vector3 $startPos, Vector3 $endPos, num32 $radius, int32 $slices, int32 $rings, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCapsule_pointerized'){ * }
# our sub draw-capsule-wires (Vector3 $startPos, Vector3 $endPos, num32 $radius, int32 $slices, int32 $rings, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCapsuleWires_pointerized'){ * }
# our sub draw-plane (Vector3 $centerPos, Vector2 $size, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPlane_pointerized'){ * }

# Texture rewrites
# our sub draw-texture (Texture2D $texture, int32 $posX, int32 $posY, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTexture_pointerized'){ * }
# our sub draw-texture-v (Texture2D $texture, Vector2 $position, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextureV_pointerized'){ * }
# our sub draw-texture-ex (Texture2D $texture, Vector2 $position, num32 $rotation, num32 $scale, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextureEx_pointerized'){ * }
# our sub draw-texture-rec (Texture2D $texture, Rectangle $source, Vector2 $position, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextureRec_pointerized'){ * }
# our sub draw-texture-pro (Texture2D $texture, Rectangle $source, Rectangle $dest, Vector2 $origin, num32 $rotation, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTexturePro_pointerized'){ * }
# our sub draw-texture-npatch (Texture2D $texture, NPatchInfo $nPatchInfo, Rectangle $dest, Vector2 $origin, num32 $rotation, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextureNPatch_pointerized'){ * }

# Ray rewrite
#our sub draw-ray (Ray $ray, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRay_pointerized'){ * }

# Model rewrites
# our sub draw-model (Model $model, Vector3 $position, num32 $scale, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawModel_pointerized'){ * }
# our sub draw-model-ex (Model $model, Vector3 $position, Vector3 $rotationAxis, num32 $rotationAngle, Vector3 $scale, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawModelEx_pointerized'){ * }
# our sub draw-model-wires (Model $model, Vector3 $position, num32 $scale, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawModelWires_pointerized'){ * }
# our sub draw-model-wires-ex (Model $model, Vector3 $position, Vector3 $rotationAxis, num32 $rotationAngle, Vector3 $scale, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawModelWiresEx_pointerized'){ * }
# our sub draw-bounding-box (BoundingBox $box, Color $color) is export is native(LIBRAYLIB) is symbol('DrawBoundingBox_pointerized'){ * }
# our sub draw-billboard (Camera $camera, Texture2D $texture, Vector3 $position, num32 $size, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawBillboard_pointerized'){ * }
# our sub draw-billboard-rec (Camera $camera, Texture2D $texture, Rectangle $source, Vector3 $position, Vector2 $size, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawBillboardRec_pointerized'){ * }
# our sub draw-billboard-pro (Camera $camera, Texture2D $texture, Rectangle $source, Vector3 $position, Vector3 $up, Vector2 $size, Vector2 $origin, num32 $rotation, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawBillboardPro_pointerized'){ * }

# Mesh rewrites
# our sub draw-mesh (Mesh $mesh, Material $material, Matrix $transform) is export is native(LIBRAYLIB) is symbol('DrawMesh_pointerized'){ * }
# our sub draw-mesh-instanced (Mesh $mesh, Material $material, Matrix $transforms is rw, int32 $instances) is export is native(LIBRAYLIB) is symbol('DrawMeshInstanced_pointerized'){ * }

}

our constant D is export = Raylib::Draw;
