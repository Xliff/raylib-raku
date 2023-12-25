use v6;

use Raylib::Bindings;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Rectangle;
use Raylib::Vector2;

constant Screen = (800, 450);

constant SCALE_MARK_SIZE = 12;

sub MAIN {
  my $R = Raylib::Rectangle.new(100, 100, 200, 80);
  my $M = Raylib::Vector2.new(0, 0);

  my ($mouseScaleReady, $mouseScaleMode) = False xx 2;

  init-window(
    |Screen,
    'raku raylib [shapes] example - rectangle scaling mouse'
  );

  set-target-fps(60);

  while window-should-close.not {
    ($M.x, $M.y) = ( .x, .y ) given get-mouse-position;

    if $M.check-collision(
      $R.x + $R.w - SCALE_MARK_SIZE,
      $R.y + $R.h - SCALE_MARK_SIZE,
      SCALE_MARK_SIZE,
      SCALE_MARK_SIZE
    ) {
      $mouseScaleReady = True;
      $mouseScaleMode  = True if is-mouse-button-pressed(MOUSE_BUTTON_LEFT);
    } else {
      $mouseScaleReady = False;
    }

    if $mouseScaleMode {
      $mouseScaleReady = True;
      ($R.w, $R.h)     = ($M.x - $R.x, $M.y - $R.y);

      my ($maxW, $maxH) = (Screen.head - $R.x, Screen.tail - $R.y);

      $R.w = $maxW if $R.w > $maxW;
      $R.h = $maxH if $R.h > $maxH;

      $mouseScaleMode = False if is-mouse-button-released(MOUSE_BUTTON_LEFT);
    }

    begin-drawing;
      RAYWHITE.is-background;
      D.text(
        'Scale rectangle dragging from bottom-right corner!',
        10,
        10,
        20,
        GRAY
      );

      $R.draw( GREEN.fade(0.5) );
      if $mouseScaleReady {
        $R.draw-lines-ex(1, RED);
        D.triangle(
          $R.x + $R.w - SCALE_MARK_SIZE, $R.y + $R.h,
          $R.x + $R.w,                   $R.y + $R.h,
          $R.x + $R.w,                   $R.y + $R.h - SCALE_MARK_SIZE,
          RED
        )
      }
    end-drawing;
  }

  close-window;
}
