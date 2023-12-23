use v6;

use Method::Also;

use Raylib::Bindings;
use Raylib::Matrix;
use Raylib::Vector3;

use Raylib::Roles::Reapable;

class Raylib::Camera does Reapable {
  has Camera3D $.camera handles(*) is built;

  method Raylib::Bindings::Camera
    is also<
      Camera3D
      Camera
    >
  {
    $!camera
  }

  multi method new (Camera $camera) {
    return Nil unless $camera;
    self.bless( :$camera );
  }
  multi method new (
    Vector3() :$position,
    Vector3() :$target,
    Vector3() :$up,
    Num()     :$fovy       = 0,
    Int()     :$projection = 0,
  ) {
    my num32 $f = $fovy;
    my int32 $p = $projection;

    my $camera = Camera3D.init(
      $position,
      $target,
      $up,
      $f,
      $p
    );

    my $o = self.bless( :$camera );
    $o.addReapable($camera);
    $o;
  }
  multi method new (
    Vector3() $position,
    Vector3() $target,
    Vector3() $up,
    Num()     $fovy,
    Int()     $projection
  ) {
    my num32 $f = $fovy;
    my int32 $p = $projection;

    my $camera = Camera3D.init(
      $position,
      $target,
      $up,
      $f,
      $p
    );

    my $o = self.bless( :$camera );
    $o.addReapable($camera);
    $o;
  }

  method update (Int() $mode) {
    my int32 $m = $mode;

    update-camera($!camera, $m);
  }

  method begin-mode is also<begin> {
    begin-mode3d($!camera);
  }

  method end-mode3d is also<end> {
    end-mode3d;
  }

  method get-matrix ( :$raw = False ) {
    my $m = get-camera-matrix($!camera);
    return $m if $raw;
    Raylib::Matrix.new($m);
  }

  method update-camera-pro (
    Vector3() $movement,
    Vector3() $rotation,
    Num()     $zoom
  ) {
    my num32 $z = $zoom;

    update-camera-pro($!camera, $movement, $rotation, $zoom);
  }

}
