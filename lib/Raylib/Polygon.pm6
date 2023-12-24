use v6;

use NativeCall;

use Raylib::Bindings;
use Raylib::Raw::Polygon;

use Raylib::Draw;
use Raylib::Mesh;
use Raylib::Vector2;

class Raylib::Polygon {
  has Raylib::Vector2 $.center is rw;
  has int32           $.sides  is rw;
  has num32           $.radius is rw;

  submethod BUILD ( :$center is copy, :$sides, :$radius ) {
    my int32 $s = $sides;
    my num32 $r = $radius;

    ($!sides, $!radius) = ($s, $r);

    unless $center ~~ Raylib::Vector2 {
      $center = $center.Vector2 if $center.^can('Vector2');
      $center = Raylib::Vector2.new($center)
    }

    $!center = $center;
  }

  multi method new (
          $center,
    Int() $sides,
    Num() $radius
  ) {
    return Nil unless $center && $sides && $radius;

    self.bless( :$center, :$sides, :$radius );
  }
  multi method new (
    Num() $cx,
    Num() $cy,
    Int() $sides,
    Num() $radius
  ) {
    samewith(
      center => Raylib::Vector2.new($cx, $cy),

      :$sides,
      :$radius
    );
  }

  method draw (Num() $rotation, Color() $color) {
    D.poly($!center, $!sides, $!radius, $rotation, $color);
  }

  method draw-lines (Num() $rotation, Color() $color) {
    D.poly-lines($!center, $!sides, $!radius, $rotation, $color);
  }

  method draw-lines-ex (Num() $rotation, Num() $thick, Color() $color) {
    my num32 $t = $thick;

    D.poly-lines-ex($!center, $!sides, $!radius, $rotation, $t, $color);
  }

  # method check-collision-point-poly (Vector2 $point, Vector2 $points is rw, int32 $pointCount) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionPointPoly_pointerized'){ * }
  # our sub check-collision-point-poly (Vector2 $point, Vector2 $points is rw, int32 $pointCount) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionPointPoly_pointerized'){ * }

  method gen-mesh ( :$raw = False ) {
    my $m = gen-mesh-poly($!sides, $!radius);
    return Nil unless $m;
    return $m  if     $raw;
    Raylib::Mesh.new($m);
  }

}
