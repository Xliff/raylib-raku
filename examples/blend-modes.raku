use v6;

use Raylib::Bindings;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Image;
use Raylib::Texture2D;
use Raylib::Vector2;

constant Screen        = (800, 450);
constant blendCountMax = 4;


sub MAIN {
  init-window( |Screen, 'raku raylib [textures] example - blend modes');

  my $bgImage = Raylib::Image.load( R<images/cyberpunk_street_background.png> );
  my $fgImage = Raylib::Image.load( R<images/cyberpunk_street_foreground.png> );

  my $bgTexture = Raylib::Texture.load-from-image($bgImage);
  my $fgTexture = Raylib::Texture.load-from-image($fgImage);

  .unload for $bgImage, $fgImage;

  my $blendMode = 0;

  my $halfScreen = Raylib::Vector2.new( |Screen          ).scale(0.5);
  my $half-fg    = Raylib::Vector2.new( |$fgTexture.size ).scale(0.5);
  my $half-bg    = Raylib::Vector2.new( |$fgTexture.size ).scale(0.5);

  my $mode0-pos  = Raylib::Vector2.new( Screen.head / 2 - 60, 370);
  my $mode1-pos  = Raylib::Vector2.new( 310,                  350);

  my $fg-pos = $halfScreen - $half-fg;
  my $bg-pos = $halfScreen - $half-bg;


  while window-should-close.not {
    $blendMode = $blendMode.succ % blendCountMax if is-key-pressed(KEY_SPACE);

    begin-drawing;
      RAYWHITE.is-background;

      $bgTexture.draw-v($bg-pos, WHITE);

      begin-blend-mode($blendMode);
        $fgTexture.draw-v($fg-pos, WHITE);
      end-blend-mode;

      D.text("Current: { BlendMode($blendMode).Str }", $mode0-pos, GRAY);
      D.text('Press SPACE to change blend modes.',     $mode1-pos, GRAY);
      D.text(
        '(c) Cyberpunk Street Environment by Luis Zuno (@ansimuz)',
        Screen.head - 330,
        Screen.tail -  20,
        10,
        GRAY
      );
    end-drawing;
  }

  .unload for $fgTexture, $bgTexture;
  close-window;
}
