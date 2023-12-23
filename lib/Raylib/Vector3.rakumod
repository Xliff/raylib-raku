use v6;

use Method::Also;
use Raylib::Bindings;
#use Raylib::Vector2;

class Raylib::Vector3 {
  has Vector3 $!v3 handles(*) is built;

  method Raylib::Bindings::Vector3
    is also<Vector3>
  { $!v3 }

  multi method new (Vector3 $v3) {
    return Nil unless $v3;
    self.bless( :$v3 );
  }
  multi method new (Num() :$x = 0, Num() :$y = 0, Num() :$z = 0) {
    samewith($x, $y, $z);
  }
  multi method new (Num() $xx, Num() $yy, Num() $zz) {
    my num32 ($x, $y, $z) = ($xx, $yy, $zz);

    self.bless( v3 => Vector3.init($x, $y, $z) );
  }

  method Array {
    ( $.x, $.y, $.z );
  }

  method scale ($f, :$raw = False) {
    my $v = Raylib::Vector3.new(
      x => $.x * $f,
      y => $.y * $f,
      z => $.z * $f
    );
    return $v.Vector3 if $raw;
    $v;
  }

  method get-world-to-screen (
    Vector3()  $position,
    Camera()   $camera,
              :$raw        = False
  ) {
    my $v = get-world-to-screen($position, $camera);
    return $v if $raw;
    #Raylib::Vector2.new($v);
    $v;
  }

  method get-world-to-screen-ex (
    Vector3()  $position,
    Camera()   $camera,
    Int()      $width,
    Int()      $height,
              :$raw       = False
  ) {
    my int32 ($w, $h) = ($width, $height);

    my $v = get-world-to-screen-ex($position, $camera, $w, $h);
    return $v if $raw;
    #Raylib::Vector2.new($v);
    $v;
  }

}

multi sub infix:<+>(Raylib::Vector3 $a, Raylib::Vector3 $b) is export {
  my $r = Raylib::Vector3.new(
    x => $a.x + $b.x,
    y => $a.y + $b.y,
    z => $a.z + $b.z
  );
  $r;
}

multi sub infix:<->(Raylib::Vector3 $a, Raylib::Vector3 $b) is export {
  my $r = Raylib::Vector3.new(
    x => $a.x - $b.x,
    y => $a.y - $b.y,
    z => $a.z - $b.z
  );
  $r;
}
