use v6;

use Raylib::Bindings;
use Raylib::Camera;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Material;
use Raylib::Model;
use Raylib::ModelAnimation;
use Raylib::Texture;
use Raylib::Vector3;

use Raylib::Draw;

constant MATERIAL_MAP_DIFFUSE = 0;

constant screenSize = (800, 450);

sub MAIN {
  init-window( |screenSize );

  my $camera = Raylib::Camera.new(
    position   => Raylib::Vector3.new( x => 10, y => 10, z => 10 ),
    target     => Raylib::Vector3.new,
    up         => Raylib::Vector3.new( y => 1 ),
    fovy       => 45,
    projection => CAMERA_PERSPECTIVE
  );

  my $model;

  $model = Raylib::Model.load( R<models/guy.iqm> );
  my $texture = Raylib::Texture.load( R<models/guytex.png> );

  Raylib::Material.new(
    $model.materials.head
  ).set-texture( MATERIAL_MAP_DIFFUSE, $texture );

  my ($animsCount, $animFrameCount) = 0 xx 2;

  my $position = Raylib::Vector3.new;
  my $anims = Raylib::ModelAnimations.load( R<models/guyanim.iqm> );

  disable-cursor;
  set-target-fps(60);

  my \axis  = Raylib::Vector3.new(1, 0, 0);
  my \scale = Raylib::Vector3.new(1, 1, 1);
  while window-should-close.not {
    $camera.update(CAMERA_FIRST_PERSON);

    if is-key-down(KEY_SPACE) {
      $animFrameCount++;
      $model.update-animation($anims.head, $animFrameCount);
      $animFrameCount = 0 if $animFrameCount > $anims.head.frameCount;
    }

    D.begin;
      RAYWHITE.is-background;

      $camera.begin;

        $model.draw-ex(
          $position,
          axis,
          -90,
          scale,
          WHITE
        );

        $model.draw-wires-ex(
          $position,
          axis,
          -90,
          scale,
          DARKGRAY
        );

        # my $c = $anims.head.framePoses[$animFrameCount];
        #
        # D.cube(
        #   $c[0].translation,
        #   0.2,
        #   0.2,
        #   0.2,
        #   RED
        # ) for ^$model.boneCount;

        D.grid(10, 1);

      $camera.end;

      D.text("PRESS SPACE to PLAY MODEL ANIMATION", 10, 10, 20, MAROON);
      D.text(
        "(c) Guy IQM 3D model by \@culacant",
        screenSize.head - 200,
        screenSize.tail - 20,
        10,
        GRAY
      );

    D.end;
  }

  .unload for $texture, $anims, $model;

  close-window;
}
