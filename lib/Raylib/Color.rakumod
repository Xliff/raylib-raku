use v6;

use Method::Also;
use Raylib::Bindings;

use Raylib::Roles::Reapable;

class Raylib::Color does Reapable {
  has Color $!color handles(*) is built;

  submethod BUILD ( :$!color ) { }

  method Raylib::Bindings::Color { $!color }

  proto method new (|c)
  { * }

  multi method new (Color $color) {
    return Nil unless $color;
    self.bless( :$color );
  }
  multi method new (Int() $r, Int() $g, Int() $b, Int() $a = 255) {
    my $color = Color.init($r, $g, $b, $a);
    return Nil unless $color;
    my $o  = self.bless( :$color );
    $o.addReapable($color);
    $o;
  }

  method alpha (Num() $alpha, :$raw = False) {
    my num32 $a = $alpha;

    my $c = color-alpha($!color, $a);
    return $c if $raw;
    ::?CLASS.new($c);
  }

  method alpha-blend (Color() $src, Color() $tint, :$raw = False) {
    my $c = color-alpha-blend($!color, $src, $tint);
    return $c if $raw;
    ::?CLASS.new($c);
  }

  method brightness (Num() $factor, :$raw = False) {
    my num32 $f = $factor;
    my $c = color-brightness($!color, $f);
    return $c if $raw;
    ::?CLASS.new($c);
  }

  method contrast (Num() $contrast, :$raw = False) {
    my num32 $ct = $contrast;
    my $c = color-contrast($!color, $ct);
    return $c if $raw;
    ::?CLASS.new($c);
  }

  method clear-background
    is also<
      background-clear
      is-background
    >
  {
    clear-background($!color);
  }

  method fade (Num() $alpha, :$raw = False) {
    my num32 $a = $alpha;

    my $c = fade($!color, $a);
    return $c if $raw;
    self.new($c);
  }

  method get (
    ::?CLASS:U:

    Int()  $hexValue,
          :$raw       = False
  ) {
    my uint32 $h = $hexValue;

    my $c = get-color($hexValue);
    return $c if $raw;
    self.new($c);
  }

  method to-int {
    color-to-int($!color);
  }

  method normalize ( :$raw = False ) {
    my $v = color-normalize($!color);
    return $v if $raw;
    #Raylib::Vector4.new($v);
    $v
  }

  method from-normalized (Vector4() $normalized, :$raw = False) {
    my $c = color-from-normalized($normalized);
    return $c if $raw;
    ::?CLASS.new($c);
  }

  method to-hsv ( :$raw = False ) {
    my $v = color-to-hsv($!color);
    return $v if $raw;
    #Raylib::Vector3.new($v);
    $v;
  }

  method from-hsv (Num() $hue, Num() $saturation, Num() $value, :$raw = False) {
    my num32 ($h, $s, $v) = ($hue, $saturation, $value);

    my $c = color-from-hsv($h, $s, $v);
    return $c if $raw;
    ::?CLASS.new($c);
  }

  method tint (Color() $tint, :$raw = False) {
    my $c = color-tint($!color, $tint);
    return $c if $raw;
    ::?CLASS.new($c);
  }

}

####### Predefined colors ########
sub term:<init-lightgray  > is export { Color.init(200,  200,  200,  255 );} # creating a new instance of Color
sub term:<init-gray       > is export { Color.init(130,  130,  130,  255 );} # creating a new instance of Color
sub term:<init-darkgray   > is export { Color.init(80,  80,  80,  255 );} # creating a new instance of Color
sub term:<init-yellow     > is export { Color.init(253,  249,  0,  255 );} # creating a new instance of Color
sub term:<init-gold       > is export { Color.init(255,  203,  0,  255 );} # creating a new instance of Color
sub term:<init-orange     > is export { Color.init(255,  161,  0,  255 );} # creating a new instance of Color
sub term:<init-pink       > is export { Color.init(255,  109,  194,  255 );} # creating a new instance of Color
sub term:<init-red        > is export { Color.init(230,  41,  55,  255 );} # creating a new instance of Color
sub term:<init-maroon     > is export { Color.init(190,  33,  55,  255 );} # creating a new instance of Color
sub term:<init-green      > is export { Color.init(0,  228,  48,  255 );} # creating a new instance of Color
sub term:<init-lime       > is export { Color.init(0,  158,  47,  255 );} # creating a new instance of Color
sub term:<init-darkgreen  > is export { Color.init(0,  117,  44,  255 );} # creating a new instance of Color
sub term:<init-skyblue    > is export { Color.init(102,  191,  255,  255 );} # creating a new instance of Color
sub term:<init-blue       > is export { Color.init(0,  121,  241,  255 );} # creating a new instance of Color
sub term:<init-darkblue   > is export { Color.init(0,  82,  172,  255 );} # creating a new instance of Color
sub term:<init-purple     > is export { Color.init(200,  122,  255,  255 );} # creating a new instance of Color
sub term:<init-violet     > is export { Color.init(135,  60,  190,  255 );} # creating a new instance of Color
sub term:<init-darkpurple > is export { Color.init(112,  31,  126,  255 );} # creating a new instance of Color
sub term:<init-beige      > is export { Color.init(211,  176,  131,  255 );} # creating a new instance of Color
sub term:<init-brown      > is export { Color.init(127,  106,  79,  255 );} # creating a new instance of Color
sub term:<init-darkbrown  > is export { Color.init(76,  63,  47,  255 );} # creating a new instance of Color
sub term:<init-white      > is export { Color.init(255,  255,  255,  255 );} # creating a new instance of Color
sub term:<init-black      > is export { Color.init(0,  0,  0,  255 );} # creating a new instance of Color
sub term:<init-blank      > is export { Color.init(0,  0,  0,  0 );} # creating a new instance of Color
sub term:<init-magenta    > is export { Color.init(255,  0,  255,  255 );} # creating a new instance of Color
sub term:<init-raywhite   > is export { Color.init(245,  245,  245,  255 );} # creating a new instance of Color

