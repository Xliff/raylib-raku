use v6;

use Raylib::Bindings;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Vector2;
use Raylib::Texture2D;

constant MAX_BUNNIES        = 500;  # cw: Any higher and it lags...
constant MAX_BATCH_ELEMENTS = 8192;
constant Screen             = (800, 450);
constant SpeedRange         = ((-250...250) »/» 60).cache;
constant ColorRange         = %(
  r => ( 50...240).cache,
  g => ( 80...240).cache,
  b => (100...240).cache
);

my @bunnies;

sub MAIN {
  init-window( |Screen, 'raku raylib [textures] example - bunnymark' );

  my $texBunny = Raylib::Texture2D.load( R<images/wabbit_alpha.png> );
  my $halfTex  = Raylib::Vector2.new( |$texBunny.size ).scale(0.5);

  class Bunny {
    has $.position;
    has $.speed;
    has $.color;

    submethod BUILD {
      $!position = Raylib::Vector2.new( |get-mouse-position );
      $!speed    = Raylib::Vector2.new( |(SpeedRange.pick xx 2) );
      $!color    = Raylib::Color.new(
        ColorRange<r>.pick,
        ColorRange<g>.pick,
        ColorRange<b>.pick
      );
      @bunnies.push: self;
    }

    method draw {
      $texBunny.draw( $.position, $.color );
    }

  }

  set-target-fps(60);

  my $check = Raylib::Vector2.new;
  while window-should-close.not {
    my $bunnies = @bunnies.elems;

    if is-mouse-button-down(MOUSE_BUTTON_LEFT) {
      Bunny.new if $bunnies < MAX_BUNNIES for ^10;
    }

    for @bunnies {
      # cw: Method result goes to invocant
      .position.add( .speed );

      # cw: Infix result creates new object!
      #     --- THIS CAUSES SLOWDOWN! ---
      $check.add( .position ).add( $halfTex );

      .speed.x *= -1 unless $check.x ~~ 0 .. Screen.head;
      .speed.y *= -1 unless $check.y ~~ 0 .. Screen.tail;
      $check.zero;
    }

    begin-drawing;
      RAYWHITE.is-background;
      .draw for @bunnies;

      D.rectangle(0, 0, Screen.head, 40, BLACK);
      D.text("bunnies: { $bunnies }", 120, 10, 20, GREEN);
      D.text(
        "batched draw calls: { 1 + $bunnies / MAX_BATCH_ELEMENTS }",
        310,
        10,
        20,
        MAROON
      );

      D.fps(10, 10);
    end-drawing;
  }

  $texBunny.unload;
  close-window;
}
