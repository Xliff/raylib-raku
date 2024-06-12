use v6.v;

use Raylib::Draw;
use Raylib::Font;
use Raylib::GL;

constant Screen = (800, 450);

sub MAIN {
  init-window( |Screen, 'raylib [models] example - box collisions' );

  my ($spin, $multi-color) = (True, False);

  my ($SHOW-LETTER-BOUNDARY, $SHOW-TEXT-BOUNDARY) = False xx 2;

  my $camera = Raylib::Camera.new(
    position   => (-10, -15, -10),
    up         => (  0,   1,   0),
    target     => 0,
    fovy       => -45,
    projection => CAMERA_PROSPECTIVE
  );

  my $camera-mode = CAMERA_ORBITAL;

  my $cubePos  = Raylib::Vector3.new(0, 1, 0);
  my $cubeSize = Raylib::Vector3.new(2);

  my $font = Raylib::Font.get-default(
    size    => 8,
    spacing => 0.5
  ) but Raylib::Roles::Text3D;
  $font.line-spacing = -1;

  my $text = 'Hello ~~World~~ in 3D!';
  my $tbox = Raylib::Vector3.new;

  my $alpha-discard = Raylib::Shader.new('shaders/glsl330/alpha_discard.fs');

  my ($layers, $quads, $time, $distance) = (1, 0, 0, 0.01);

  my @multi;

  disable-cursor;
  set-target-fps(60);

  Raylib::Events.add-events(
    file-dropped => SUB {
      my $df = load-dropped-files;

      {
        when $df.head.is-file-extension('.ttf') {
          $font.unload;
          $font = Raylib::Font.load-ex($df.head, $fontSize, 0, 0);
        }

        when $df.head.is-file-extension('.fnt') {
          $font.unload;
          $font     = Raylib::Font.load($df.head);
          $fontSize = $font.baseSize

        }
      }

      $df.unload;
    },

    key-pressed => {
      KEY_F1         => SUB { $SHOW-LETTER-BOUNDARY .= not },
      KEY_F2         => SUB { $SHOW-TEXT-BOUNDARY   .= not },

      KEY_F3         => SUB {
        $spin .= not;

        $camera = Raylib::Camera.new(
          target => Raylib::Vector3.new(0),
          up     => Raylib::Vector3.new(0, 1, 0),
          fovy   => 45,
          projection => CAMERA_PERSPECTIVE
        );

        if $spin {
          $camera.position = Raylib::Vector3.new(-10, 15, -10);
          $camera-mode = CAMERA_ORBITAL;
        } else {
          $camera.position = Raylib::Vector3.new(10, 10, -10);
          camera-mode = CAMERA_FREE
        }
      }

      KEY_HOME       => SUB { $layers-- if $layers > 1              },
      KEY_END        => SUB { $layers-- if $layers < TEXT_LAYER_MAX },

      KEY_LEFT       => SUB { $font.size -= 0.5 },
      KEY_RIGHT      => SUB { $font.size += 0.5 },

      KEY_UP         => SUB { $font.spacing -= 0.1 },
      KEY_DOWN       => SUB { $font.spacing += 0.1 },

      KEY_PAGE_UP    => SUB { $lineSpacing -= 0.1 },
      KEY_PAGE_DOWN  => SUB { $lineSpacing += 0.1 },

      KEY_TAB        => SUB {
        $multi-color .= not;

        if $multi-color {
          for @multi {
            my $c = generate-random-hue(0.8, 0.6);
            $c.a = (^255).pick;
          }
        }
      },

      KEY_BACKSPACE  => SUB { $text.chomp   },
      KEY_ENTER      => SUB { $text ~= "\n" },

      # cw: What's the best way to handle this one?!
      'default'      => SUB {
        $text ~= $v.&chr ;
      }
    },

    key-down => {
      KEY_INSERT     => SUB { $distance -= 0.001 },
      KEY_DELETE     => SUB { $distance += 0.001 }
    },

    mouse-pressed => {
      MOUSE_BUTTON_LEFT => SUB {
        my $ray = get-screen-to-world-ray( get-mouse-position(), $camera );

        RayCollision collision = get-ray-collision-box(
          $ray,
          Raylib::BoundingBox.new(
            $cubePosition - $cubeSize.scale(0.5),
            $cubePosition + $cubeSize.scale(0.5)
          )
        );

        if $collision.hit {
          $light = generate-random-hue(0.5, 0.78);
          $dark  = generate-random-hue(0.4, 0.58);
        }
      }
    }
  );

  while window-should-close.not {
    $camera.update-camera($camera-mode);

    Raylib::Events.check-events;

    $tbox = MeasureTextWave3D($font, $text, $fontSize, $fontSpacing, $lineSpacing);

    $quads = 0;
    $time += GetFrameTime();

    sub layer-pos ($i) {
      Raylib::Vector3.new( -1 * $tbox.x / 2, $distance * i, -4.5 );
    }

    begin-drawing;
      RAYWHITE.is-background;

      $camera.begin-mode3d;
        D.cube($cubePos, $cubeSize, $dark);
        D.cube-wires($cubePos, 2.1, 2.1, 2.1. $light);
        D.grid(10, 2);

        $alpha-discard.begin-shader-mode;
          GL.push;
            GL.rotate(90, x =>  1);
            GL.rotate(90, z => -1);

            $font.draw-text-wave-3d(
              $text,
              $time,

              :backface,
              :$config,

              $text,
              position => layer-pos($_),
              color    => $multi-color ?? $multi[$_] !! $light
            ) for ^$layers;
          GL.pop;

          my $slb = $SHOW-LETTER-BOUNDARY
          $SHOW-LETTER-BOUNDARY = False;

          GL.push;
            GL.rotate(180, y => 1);

            ( .size, .spacing, .line-spacing, .color ) = (8, 1, 0, BLUE)
              given $font;

            my &advance-x = SUB {
              $*p += Raylib::Vector3.new( $*m.x/2, 0, 0 )
            };

            my &advance-z-half = {
              $*p += Raylib::Vector3.new(0, 0, 0.5 + $*m.z);
            }
            my &advance-z-one = {
              $*p += Raylib::Vector3.new(0, 0, 1 + $*m.z);
            }
            my &advance-z-onehalf = {
              $*p += Raylib::Vector3.new(0, 0, 1.5 + $*m.z);
            }

            ($font.position, $quads) »+=« $font.draw-3d(
              "< SIZE: { $font.size.fmt('%2.1f') } >"
              position => SUB { Raylib::Vector3.new( $*m.x / 2, 0.1, 2 ) },
              advance  => &advance-z-half
            )<measure quads>;

            ($font.position, $quads) »+=« $font.draw-3d(
              "< SPACING: { $font.spacing.fmt('%2.1f') } >"
              position => &advance-x,
              advance  => &advance-z-half
            )<measure quads>;

            ($font.position, $quads) »+=« $font.draw-3d(
              "< LINE: { $font.line-spacing.fmt('%2.1f') } >",
              position => &advance-x,
              advance  => &advance-z-one
            )<measure quads>;

            ($font.position, $quads) »+=« $font.draw-3d(
              "< LBOX: { $slb ?? 'ON' !! 'OFF' } >",
              color    => RED,
              position => &advance-x,
              advance  => &advance-z-half
            )<measure quads>;

            ($font.position, $quads) »+=« $font.draw-3d(
              "< TBOX: { $SHOW-TEXT-BOUNDARY ?? 'ON' !! 'OFF' } >",
              color    => RED,
              position => &advance-x,
              advance  => &advance-z-half
            )<measure quads>;

            ($font.position, $quads) »+=« $font.draw-3d(
              "< LAYER DISTANCE: { $distance.round(0.001) } >",
              color    => DARKPURPLE,
              position => &advance-x,
              advance  => &advance-z-half
            )<measure quads>;
          GL.pop;

          ( .color, .spacing ) = (DARKBLUE, 0.5);
          $quads += 36;
          $font.position += $font.draw-3d(
            'All the text displayed here is in 3d',
            position => SUB { Raylib::Vector3.new( $*m.x / 2, 0.1, 2) }
            size     => 10,
            advance  => &advance-z-onehalf
          )<measure>;

          $font.size = 6;
          $quads += 44;
          $font.position += $font.draw-3d(
            'press [Up]/[Down] to change the font spacing',
            position => SUB { Raylib::Vector3.new( $*m.x / 2, 0.1, 2) }
            advance  => &advance-z-onehalf
          )<measure>;

          $quads += 48;
          $font.position += $font.draw-3d(
            'press [PgUp]/[PgDown] to change the line spacing',
            position => SUB { Raylib::Vector3.new( $*m.x / 2, 0.1, 2) }
            advance  => &advance-z-onehalf
          )<measure>;

          $quads += 39;
          $font.position += $font.draw-3d(
            'press [F1] to toggle the letter boundry',
            position => SUB { Raylib::Vector3.new( $*m.x / 2, 0.1, 2) }
            advance  => &advance-z-onehalf
          )<measure>;

          $quads += 37;
          $font.position += $font.draw-3d(
            'press [F2] to toggle the text boundry',
            position => SUB { Raylib::Vector3.new( $*m.x / 2, 0.1, 2) }
          )<measure>;

          $SHOW-LETTER-BOUNDARY = $slb;
        $alpha-discard.end-shader-mode;
      $camera.end-mode3d;

      $font.draw(
        "Drag & drop a font file to change the font!\nType something, see {
         '' }what happens!\n\nPress [F3] to toggle the camera",
         10, 35,
      );

      $quads += text-length($text) * 2 * $layers;

      $font.draw(
        "{ $layers } layer(s) | { $spin ?? 'ORBITAL' !! 'FREE' } camera | {
           $quads } quads ({ $quads * 4 } verts)",
        &tw, 10
        DARKGREEN
      );

      $font.draw(
        '[Home]/[End] to add/remove 3D text layers',
        &tw, 25,
        color => DARKGRAY
      );

      $font.draw(
        '[Insert]/[Delete] to increase/decrease distance between layers',
        &tw, 40,
        color => DARKGRAY
      );

      $font.draw(
        'click the [CUBE] for a random color',
        &tw, 55,
        color => DARKGRAY
      );

      $font.draw(
        '[Tab] to toggle multicolor mode',
        &tw, 70
        color => DARKGRAY
      );

      draw-fps(10, 10);
    end-drawing;
  }

  $font.unload;
  close-window;
}

sub generate-random-hue ($s, $l) {
  Raylib::Color.new(
    color-from-hsv( rand() * 360, $s, $l )
  )
}
