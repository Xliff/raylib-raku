use v6;

use Method::Also;

use Raylib::Bindings;
use Raylib::Raw::Vector2;

use Raylib::Roles::Reapable;

class Raylib::Vector2 does Reapable {
  has Vector2 $!v2 handles(*) is built;

  method Raylib::Bindings::Vector2
    is also<Vector2>
  { $!v2 }

  proto method new (|)
  { * }

  multi method new (Vector2 $v2) {
    return Nil unless $v2;
    self.bless( :$v2 );
  }
  multi method new (Num() $x, Num() $y) {
    my num32 ($xx, $yy) = ($x, $y);

    my $v2 = Vector2.init($xx, $yy);
    return Nil unless $v2;
    my $o = self.bless( :$v2 );
    $o.addReapable($v2);
    return $o;
  }

  # method check-collision-circle-rec (
  #     Vector2 $center,
  #     num32 $radius,
  #     Rectangle $rec
  # ) {
  #   check-collision-circle-rec(...);
  # }

  # method check-collision-circles (
  #     Vector2 $center1,
  #     num32 $radius1,
  #     Vector2 $center2,
  #     num32 $radius2
  # ) {
  #   check-collision-circles(...);
  # }

  method check-collision-lines (
      Vector2() $endPos1,
      Vector2() $startPos2,
      Vector2() $endPos2,
      Vector2() $collisionPoint
  ) {
    check-collision-lines(
      $!v2,
      $endPos1,
      $startPos2,
      $endPos2,
      $collisionPoint
    );
  }

  # method check-collision-point-circle (
  #     Vector2 $point,
  #     Vector2 $center,
  #     num32 $radius
  # ) {
  #   my num32 $r = $radius;
  #
  #   check-collision-point-circle($!v2, $center, $r);
  # }

  method check-collision-point-line (
      Vector2() $p1,
      Vector2() $p2,
      Int()     $threshold
  ) {
    my int32 $t = $threshold;

    check-collision-point-line($!v2, $p1, $p2, $t);
  }

  # method check-collision-point-poly (
  #     Vector2() $point,
  #     Vector2() $points,
  #     int32 $pointCount
  # ) {
  #   check-collision-point-poly(...);
  # }

  # method check-collision-point-triangle (
  #     Vector2() $point,
  #     Vector2() $p1,
  #     Vector2() $p2,
  #     Vector2() $p3
  # ) {
  #   check-collision-point-triangle($!v2, $p1, $p2, $p3);
  # }

  method draw-line-bezier (
      Vector2() $endPos,
      Num()     $thick,
      Color()   $color
  ) {
    my num32 $t = $thick;
    draw-line-bezier($!v2, $endPos, $t, $color);
  }

  method draw-line-ex (
      Vector2() $endPos,
      Num()     $thick,
      Color()   $color
  ) {
    my num32 $t = $thick;

    draw-line-ex($!v2, $endPos, $t, $color);
  }

  # method draw-line-strip (
  #     Vector2 $points,
  #     int32 $pointCount,
  #     Color $color
  # ) {
  #   draw-line-strip(...);
  # }

  method draw-line-v (Vector2() $endPos, Color() $color) {
    draw-line-v($!v2, $endPos, $color);
  }

  method draw-pixel-v (Color() $color) {
    draw-pixel-v($!v2, $color);
  }

  method get-world-to-screen2d (Camera2D() $camera) {
    get-world-to-screen2d($!v2, $camera);
  }

  method scale (Num() $f) {
    Raylib::Vector2.new( $f * $.x, $f * $.y)
  }
}

subset Vector2Any is export of Mu
  where Raylib::Vector2 | Raylib::Bindings::Vector2;

multi sub infix:<+> (Raylib::Vector2 $a, Raylib::Vector2 $b)  is export {
  Raylib::Vector2.new(
    $a.x + $b.x,
    $a.y + $b.y
  );
}

multi sub infix:<+> (Raylib::Vector2 $a, List $b where *.elems == 2)  is export {
  Raylib::Vector2.new(
    $a.x + $b.head,
    $a.y + $b.tail
  );
}

multi sub infix:<-> (Raylib::Vector2 $a, Raylib::Vector2 $b)  is export {
  Raylib::Vector2.new(
    $a.x - $b.x,
    $a.y - $b.y
  );
}

multi sub infix:<-> (List $a, Raylib::Vector2 $b)  is export {
  Raylib::Vector2.new(
    $a.head - $b.x,
    $a.tail - $b.y
  );
}
