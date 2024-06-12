use v6;

use Raylib::Bindings;
use Raylib::Color;
use Raylib::Draw;
use Raylib::Rectangle;
use Raylib::RenderTexture2D;
use Raylib::Texture2D;

constant MAP_TILE_SIZE          = 32;
constant PLAYER_SIZE            = 16;
constant PLAYER_TILE_VISIBILITY =  2;

constant Screen = (800, 450);

class Map {
  has $.tiles;
  has $.tileIds = [];
  has $.tileFog = [];

  method ranges {
    state $r = [X]( |self.tiles.list.map({ Range.new(0, $_) }) ).cache;
    $r;
  }
}

sub MAIN {
  init-window( |Screen, 'raku raylib [textures] example - fog of war');

  my $map = Map.new( tiles => Raylib::Vector2.new(25, 15) );

  for $map.ranges[] -> ($x, $y) {
    $map.tileIds[$x][$y] = (^1).pick;
  }

  my $player-pos   = Raylib::Vector2.new(80, 130);
  my $player-tile  = Raylib::Vector2.new(0, 0);
  my $origin       = Raylib::Vector2.new(0, 0);
  my $fogOfWar     = Raylib::RenderTexture2D.new( |$map.tiles.list );
  my $map-square   = Raylib::Vector2.new( |(MAP_TILE_SIZE xx 2) ).scale(0.5);
  my $line-color   = DARKBLUE.fade(0.5);
  my $texture-rect = Raylib::Rectangle.new(
    width  => $fogOfWar.texture.width,
    height => $fogOfWar.texture.height
  );
  my $map-rect     = Raylib::Rectangle.new(
    width  => $map.tiles.x * MAP_TILE_SIZE,
    height => $map.tiles.y * MAP_TILE_SIZE
  );

  $fogOfWar.texture.set-filter(TEXTURE_FILTER_BILINEAR);

  set-target-fps(60);

  while window-should-close.not {
    if    is-key-down(KEY_RIGHT) { $player-pos.x += 5 }
    elsif is-key-down(KEY_LEFT)  { $player-pos.x -= 5 }
    elsif is-key-down(KEY_DOWN)  { $player-pos.y += 5 }
    elsif is-key-down(KEY_UP)    { $player-pos.y -= 5 }

    $player-pos.x = 0e0 if $player-pos.x < 0;
    $player-pos.x = $map.tiles.x * MAP_TILE_SIZE - PLAYER_SIZE
      if $player-pos.x + PLAYER_SIZE > $map.tiles.x * MAP_TILE_SIZE;

    $player-pos.y = 0e0 if $player-pos.y < 0;
    $player-pos.y = $map.tiles.y * MAP_TILE_SIZE - PLAYER_SIZE
      if $player-pos.y + PLAYER_SIZE > $map.tiles.y * MAP_TILE_SIZE;

    for $map.ranges[] -> ($x, $y) {
      $map.tileFog[$x][$y] = 2 if ($map.tileFog[$x][$y] // 0) == 1;
    }

    $player-tile.set(
      |( $player-pos.list »+« $map-square.list »/» MAP_TILE_SIZE )
    );

    # Check visibility and update fog
    for $player-tile.x - PLAYER_TILE_VISIBILITY ..
        $player-tile.x + PLAYER_TILE_VISIBILITY
    -> $xx {
      for $player-tile.y - PLAYER_TILE_VISIBILITY ..
          $player-tile.y + PLAYER_TILE_VISIBILITY
      -> $yy {
        $map.tileFog[$xx][$yy] = 1
          if $xx ~~ 0 .. $map.tiles.x &&
             $yy ~~ 0 .. $map.tiles.y;
      }
    }

    # $fogOfWar.begin;
      # BLANK.clear-background;
      # for $map.ranges[] -> ($x, $y) {
      #   if ($map.tileFog[$x][$y] // 0)== 0 {
      #     D.rectangle($x, $y, 1, 1, BLACK);
      #   } elsif ($map.tileFog[$x][$y] // 0) == 2 {
      #     D.rectangle($x, $y, 1, 1, BLACK.fade(0.8) );
      #   }
      # }
    # $fogOfWar.end;

    begin-drawing;
      RAYWHITE.is-background;
      for $map.ranges[] -> ($x, $y) {
        my $color = BLUE;
        $color .= fade(0.9) if $map.tileIds[$x][$y];

        D.rectangle(
          $x * MAP_TILE_SIZE, $y * MAP_TILE_SIZE,
          MAP_TILE_SIZE,      MAP_TILE_SIZE,
          $color
        );
        D.rectangle-lines(
          $x * MAP_TILE_SIZE, $y * MAP_TILE_SIZE,
          MAP_TILE_SIZE,      MAP_TILE_SIZE,
          $line-color
        );
      }

      D.rectangle( |$player-pos.list, MAP_TILE_SIZE, MAP_TILE_SIZE, RED );

      $fogOfWar.texture.draw-pro(
        $texture-rect,
        $map-rect,
        $origin,
        0,
        WHITE
      );

      D.text(
        "Current tile: [{ $player-tile.list.».Int.join(', ') }]",
        10,
        10,
        20,
        RAYWHITE
      );
      D.text(
        'ARROW KEYS to move',
        10,
        Screen.tail - 25,
        20,
        RAYWHITE
      );
    end-drawing;
  }

  $fogOfWar.unload;
  close-window;
}
