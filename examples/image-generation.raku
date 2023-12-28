use v6;

use Raylib::Bindings;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Image;
use Raylib::Texture2D;

constant Screen = (800, 450);

sub MAIN {
  my (@images, @textures);

  init-window(
    |Screen,
    'raku raylib [textures] example - procedural images generation'
  );

  my $rectangle = Raylib::Rectangle.new(30, 400, 325, 30);

  @images.push: [
    Raylib::Image.gen-gradient-linear( |Screen,  0,   RED,  BLUE ),
    'VERTICAL GRADIENT'
  ];

  @images.push: [
    Raylib::Image.gen-gradient-linear( |Screen, 90,   RED,  BLUE ),
    'HORIZONTAL GRADIENT'
  ];

  @images.push: [
    Raylib::Image.gen-gradient-linear( |Screen, 45,   RED,  BLUE ),
    'DIAGONAL GRADIENT'
  ];

  @images.push: [
    Raylib::Image.gen-gradient-radial( |Screen,  0, WHITE, BLACK ),
    'RADIAL GRADIENT'
  ];

  @images.push: [
    Raylib::Image.gen-gradient-square( |Screen,  0, WHITE, BLACK ),
    'SQUARE GRADIENT'
  ];

  @images.push: [
    Raylib::Image.gen-checked( |Screen, 32, 32, RED, BLUE ),
    'CHECKED'
  ];

  @images.push: [
    Raylib::Image.gen-white-noise( |Screen, 0.5 ),
    'WHITE NOISE'
  ];

  @images.push: [
    Raylib::Image.gen-perlin-noise( |Screen, 50, 50, 4 ),
    'PERLIN NOISE'
  ];

  @images.push: [
    Raylib::Image.gen-cellular( |Screen, 32 ),
    'CELLULAR'
  ];

  @textures = @images.map({
    my $t = Raylib::Texture2D.load-from-image( .head );
    .head.unload;
    [ $t, .tail ];
  });

  set-target-fps(60);

  while window-should-close.not {
    @textures .= rotate(1)
      if is-mouse-button-pressed(MOUSE_BUTTON_LEFT) ||
         is-key-pressed(KEY_RIGHT);

    begin-drawing;
      RAYWHITE.is-background;

      @textures.head.head.draw(0, 0, WHITE);
      $rectangle.draw( SKYBLUE.fade(0.5) );
      $rectangle.draw-lines( WHITE.fade(0.5) );

      D.text(
        'MOUSE LEFT BUTTON to CYCLE PROCEDURAL TEXTURES',
        40,
        410,
        10,
        WHITE
      );

      D.text-centered( @textures.head.tail, 10, RAYWHITE, size => 20);
    end-drawing;
  }
  close-window;
}
