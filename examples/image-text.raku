use v6.c;

use Raylib::Bindings;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Font;
use Raylib::Image;
use Raylib::Texture2D;
use Raylib::Vector2;

constant Screen = (800, 450);

sub MAIN {
  init-window(
    |Screen,
    'raku raylib [texture] example - image text draw'
  );

  my $parrots    = Raylib::Image.load( R<images/parrots.png> );
  my $font       = Raylib::Font.load-ex( R<fonts/KAISG.ttf>, 64 );
  my $image-pos  = Raylib::Vector2.new(20, 20);

  $parrots.draw-text-ex($font, '[Parrots font drawing]', $image-pos, RED);

  my $texture    = Raylib::Texture2D.load-from-image($parrots);
  my $screen-pos = Raylib::Vector2.new( |(Screen »-« $texture.size) »/» 2 );
  my $other-pos  = $screen-pos + (20, 300);
  my $show-font;

  $parrots.unload;

  set-target-fps(60);

  while window-should-close.not {
    $show-font = is-key-down(KEY_SPACE) ?? True !! False;

    begin-drawing;
      RAYWHITE.is-background;

      if $show-font.not {
        $texture.draw-v($screen-pos, WHITE);
        $font.draw-ex('[Parrots font drawing]', $other-pos, WHITE);
      } else {
        $font.texture.draw-centered(50, BLACK);
      }

      D.text(
        'PRESS SPACE to SHOW FONT ATLAS USED',
        290,
        420,
        DARKGRAY
      );
    end-drawing;
  }
  .unload for $texture, $font;

  close-window;
}
