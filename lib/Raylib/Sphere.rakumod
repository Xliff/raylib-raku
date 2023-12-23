use v6;

use Method::Also;
use Raylib::Bindings;
use Raylib::Raw::Sphere;

use Raylib::Color;
use Raylib::Vector3;

class Raylib::Sphere {
  has Raylib::Vector3 $.center is rw;
  has Num             $.radius is rw;

  method new (
    Raylib::Vector3 $center,
    Num()           $radius
  ) {
    return Nil unless $center && $radius;

    self.bless( :$center, :$radius );
  }

  multi method gen-mesh (
    Raylib::Sphere:U:

    Num() :$radius  = 1,
    Int() :$rings   = 1,
    Int() :$slices  = 10,
          :$raw     = False
  ) {
    samewith($radius, $rings, $slices, :$raw);
  }
  multi method gen-mesh (
    Raylib::Sphere:U:

    Num()  $radius,
    Int()  $rings ,
    Int()  $slices,
          :$raw     = False
  ) {
    my num32  $ra      = $radius;
    my int32 ($rg, $s) = ($rings, $slices);

    my $m = gen-mesh-sphere($ra, $rg, $s);
    return $m if $raw;
    Raylib::Mesh.new($m);
  }

  proto method gen-mesh-hemisphere (|)
    is also<gen-hemisphere-mesh>
  { * }

  multi method gen-mesh-hemisphere (
    Num() :$radius  = 1,
    Int() :$rings   = 4,
    Int() :$slices  = 10,
          :$raw     = False
  ) {
    samewith($radius, $rings, $slices, :$raw);
  }
  multi method gen-mesh-hemisphere (
    Num()  $radius,
    Int()  $rings,
    Int()  $slices,
          :$raw     = False
  ) {
    my num32  $ra      = $radius;
    my int32 ($rg, $s) = ($rings, $slices);

    my $m = gen-mesh-hemisphere($ra, $rg, $s);
    return $m if $raw;
    Raylib::Mesh.new($m);
  }

  multi method check-collision (
    $box is copy where { $_ ~~ BoundingBox || .^can('BoundingBox') }
  ) {
    $box = $box.BoundingBox unless $box ~~ BoundingBox;

    my num32 $r = $!radius;

    check-collision-box-sphere($box, $!center.Vector3, $r);
  }
  multi method check-collision (Raylib::Sphere $sphere2) {
    samewith($sphere2.center, $sphere2.radius);
  }
  multi method check-collision (Vector3() $center2, Num() $radius2) {
    my num32 $r = $radius2;

    check-collision-spheres($!center, $!radius, $center2, $r);
  }

  multi method draw (Color() $color = BLACK) {
    my num32 $r = $!radius;

    draw-sphere($!center.Vector3, $r, $color);
  }
  multi method draw (
    Int()    $rings,
    Int()    $slices,
    Color()  $color                 = BLACK,
            :w(:$wires) is required
  ) {
    self.draw-wires($rings, $slices, $color);
  }

  multi method draw-ex (
    Int()   :$rings  = 4,
    Int()   :$slices = 10,
    Color() :$color  = BLACK
  ) {
    samewith($rings, $slices, $color);
  }
  multi method draw-ex (Int() $rings, Int() $slices, Color() $color) {
    my int32 ($r, $s) = ($rings, $slices);

    draw-sphere-ex($!center, $!radius, $r, $s, $color);
  }

  multi method draw-wires (
    Int()   :$rings  = 4,
    Int()   :$slices = 10,
    Color() :$color  = BLACK
  ) {
    samewith($!center, $!radius, $rings, $slices, $color);
  }
  multi method draw-wires (
    Int()   $rings,
    Int()   $slices,
    Color() $color  = BLACK
  ) {
    my num32  $r       = $!radius;
    my int32 ($ri, $s) = ($rings, $slices);

    draw-sphere-wires($!center.Vector3, $r, $ri, $s, $color);
  }

}
