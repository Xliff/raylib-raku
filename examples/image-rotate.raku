use v6;

use Raylib::Bindings;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Image;
use Raylib::Texture2D;

constant Screen = (800, 450);

sub MAIN {

  init-window(
    |Screen,
    'raku raylib [textures] example - texture rotation'
  );

  my @images = Raylib::Image.load( R<images/raylib_logo.png> ) xx 3;
  for @images Z (45, 90, -90) -> ($i, $r) {
    $i.rotate($r);
  }
  my @textures = @images.map({ Raylib::Texture2D.load-from-image( $_ ) });

  while window-should-close.not {
    @textures .= rotate(1)
      if is-mouse-button-pressed(MOUSE_BUTTON_LEFT) ||
         is-key-pressed(KEY_RIGHT);

    begin-drawing;
      RAYWHITE.is-background;

      @textures.head.draw-midscreen(WHITE);
      D.text(
        'Press LEFT MOUSE BUTTON to rotate the image clockwise',
        250,
        420,
        10,
        DARKGRAY
      );
    end-drawing;
  }

  .unload for @textures;
}
