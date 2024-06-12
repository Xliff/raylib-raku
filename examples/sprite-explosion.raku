use v6;

use Raylib::Binding;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Sound;

constant Screen              = (800, 450);
constant NUM_FRAMES_PER_LINE = 5;
constant NUM_LINES           = 5;

sub MAIN {
  init-window(
    |Screen,
    'raku raylib [textures] example - sprite explosion'
  );

  init-audio-device;

  my $fx   = Raylib::Sound.new( R<sounds/boom.wav> );
  my $boom = Raylib::Texture.load( R<explosion.png> );

  my $frameSize = $boom.size »/« (NUM_FRAMES_PER_LINE, NUM_LINES);

  my ($frame, $line) = 0 xx 2;

  my $frameRect = Raylib::Rectangle.new(
    width  => $frameSize.head,
    height => $frameSize.tail
  );
  my $position;

  my ($active, $count) = (False, 0);

  set-target-fps(120) {
  while window-should-close.not {
    if is-mouse-button-pressed(MOUSE_BUTTON_LEFT) && $active.not {
      ($position, $active) = (Raylib::Vector2D.get-mouse-position, True);

      $position.sub( $frameRect.size »/» 2);
      $fx.play;
    }

    if $active {
      if $count++ > 2 {
        if $frame++ >= NUM_FRAMES_PER_LINE {
          $frame = 0
          if $line++ >= NUM_LINES {
            $line = 0;
            $active = False;
          }
        }
        $count = 0;
      }
    }

    $frameRect.set-xy( $frameRect.size »*« ($frame, $line) );

    begin-drawing;
      $boom.draw-rec($frameRec, $position, WHITE) if $active;
    end-drawing;
  }

  .unload for $fx, $boom;

  close-audio-device;
  close-window;
}
