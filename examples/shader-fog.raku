use v6.c;

use NativeCall;

use Raylib::Raw::Definitions;
use Raylib::Raw::Enums;
use Raylib::Raw::Subs;
use Raylib::Bindings;

use Raylib::Camera;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Light;
use Raylib::Matrix;
use Raylib::Mesh::Generator;
use Raylib::Model;
use Raylib::Shader;
use Raylib::Texture;

constant Screen       = (800, 450);
constant GLSL_VERSION = 330;

sub MAIN {
  set-config-flags(FLAG_MSAA_4X_HINT);
  init-window(
    |Screen,
    'raylib [shaders] example - fog'
  );

  my $camera = Raylib::Camera.new(
    position   => Raylib::Vector3.new(2, 2  , 6),
    target     => Raylib::Vector3.new(0, 0.5, 0),
    up         => Raylib::Vector3.new(0, 1  , 0),
    fovy       => 45,
    projection => CAMERA_PERSPECTIVE
  );

  my $model-a = Raylib::Model.load-from-mesh( G.torus(0.4, 1, 16, 32) );
  my $model-b = Raylib::Model.load-from-mesh( G.cube(1, 1, 1) );
  my $model-c = Raylib::Model.load-from-mesh( G.sphere(0.4, 32, 32) );

  my $texture = Raylib::Texture.load( R<texel_checker.png> );
  for $model-a, $model-b, $model-c {
    .materials.head.maps[MATERIAL_MAP_DIFFUSE].texture = $texture
  }

  say 'Shader';
  my $shader = Raylib::Shader.load(
    R{"resources/shaders/glsl{ GLSL_VERSION }/lighting.vs"},
    R{"resources/shaders/glsl{ GLSL_VERSION }/fog.fs"}
  );

  say 'Shader model';
  $shader.model = $shader.get-location('matModel');
  say 'Shader view';
  $shader.view  = $shader.get-location('viewPos');

  say 'Shader ambient';
  my $ambient-loc = $shader.get-location('ambient');
  $shader.set-value($ambient-loc, [0.2, 0.2, 0.2, 1], SHADER_UNIFORM_VEC4);

  my $fog-density = 0.14;
  my $fog-density-loc = $shader.get-location('fogDensity');
  $shader.set-value($fog-density-loc, $fog-density, :f);

  say 'Materials shader';
  .materials.head.shader = $shader for $model-a, $model-b, $model-c;

  say 'Light';
  my $light = Raylib::Light.new(
    LIGHT_POINT,
    Raylib::Vector3.new(0, 2, 6),
    Raylib::Vector3.new,
    WHITE,
    $shader
  );

  say 'Events';
  Raylib::Events.add-events(
    key-down => {
      KEY_UP   => SUB {
        $fog-density += 0.001;
        $fog-density = 1 if $fog-density > 1;
      },

      KEY_DOWN => SUB {
        $fog-density -= 0.001;
        $fog-density = 0 if $fog-density < 0;
      }
    }
  );

  set-target-fps(60);

  my @models = ($model-a, $model-b, $model-c);

  my @vectors = (
    Raylib::Vector3.new,
    Raylib::Vector3.new(-2.6, 0, 0),
    Raylib::Vector3.new( 2.6, 0, 0)
  );

  say 'Drawing!';
  while window-should-close.not {
    $camera.update(CAMERA_ORBITAL);

    Raylib::Events.check-events;

    $shader.set-value($fog-density-loc, $fog-density, SHADER_UNIFORM_FLOAT);

    $model-a.transform = $model-a.transform.multiply( M.rotate-x(-0.025) );
    $model-a.transform = $model-a.transform.multiply( M.rotate-z(0.012)  );

    begin-drawing;
      GRAY.is-background;

      $camera.begin;
        for @models Z @vectors -> $m, $v {
          $m.draw($v, 1, WHITE);
        }

        @models.head.draw( Raylib::Vector3.new($_, 0, 2), 1, WHITE )
          for -20, -18 .. 20;
      $camera.end;

      D.text(
        "Use KEY_UP/KEY_DOWN to change fog density [{
         $fog-density.fmt('%.2f') }]",
        10, 10,
        20,
        RAYWHITE
      );
    end-drawing;
  }

  .unload for $model-a, $model-b, $model-c, $texture, $shader;

  close-window
}
