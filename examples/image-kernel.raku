use v6.c;

use Raylib::Bindings;
use Raylib::Color;
use Raylib::Image;
use Raylib::Rectangle;
use Raylib::Texture2D;

constant Screen = (800, 450);

sub MAIN {
  init-window(
    |Screen,
    'raku raylib [textures] example - image convolution'
  );

  my $image = Raylib::Image.load( R<images/cat.png> );

  my @gaussian = (
    1, 2, 1,
    2, 4, 2,
    1, 2, 1
  );

  my @sobel = (
    1, 0, -1,
    2, 0, -2,
    1, 0, -1
  );

  my @sharpen = (
     0, -1,  0,
    -1,  5, -1,
     0, -1,  0
  );

  for @gaussian, @sobel, @sharpen {
    my $s = .sum;
    $_ »/=» $s if $s;
  }

  my $cat-sharpened = $image.copy.kernel-convolution(@sharpen);
  my $cat-sobel     = $image.copy.kernel-convolution(@sobel);

  my $cat-gaussian = $image.copy;
  $cat-gaussian.kernel-convolution(@gaussian) for ^6;

  my $crop-rect = Raylib::Rectangle.new( width => 200, height => 450 );
  .crop($crop-rect) for $image, $cat-sharpened, $cat-sobel, $cat-gaussian;

  my @textures = ($image, $cat-sharpened, $cat-sobel, $cat-gaussian).map({
    my $t = Raylib::Texture2D.load-from-image($_);
    .unload;
    $t;
  });

  set-target-fps(60);

  while window-should-close.not {
    begin-drawing;
      RAYWHITE.is-background;

      for @textures Z (0, 200, 400, 600) -> ($t, $x) {
        $t.draw($x, 0, WHITE);
      }
    end-drawing;
  }
  .unload for @textures;
  close-window;
}
