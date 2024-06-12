use v6.c;

use Raylib::Bindings;
use Raylib::Draw;
use Raylib::Color;
use Raylib::RenderTexture2D;
use Raylib::Texture2D;
use Raylib::Shader;

constant GLSL_VERSION = 330;

sub MAIN {
  constant Screen = (800, 450);

  init-window(
    |Screen,
    'raku raylib [shaders] example - Sieve of Eratosthenes'
  );

  my $target = Raylib::RenderTexture2D.load( |Screen );

  my $shader = Raylib::Shader.load-fragment(
    R{"shaders/glsl{ GLSL_VERSION }/eratosthenes.fs"}
  );

  set-target-fps(60);

  my $texture = $target.texture;

  my $s = Raylib::Rectangle.new(
    width  => Screen.head,
    height => Screen.tail
  ),

  my $z = Raylib::Vector2.new;

  while window-should-close.not {
    $target.begin;
      BLACK.is-background;

      D.rectangle(0, 0, |Screen, BLACK);
    $target.end;

    begin-drawing;
      RAYWHITE.is-background;

      $shader.begin;
        $texture.draw-rec($s, $z, BLACK);
      $shader.end;
    end-drawing;
  }

  .unload for $shader, $target;

  close-window;
}
