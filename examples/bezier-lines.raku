use v6;

use Raylib::Bindings;
use Raylib::Circle;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Vector2;

constant Screen = (800, 450);

sub MAIN {
  set-config-flags(FLAG_MSAA_4X_HINT);
  init-window( |Screen, 'raku raylib [shapes] example - cubic-bezier lines');

  my $startPoint = Raylib::Vector2.new(30, 30);
  my $endPoint  = Raylib::Vector2.new( |Screen ) - $startPoint;
  my ($moveStartPoint, $moveEndPoint) = False xx 2;
  my ($collideStart, $collideEnd)     = False xx 2;

  set-target-fps(60);

  my $startCircle = Raylib::Circle.new($startPoint, 10);
  my $endCircle   = Raylib::Circle.new($endPoint,   10);

  while window-should-close.not {
    my $mouse = Raylib::Vector2.new( |get-mouse-position );

    if $startCircle.check-collision($mouse)    &&
       is-mouse-button-down(MOUSE_BUTTON_LEFT)
    {

      $moveStartPoint = True
    } elsif $endCircle.check-collision($mouse)  &&
            is-mouse-button-down(MOUSE_BUTTON_LEFT)
    {
      $moveEndPoint = True;
    }

    if $moveStartPoint {
      $startPoint = $mouse;
      $moveStartPoint = False if is-mouse-button-released(MOUSE_BUTTON_LEFT);
    }

    if $moveEndPoint {
      $endPoint = $mouse;
      $moveEndPoint = False if is-mouse-button-released(MOUSE_BUTTON_LEFT);
    }

    begin-drawing;

      RAYWHITE.is-background;

      D.text('MOVE START-END POINTS WITH MOUSE', 15, 20, 20, GRAY);

      D.line-bezier($startPoint, $endPoint, 4, BLUE);
      D.circle-v(
        $startPoint,
        $collideStart   ?? 14 !! 8,
        $moveStartPoint ?? RED !! BLUE
      );
      D.circle-v(
        $endPoint,
        $collideEnd   ?? 14 !! 8,
        $moveEndPoint ?? RED !! BLUE
      );
    end-drawing
  }

  close-window;
}
