use v6;

use Method::Also;
use Raylib::Bindings;

use Raylib::Vector3;
use Raylib::Vector4;

use Raylib::Roles::Reapable;

class Raylib::Transform {
  has Transform $!transform is built;

  method Raylib::Bindings::Transform
    is also<Transform>
  { $!transform }

  multi method new (Transform $transform) {
    return Nil unless $transform;
    self.bless( :$transform );
  }
  multi method new (
    Vector3() $translation,
    Vector4() $rotation,
    Vector3() $scale
  ) {
    my $transform = Transform.init($translation, $rotation, $scale);
    return Nil unless $transform;
    my $o = self.bless( :$transform );
    $o.addReapable($transform);
    $o;
  }

  method translation ( :$raw = False ) {
    return Nil unless $!transform.translation;
    return $!transform.translation if $raw;
    Raylib::Vector3.new( $!transform.translation );
  }

  method rotation ( :$raw = False ) {
    return Nil unless $!transform.rotation;
    return $!transform.rotation if $raw;
    Raylib::Vector4.new( $!transform.rotation );
  }

  method scale ( :$raw = False ) {
    return Nil unless $!transform.scale;
    return $!transform.scale if $raw;
    Raylib::Vector3.new( $!transform.scale );
  }

}
