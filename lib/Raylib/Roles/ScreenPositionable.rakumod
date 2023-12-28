use v6.c;

use Raylib::Bindings;

role Raylib::Roles::ScreenPositionable {

  method get-midscreen-position {
    (
      (get-screen-width, get-screen-height)
      »-«
      (self.width, self.height)
    )
    »/»
    2
  }

}
