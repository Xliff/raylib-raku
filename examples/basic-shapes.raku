use v6;

use Raylib::Bindings;
use Raylib::Circle;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Polygon;
use Raylib::Rectangle;
use Raylib::Triangle;

sub MAIN {
  constant Screen = (800, 450);

  init-window( |Screen, 'raku raylib [shapes] example - basic shapes drawing');

  set-target-fps(60);

  my $rotation = 0e0;
  my $c1 = Raylib::Circle.new(Screen.head / 5, 120, 35);
  my $c2 = Raylib::Circle.new(Screen.head / 5, 220, 60);
  my $c3 = Raylib::Circle.new(Screen.head / 5, 340, 80);

  my $r1 = Raylib::Rectangle.new(Screen.head / 4 * 2 - 60, 100, 120,  60);
  my $r2 = Raylib::Rectangle.new(Screen.head / 4 * 2 - 90, 170, 180, 130);
  my $r3 = Raylib::Rectangle.new(Screen.head / 4 * 2 - 40, 320, 80,   60);

  my $t1 = Raylib::Triangle.new(
    Screen.head / 4 * 3,       80,
    Screen.head / 4 * 3 - 60, 150,
    Screen.head / 4 * 3 + 60, 150
  );

  my $t2 = Raylib::Triangle.new(
    Screen.head / 4 * 3,      160,
    Screen.head / 4 * 3 - 20, 230,
    Screen.head / 4 * 3 + 20, 230
  );

  my $p1 = Raylib::Polygon.new( Screen.head / 4 * 3, 330, 6, 80 );
  my $p2 = Raylib::Polygon.new( Screen.head / 4 * 3, 330, 6, 90 );
  my $p3 = Raylib::Polygon.new( Screen.head / 4 * 3, 330, 6, 85 );

  while window-should-close.not {
    $rotation += 0.2;

    begin-drawing;
      RAYWHITE.is-background;

      D.text('some basic shapes available on raylib', 20, 20, 20, DARKGRAY);
      $c1.draw(DARKBLUE);
      $c2.draw-gradient(GREEN, SKYBLUE);
      $c3.draw(DARKBLUE);

      $r1.draw(RED);
      $r2.draw-gradient-h(MAROON, GOLD);
      $r3.draw-lines(ORANGE);

      $t1.draw(VIOLET);
      $t2.draw-lines(DARKBLUE);

      $p1.draw($rotation,             BROWN);
      $p2.draw-lines($rotation,       BROWN);
      $p3.draw-lines-ex($rotation, 6, BEIGE);

      D.line(18, 42, Screen.head - 18, 42, BLACK);
    end-drawing;
  }

  close-window;
}
