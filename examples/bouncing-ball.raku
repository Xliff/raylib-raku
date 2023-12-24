use v6;

use Raylib::Bindings;
use Raylib::Circle;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Vector2;

constant Screen     = (800, 450);
constant ballRadius = 20;
constant xLimits    = Screen - ballRadius ..  ballRadius;

sub MAIN {
  set-config-flags(FLAG_MSAA_4X_HINT);
  init-window( |Screen );

  my $ballPosition = Raylib::Vector2.new( |(Screen »/» 2) );
  my $ballSpeed    = Raylib::Vector2.new(5, 4);

  my ($pause, $fc) = 0 xx 2;

  set-target-fps(60);

  while window-should-close.not {

    $pause .= not if is-key-pressed(KEY_SPACE);

    if $pause.not {
      $ballPosition = $ballPosition + $ballSpeed;

      $ballSpeed.x *= -1
        if $ballPosition.x <= ballRadius ||
           $ballPosition.x >= Screen.head - ballRadius ;
      $ballSpeed.y *= -1
        if $ballPosition.y <= ballRadius ||
           $ballPosition.y >= Screen.tail - ballRadius ;
    } else {
      $fc++;
    }

    begin-drawing;
      RAYWHITE.is-background;

      D.circle-v($ballPosition, ballRadius, MAROON);
      D.text('PAUSED', 350, 200, 30, GRAY) if $pause && ($fc / 30) %% 2;
      D.fps(10, 10);
    end-drawing;
  }

  close-window;
}
