use v6;

use Raylib::Bindings;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Rectangle;
use Raylib::Texture2D;

constant Screen          = (800, 450);
constant MAX_FRAME_SPEED = 15;
constant MIN_FRAME_SPEED = 1;

sub MAIN {
  init-window(
    |Screen,
    'raku raylib [texture] example - sprite anim'
  );

  my $scarfy   = Raylib::Texture2D.load( R<images/scarfy.png> );
  my $position = Raylib::Vector2.new(350, 280);
  my $frame    = Raylib::Rectangle.new(
    width  => $scarfy.width / 6,
    height => $scarfy.height
  );

  my ($current-frame, $counter, $speed)  = (0, 0, 8);

  set-target-fps(60);
  while window-should-close.not {
    if $counter++ >= 60 / $speed {
      $counter = 0;
      $current-frame = $current-frame.succ % 5;
      $frame.set( x => $current-frame * $scarfy.width / 6 );
    }

    $speed++ if is-key-pressed(KEY_RIGHT);
    $speed-- if is-key-pressed(KEY_LEFT);

    $speed = MAX_FRAME_SPEED if $speed > MAX_FRAME_SPEED;
    $speed = 0               if $speed < 0;

    begin-drawing;
      RAYWHITE.is-background;

      $scarfy.draw(15, 40, WHITE);
      D.rectangle-lines(15, 40, |$scarfy.size, LIME);
      D.rectangle-lines(
        |$frame.offset-rect(15, 40),
        RED
      );

      D.text('FRAME SPEED: ', 165, 210, 10, DARKGRAY);
      D.text($speed, 575, 210, 10, DARKGRAY);
      D.text('PRESS RIGHT/LEFT KEYS to CHANGE SPEED!', 290, 240, 10, DARKGRAY);

      for ^MAX_FRAME_SPEED {
        my $rect = (250 + 21 * $_, 205, 20, 20);

        D.rectangle( |$rect, RED ) if $_ < $speed;
        D.rectangle-lines( |$rect, MAROON );
      }

      $scarfy.draw( $frame, $position, WHITE );
      D.text(
        '(c) Scarfy sprite by Eiden Marsal',
        |( Screen »-« (200, 20) ),
        GRAY
      );
    end-drawing;
  }

  $scarfy.unload;
  close-window;
}
