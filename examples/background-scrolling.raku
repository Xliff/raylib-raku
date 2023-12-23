use v6;

use Raylib::Bindings;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Texture2D;

sub MAIN {
  constant Screen = (800, 450);

  init-window(
    |Screen,
    "raku raylib [textures] example - background scrolling"
  );

  my ($back, $mid, $fore);
  $back = Raylib::Texture.load( R<images/cyberpunk_street_background.png> );
  $mid  = Raylib::Texture.load( R<images/cyberpunk_street_midground.png>  );
  $fore = Raylib::Texture.load( R<images/cyberpunk_street_foreground.png> );

  my ($scrollBack, $scrollMid, $scrollFore) = 0e0 xx 3;

  set-target-fps(60);

  my $hue = Raylib::Color.new(5, 0x2c, 0x46);

  while window-should-close.not {
    ($scrollBack, $scrollMid, $scrollFore) »-=» (0.1, 0.5, 1.0);

    $scrollBack = 0e0 if $scrollBack <= -$back.width * 2;
    $scrollMid  = 0e0 if $scrollMid  <=  -$mid.width * 2;
    $scrollFore = 0e0 if $scrollFore <= -$fore.width * 2;

    begin-drawing;

      $hue.is-background;

      $back.draw-ex($scrollBack,                   20,  0,  2, WHITE);
      $back.draw-ex($back.width * 2 + $scrollBack, 20,  0,  2, WHITE);

       $mid.draw-ex($scrollMid,                    20,  0,  2, WHITE);
       $mid.draw-ex($mid.width * 2 + $scrollMid,   20,  0,  2, WHITE);

      $fore.draw-ex($scrollFore,                   20,  0,  2, WHITE);
      $fore.draw-ex($fore.width * 2 + $scrollFore, 20,  0,  2, WHITE);

      D.text("BACKGROUND SCROLLING & PARALLAX", 10, 10, 20, RED);

      D.text(
        "(c) Cyberpunk Street Environment by Luis Zuno (\@ansimuz)",
        Screen.head  - 330,
        Screen.tail  -  20,
        10,
        RAYWHITE
      );
    end-drawing;
  }

  .unload for $back, $mid, $fore;
}
