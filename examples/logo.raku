use v6;

use Raylib::Bindings;
use Raylib::Draw;
use Raylib::Color;
use Raylib::Rectangle;

constant Screen = (800, 450);
constant hs     = Screen »/» 2;

sub MAIN {
  init-window(
    |Screen,
    'raku raylib [shapes] example - raylib logo using shapes'
  );

  set-target-fps(60);

  my $r1 = Raylib::Rectangle.new( hs.head - 128, hs.tail - 128, 256, 256 );
  my $r2 = Raylib::Rectangle.new( hs.head - 112, hs.tail - 112, 224, 224 );

  while window-should-close.not {
    begin-drawing;
      RAYWHITE.is-background;

      $r1.draw(BLACK);
      $r2.draw(RAYWHITE);
      D.text('raylib', hs.head - 44, hs.tail + 48, 50, BLACK);
      D.text('this is NOT a texture!', 350, 370, 10, GRAY);
    end-drawing;
  }
}
