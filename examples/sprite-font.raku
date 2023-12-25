use v6;

use Raylib::Bindings;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Font;
use Raylib::Vector2;

constant Screen = (800, 450);

sub MAIN {
  my ($msg1, $msg2, $msg3) = (
    'THIS IS A custom SPRITE FONT...',
    '...and this is ANOTHER CUSTOM font...',
    '...and a THIRD one! GREAT! :D'
  );

  init-window( |Screen, 'raku raylib [text] example - sprite font loading' );

  my $f1 = Raylib::Font.load( R<images/custom_mecha.png>         );
  my $f2 = Raylib::Font.load( R<images/custom_alagard.png>       );
  my $f3 = Raylib::Font.load( R<images/custom_jupiter_crash.png> );

  my $p1 = Raylib::Vector2.new(
    Screen.head / 2 - $f1.measure-ex($msg1, -3).x / 2,
    Screen.tail / 2 - $f1.baseSize / 2 - 80
  );
  my $p2 = Raylib::Vector2.new(
    Screen.head / 2 - $f2.measure-ex($msg2, -2).x / 2,
    Screen.tail / 2 - $f2.baseSize / 2 - 10
  );
  my $p3 = Raylib::Vector2.new(
    Screen.head / 2 - $f3.measure-ex($msg3, 2).x / 2,
    Screen.tail / 2 - $f3.baseSize / 2 + 50
  );

  set-target-fps(60);

  while window-should-close.not {
    begin-drawing;
      BLACK.is-background;

      $f1.draw-ex($msg1, $p1, -3, WHITE);
      $f2.draw-ex($msg2, $p2, -2, WHITE);
      $f3.draw-ex($msg3, $p3,  2, WHITE);
    end-drawing;
  }
  close-window;
}
