use v6;

use NativeCall;

use Raylib::Bindings;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Rectangle;
use Raylib::Sound;
use Raylib::Texture2D;
use Raylib::Vector2;

constant Screen     = (800, 450);
constant NUM_FRAMES = 3;

sub MAIN {
  init-window(
    |Screen,
    'raku raylib [textures] example - sprite button'
  );

  init-audio-device;

  my $fx     = Raylib::Sound.load( R<sounds/buttonfx.wav> );
  my $button = Raylib::Texture2D.load( R<images/button.png> );
  my $height = $button.height / NUM_FRAMES;
  my $source = Raylib::Rectangle.new( width => $button.width, :$height );
  my $bounds = Raylib::Rectangle.new(
    x     => (Screen.head - $button.width)  / 2,
    y     => (Screen.tail - $button.height) / (NUM_FRAMES * 0.5),
    width => $button.width,

    :$height
  );

  my ($state, $action) = (0, False);

  my $point;

  set-target-fps(60);

  while window-should-close.not {
    $point  = Raylib::Vector2.get-mouse-position;
    $action = False;

    if $bounds.check-collision($point) {
      $state  = is-mouse-button-down(MOUSE_BUTTON_LEFT) ?? 2 !! 1;
      $action = True if is-mouse-button-released(MOUSE_BUTTON_LEFT);
    } else {
      $state = 0;
    }

    $fx.play if $action;
    $source.set( y => $state * $height );

    begin-drawing;
      RAYWHITE.is-background;
      $button.draw-rec($source, $bounds, WHITE);
    end-drawing;
  }

  .unload for $fx, $button;

  close-audio-device;
  close-window;
}