sub term:<LIGHTGRAY       > is export { Raylib::Color.new( term:<init-lightgray>  ) }
sub term:<GRAY            > is export { Raylib::Color.new( term:<init-gray>       ) }
sub term:<DARKGRAY        > is export { Raylib::Color.new( term:<init-darkgray>   ) }
sub term:<YELLOW          > is export { Raylib::Color.new( term:<init-yellow>     ) }
sub term:<GOLD            > is export { Raylib::Color.new( term:<init-gold>       ) }
sub term:<ORANGE          > is export { Raylib::Color.new( term:<init-orange>     ) }
sub term:<PINK            > is export { Raylib::Color.new( term:<init-pink>       ) }
sub term:<RED             > is export { Raylib::Color.new( term:<init-red>        ) }
sub term:<MAROON          > is export { Raylib::Color.new( term:<init-maroon>     ) }
sub term:<GREEN           > is export { Raylib::Color.new( term:<init-green>      ) }
sub term:<LIME            > is export { Raylib::Color.new( term:<init-lime>       ) }
sub term:<DARKGREEN       > is export { Raylib::Color.new( term:<init-darkgreen>  ) }
sub term:<SKYBLUE         > is export { Raylib::Color.new( term:<init-skyblue>    ) }
sub term:<BLUE            > is export { Raylib::Color.new( term:<init-blue>       ) }
sub term:<DARKBLUE        > is export { Raylib::Color.new( term:<init-darkblue>   ) }
sub term:<PURPLE          > is export { Raylib::Color.new( term:<init-purple>     ) }
sub term:<VIOLET          > is export { Raylib::Color.new( term:<init-violet>     ) }
sub term:<DARKPURPLE      > is export { Raylib::Color.new( term:<init-darkpurple> ) }
sub term:<BEIGE           > is export { Raylib::Color.new( term:<init-beige>      ) }
sub term:<BROWN           > is export { Raylib::Color.new( term:<init-brown>      ) }
sub term:<DARKBROWN       > is export { Raylib::Color.new( term:<init-darkbrown>  ) }
sub term:<WHITE           > is export { Raylib::Color.new( term:<init-white>      ) }
sub term:<BLACK           > is export { Raylib::Color.new( term:<init-black>      ) }
sub term:<BLANK           > is export { Raylib::Color.new( term:<init-blank>      ) }
sub term:<MAGENTA         > is export { Raylib::Color.new( term:<init-magenta>    ) }
sub term:<RAYWHITE        > is export { Raylib::Color.new( term:<init-raywhite>   ) }

our %RAYLIB-COLORS is export;

# INIT {
#   %RAYLIB-COLORS = (
#     'LIGHTGRAY'  => LIGHTGRAY,
#     'GRAY'       => GRAY,
#     'DARKGRAY'   => DARKGRAY,
#     'YELLOW'     => YELLOW,
#     'GOLD'       => GOLD,
#     'ORANGE'     => ORANGE,
#     'PINK'       => PINK,
#     'RED'        => RED,
#     'MAROON'     => MAROON,
#     'GREEN'      => GREEN,
#     'LIME'       => LIME,
#     'DARKGREEN'  => DARKGREEN,
#     'SKYBLUE'    => SKYBLUE,
#     'BLUE'       => BLUE,
#     'DARKBLUE'   => DARKBLUE,
#     'PURPLE'     => PURPLE,
#     'VIOLET'     => VIOLET,
#     'DARKPURPLE' => DARKPURPLE,
#     'BEIGE'      => BEIGE,
#     'BROWN'      => BROWN,
#     'DARKBROWN'  => DARKBROWN,
#     'WHITE'      => WHITE,
#     'BLACK'      => BLACK,
#     'BLANK'      => BLANK,
#     'MAGENTA'    => MAGENTA,
#     'RAYWHITE'   => RAYWHITE
#   );
# }
