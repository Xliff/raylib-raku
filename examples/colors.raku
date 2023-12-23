

use Raylib::Bindings;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Rectangle;

constant ScreenSize = (800, 450);

my @COLORS = (
  'DARKGRAY'   => DARKGRAY,
  'MAROON'     => MAROON,
  'ORANGE'     => ORANGE,
  'DARKGREEN'  => DARKGREEN,
  'DARKBLUE'   => DARKBLUE,
  'DARKPURPLE' => DARKPURPLE,
  'DARKBROWN'  => DARKBROWN,
  'GRAY'       => GRAY,
  'RED'        => RED,
  'GOLD'       => GOLD,
  'LIME'       => LIME,
  'BLUE'       => BLUE,
  'VIOLET'     => VIOLET,
  'BROWN'      => BROWN,
  'LIGHTGRAY'  => LIGHTGRAY,
  'PINK'       => PINK,
  'YELLOW'     => YELLOW,
  'GREEN'      => GREEN,
  'SKYBLUE'    => SKYBLUE,
  'PURPLE'     => PURPLE,
  'BEIGE'      => BEIGE
);

my %colors;
for @COLORS.kv -> $k, $_ {
  my $r = Raylib::Rectangle.new(
    x => 20 + 100 * ($k  %  7) + 10 * ($k  %  7),
    y => 80 + 100 * ($k div 7) + 10 * ($k div 7),
    w => 100,
    h => 100
  );

  %colors{ .key } = %(
    color     => .value,
    state     => False,
    rectangle => $r
  );
}

init-window( |ScreenSize );
set-target-fps(60);
while window-should-close.not {
  my $r;
  for %colors.values {
    CATCH { default { .message.say; .backtrace.concise.say } }

    my $p = get-mouse-position;
    if .<rectangle>.check-collision($p) {
      .<state> = True;
      $r = $_;
    } else {
      .<state> = False;
    }
  }

  begin-drawing;

  RAYWHITE.clear-background;

  D.text(
    "raylib colors palette",
    28,
    42,
    20,
    BLACK
  );
  D.text(
    "press SPACE to see all colors",
    get-screen-width  - 180,
    get-screen-height  - 40,
    10,
    GRAY
  );

  for @COLORS {
    my $c = %colors{ .key };
    my $r = $c<rectangle>;

    $r.draw( $c<color>.fade( $c<state> ?? 0.6 !! 1.0 ) );

    if is-key-down(KEY_SPACE) || $c<state> {
      my $tw = measure-text( .key, 10 );

      Rect.draw(
        x => $r.x,
        y => $r.y + $r.h - 26,
        w => $r.w,
        h => 20
      );

      $r.draw-lines-ex( 6, BLACK.fade(0.3) );

      D.text(
        .key,
        $r.x  + $r.width  - $tw - 12,
        $r.y  + $r.height - 20,
        10,
        $c<color>
      );
    }
  }

  end-drawing;
  $r<state> = False;
}
close-window;
