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
    'raku raylib [textures] example - svg loading'
  );

  my $image   = Raylib::Image.load-svg( R<images/test.svg>, 400, 350 );
  my $texture = Raylib::Texture.load-from-image($image);
  $image.unload;

  my $rectangle = Raylib::Rectangle.new(
    |( $texture.get-midscreen-position »-» 1 ),
    |( $texture.size »+» 2 )
  );

  set-target-fps(60);
  while window-should-close.not {
    begin-drawing;
      RAYWHITE.is-background;

      $texture.draw-midscreen(WHITE);
      $rectangle.draw(RED);

      D.text(
        'this IS a texture loaded from an SVG file!',
        300,
        410,
        10,
        GRAY
      );
    end-drawing;
  }
  $texture.unload;
  close-window;
}
