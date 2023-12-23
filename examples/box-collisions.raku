use v6;

use Raylib::Bindings;
use Raylib::BoundingBox;
use Raylib::Camera;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Sphere;
use Raylib::Vector3;

constant ScreenSize = (800, 450);

sub MAIN {
  init-window( |ScreenSize, 'raylib [models] example - box collisions' );

  # cw: Now returning Nil!
  my $camera = Raylib::Camera.new(
    position   => Raylib::Vector3.new(0, 10, 10),
    target     => Raylib::Vector3.new,
    up         => Raylib::Vector3.new(0, 1, 0),
    fovy       => 45,
    projection => 0
  );

  my $play-pos  = Raylib::Vector3.new(0, 1, 2);
  my $play-size = Raylib::Vector3.new(1, 2, 1);

  my $enemy-pos       = Raylib::Vector3.new(-4, 1, 0);
  my $enemy-size      = Raylib::Vector3.new( 2, 2, 2);
  my $enemy-sphere-p  = Raylib::Vector3.new( 4, 0, 0);
  my $enemy-sphere-s  = 1.5;

  my $collision = False;

  set-target-fps(60);
  while window-should-close.not {
    given $play-pos {
      if    is-key-down(KEY_RIGHT) { .x += 0.2 }
      elsif is-key-down(KEY_LEFT)  { .x -= 0.2 }
      elsif is-key-down(KEY_DOWN)  { .z += 0.2 }
      elsif is-key-down(KEY_UP)    { .z -= 0.2 }
    }

    my ($sps, $ebs) = ( $play-size.scale(0.5), $enemy-size.scale(0.5) );

    my ($mx, $mn) = ($play-pos + $sps, $play-pos - $sps);
    my $box1 = Raylib::BoundingBox.new($mn, $mx);
    my $box2 = Raylib::BoundingBox.new( $enemy-pos - $ebs, $enemy-pos + $ebs );
    my $sp   = Raylib::Sphere.new($enemy-sphere-p, $enemy-sphere-s);

    my $collision = $box1.check-collision($box2) ||
                    $sp.check-collision($box1);

    my $play-col = $collision ?? RED !! GREEN;

    begin-drawing;
      RAYWHITE.is-background;
      $camera.begin;
        D.cube-v( $enemy-pos, $enemy-size, GRAY );
        D.cube-wires-v( $enemy-pos, $enemy-size, DARKGRAY);

        $sp.draw(GRAY);
        $sp.draw( :wires, 16, 16, DARKGRAY );

        #say "PP: { $play-pos.gist }";

        D.cube-v( $play-pos, $play-size, $play-col );
        D.grid(10, 1);
      $camera.end;

      D.text('Move player with cursor to collide', 220, 40, 20, GRAY);
      D.fps(10, 1);
    end-drawing;
  }
  close-window;
}
