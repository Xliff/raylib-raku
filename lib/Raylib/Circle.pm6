use v6;

use Raylib::Bindings;
use Raylib::Raw::Circle;

use Raylib::Vector2;

class Raylib::Circle {
  has Raylib::Vector2 $.center is built is rw;
  has Num             $.radius is built is rw;

  multi method new (Vector2 $center, Num() $radius) {
    samewith( Raylib::Vector2.new($center), $radius );
  }
  multi method new (Num() $cx, Num() $cy, Num() $radius) {
    samewith( Raylib::Vector2.new($cx, $cy), $radius );
  }
  multi method new (Raylib::Vector2() $center, Num() $radius) {
    return Nil unless $center && $radius;

    self.bless( :$center, :$radius );
  }

  method draw (Color() $color) {
    my int32 ($x, $y) = ($.center.x, $.center.y)».Int;
    my num32  $r      =  $!radius;

    draw-circle($x, $y, $r, $color);
  }

  method draw-sector (
    Num()   $startAngle,
    Num()   $endAngle,
    Int()   $segments,
    Color() $color
  ) {
    my num32 ($s, $a) = ($startAngle, $endAngle);
    my int32  $seg    =  $segments;

    draw-circle-sector($!center, $!radius, $s, $a, $seg, $color);
  }

  method draw-sector-lines (
    Num()   $startAngle,
    Num()   $endAngle,
    Int()   $segments,
    Color() $color
  ) {
    my num32 ($s, $a) = ($startAngle, $endAngle);
    my int32  $seg    =  $segments;

    draw-circle-sector-lines($!center, $!radius, $s, $a, $seg, $color);
  }

  method draw-gradient (Color() $color1, Color() $color2) {
    my int32 ($cx, $cy) = ($.center.x, $.center.y)».Int;
    my num32  $r        =  $!radius;

    draw-circle-gradient($cx, $cy, $r, $color1, $color2);
  }

  method draw-lines (Color() $color) {
    my num32 $r = $!radius;

    draw-circle-lines-v($!center, $r, $color);
  }

  method check-collisions (Vector2() $center2, Num() $radius2) {
    my num32 ($r1, $r2) = ($!radius, $radius2);

    check-collision-circles($!center, $r1, $center2, $r2);
  }

  method check-collision-rec (Rectangle() $rec) {
    my num32 $r = $!radius;

    check-collision-circle-rec($!center, $r, $rec);
  }

  method check-collision-point (Vector2() $point) {
    my num32 $r = $!radius;

    check-collision-point-circle($point, $!center, $r);
  }

}
