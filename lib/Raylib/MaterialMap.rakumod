use v6;

use Raylib::Bindings;

class Raylib::MaterialMap {
  has MaterialMap $!mm handles(*) is build;

  method Raylib::Bindings::MaterialMap { $!mm }

  multi method new (MaterialMap $mm) {
    return Nil unless $mm;
    self.bless( :$mm );
  }
  multi method new(
    :$texture,
    :$color,
    :$value    = 0
  ) {
    samewith($texture, $color, $value);
  }
  multi method new(
    Texture2D() $texture,
    Color()     $color,
    Num()       $value
  ) {
    my num32 $v = $value;

    self.bless(
      mm => MaterialMap.init($texture, $color, $v)
    );
  }

}
