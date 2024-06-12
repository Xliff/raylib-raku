use v6.c;

use Raylib::Raw::Definitions;
use Raylib::Raw::Structs;
use Raylib::Bindings;

my $lightsCount = 0;

class Raylib::Light {
  has Light $!light handles(*);

  has $!shader;

  submethod BUILD (
    :$light,
    :$type,
    :$position,
    :$target,
    :$color,
    :$shader
  ) {
    return unless $light;

    $!light = $light;
    $!light.enabled  = True;
    $!light.type     = $type;
    $!light.position = $position;
    $!light.target   = $target;
    $!light.color    = $color;

    $!shader = $shader;

    $!light.enabledLoc = get-shader-location(
      $!shader,
      "lights[{ $lightsCount }].enabled"
    );

    $!light.typeLoc = get-shader-location(
      $!shader,
      "lights[{ $lightsCount }].type"
    );

    $!light.positionLoc = get-shader-location(
      $!shader,
      "lights[{ $lightsCount }].position"
    );
    $!light.targetLoc = get-shader-location(
      $!shader,
      "lights[{ $lightsCount }].target"
    );

    self.update-light-values($!shader, $!light);

    $!light.colorLoc = get-shader-location(
      $!shader,
      "lights[{ $lightsCount++ }].color"
    );
  }

  method Raylib::Raw::Structs::Light
  { $!light }

  method new (
    Int()     $type,
    Vector3() $position,
    Vector3() $target,
    Color()   $color,
    Shader()  $shader
  ) {
    my $light = Light.new;

    return unless $light;

    self.bless(
      :$light,
      :$type,
      :$position,
      :$target,
      :$color,
      :$shader
    );
  }

  method update-light-values {
    $_ = $!shader;

    .set-value(self.enabledLoc,  self.enabled,  :i);
    .set-value(self.typeLoc,     self.type,     :i);
    .set-value(self.positionLoc, self.position, :v3);
    .set-value(self.targetLoc,   self.target,   :v3);
    .set-value(self.colorLoc,    self.color,    :v4);
  }

}
