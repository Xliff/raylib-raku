use v6;

use Raylib::Bindings;
use Raylib::Raw::Triangle;

use Raylib::Draw;
use Raylib::Vector2;

class Raylib::Triangle {
  has Raylib::Vector2 $.p1 is rw;
  has Raylib::Vector2 $.p2 is rw;
  has Raylib::Vector2 $.p3 is rw;

  submethod BUILD ( :$p1 is copy, :$p2 is copy, :$p3 is copy ) {
    $p1 = Raylib::Vector2($p1) unless $p1 ~~ Raylib::Vector2;
    $p2 = Raylib::Vector2($p2) unless $p2 ~~ Raylib::Vector2;
    $p3 = Raylib::Vector2($p3) unless $p3 ~~ Raylib::Vector2;

    $!p1 = $p1;
    $!p2 = $p2;
    $!p3 = $p3;
  }

  multi method new (
    Vector2Any $p1,
    Vector2Any $p2,
    Vector2Any $p3
  ) {
    return Nil unless $p1 && $p2 && $p3;

    self.bless( :$p1, :$p2, :$p3 );
  }
  multi method new (
    Num() $x1, Num() $y1,
    Num() $x2, Num() $y2,
    Num() $x3, Num() $y3
  ) {
    samewith(
      Raylib::Vector2.new($x1, $y1),
      Raylib::Vector2.new($x2, $y2),
      Raylib::Vector2.new($x3, $y3)
    );
  }

  method draw (Color() $color) {
    D.triangle($!p1, $!p2, $!p3, $color);
  }

  method draw-lines (Color() $color) {
    D.triangle-lines($!p1, $!p2, $!p3, $color);
  }

  # method draw-fan (Vector2 $points is rw, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleFan_pointerized'){ * }
  # our sub draw-triangle-fan (Vector2 $points is rw, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleFan_pointerized'){ * }
  # method draw-strip (Vector2 $points is rw, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleStrip_pointerized'){ * }
  # our sub draw-triangle-strip (Vector2 $points is rw, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleStrip_pointerized'){ * }

  method check-collision-point (Vector2() $point) {
    check-collision-point-triangle($point, $!p1, $!p2, $!p3);
  }

}
