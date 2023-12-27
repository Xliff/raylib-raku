use v6;

use Raylib::Bindings;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Font;
use Raylib::Image;
use Raylib::Rectangle;
use Raylib::Texture2D;

constant Screen = (800, 450);

sub MAIN {
  init-window( |Screen, 'raku raylib [textures] example - image drawing');

  my $cats        = Raylib::Image.load( R<images/cat.png> );
  my $cat-crop    = Raylib::Rectangle.new(100, 10, 280, 380);
  my $parrots     = Raylib::Image.load( R<images/parrots.png> );
  my $font        = Raylib::Font.load( R<images/custom_jupiter_crash.png> );
  my $label-pos   = Raylib::Vector2.new(300, 230);
  my $parrot-crop = Raylib::Rectangle.new(
    0,
    50,
    |( $parrots.size »-« (0, 100) )
  );

  $cats.crop($cat-crop).flip-horizontal.resize(150, 200);

  $parrots
    .draw(
      $cats,
      $cats.sized-rect,
      $cats.sized-rect.scale(1.5).offset(30, 40),
      WHITE
    )
    .crop($parrot-crop)
    .draw-pixel(10, 10, RAYWHITE)
    .draw-circle-lines(10, 10, 5, RAYWHITE)
    .draw-rectangle(5, 20, 10, 10, RAYWHITE)
    .draw-text-ex($font, 'PARROTS & CAT', $label-pos, -2, WHITE);

  my $texture = Raylib::Texture2D.load-from-image($parrots);
  my $size    = $texture.size;
  my $coords  = ( Screen »/» 2 »-« $size »/» 2 »-« (0, 40) );

  .unload for $cats, $parrots;

  set-target-fps(60);
  while window-should-close.not {
    begin-drawing;
      RAYWHITE.is-background;
      $texture.draw( |$coords, WHITE );
      D.rectangle-lines( |$coords, |$texture.size, DARKGRAY);

      D.text(
        'We are drawing only one texture from various images composed!',
        240,
        350,
        10,
        DARKGRAY
      );
      D.text(
        "Source images have been cropped, scaled, flipped and copied one over {
         ''}the other.",
        190,
        370,
        10,
        DARKGRAY
      );
    end-drawing;
  }
  close-window;
}
