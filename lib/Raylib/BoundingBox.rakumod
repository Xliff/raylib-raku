use v6;

use Method::Also;
use NativeCall;

use Raylib::Bindings;
use Raylib::Raw::BoundingBox;

use Raylib::Roles::Reapable;

use Raylib::Sphere;

class Raylib::BoundingBox does Reapable {
  has BoundingBox $!bounding-box is built;

  method Raylib::Bindings::BoundingBox
    is also<BoundingBox>
  { $!bounding-box }

  proto method new (|)
  { * }

  multi method new (BoundingBox $bounding-box) {

    return Nil unless $bounding-box;
    self.bless( :$bounding-box );
  }
  multi method new ($min is copy, $max is copy) {
    $min = $min.Vector3;
    $max = $max.Vector3;
    
    my $bounding-box = BoundingBox.init($min, $max);
    return Nil unless $bounding-box;
    my $o = self.bless( :$bounding-box );
    $o.addReapable($bounding-box);
    $o;
  }

  method draw (Color() $color) {
    draw-bounding-box($!bounding-box, $color);
  }

  multi method check-collision (BoundingBox() $box2) {
    check-collision-boxes($!bounding-box, $box2);
  }
  multi method check-collision (Vector3() $center, Num() $radius) {
    my num32 $r = $radius;

    check-collision-box-sphere($!bounding-box, $center, $r);
  }
  multi method check-collision (Raylib::Sphere $sphere) {
    samewith($sphere.center, $sphere.radius);
  }

}
