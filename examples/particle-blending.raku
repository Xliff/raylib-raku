use v6;

use Raylib::Bindings;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Vector2;
use Raylib::Texture2D;

constant Screen        = (800, 450);
constant MAX_PARTICLES = 200;

sub MAIN {
  init-window(
    |Screen,
    'raku raylib [textures] example - particles blending'
  );

  my $gravity  = 3;
  my $smoke    = Raylib::Texture2D.load( R<images/spark_flame.png> );
  my @blending = (BLEND_ALPHA, BLEND_ADDITIVE);
  my $ct-pos   = Raylib::Vector2.new(290, Screen.tail - 40);

  class Particle {
    has $.position is rw = Raylib::Vector2.new;
    has $.color    is rw = Raylib::Color.new-random;
    has $.alpha    is rw = 1;
    has $.size     is rw = (1..30).pick;
    has $.rotation is rw = (0 ..^ 360).pick;
    has $.active   is rw = False;

    has $!dest = Raylib::Rectangle.new(0, 0, |( $smoke.size »*» $!size ) );

    method destination {
      $!dest.set-xy(
        0, 0
        #|self.position.list
      );
      $!dest;
    }

    has $.position-vec = Raylib::Vector2.new( |$smoke.size * ( $!size / 2) );
  }

  my @mouse-tail = (0 ... MAX_PARTICLES).map({ Particle.new });

  set-target-fps(60);
  while window-should-close.not {
    given @mouse-tail.first( *.active.not ) {
      ( .active, .alpha) = (True, 1);

      #.position.set( get-mouse-position );
    }

    for @mouse-tail {
      .position.gist.say;
      if .active {
        .position .= add(0, $gravity / 2);
        .alpha    -= 0.005;
        .active    = False if .alpha < 0;
        #.rotation += 2;
      }
    }

    @blending .= rotate(1) if is-key-pressed(KEY_SPACE);

    begin-drawing;
      DARKGRAY.is-background;

      begin-blend-mode(@blending.head);
        for @mouse-tail {
          # Position -> Destination issue?
          $smoke.draw-pro(
            .destination,
            .position-vec,
            .rotation,
            .color.fade( .alpha )
          ) if .active
        }
      end-blend-mode;

      D.text('PRESS SPACE to CHANGE BLENDING MODE', 180, 20, 20, BLACK);
      D.text(@blending.head.Str, |$ct-pos.list, 20, RAYWHITE);
    end-drawing;
  }

  $smoke.unload;
  close-window;
}
