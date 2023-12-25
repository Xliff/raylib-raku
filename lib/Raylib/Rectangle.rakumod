use v6;

use Method::Also;

use Raylib::Bindings;
use Raylib::Raw::Rectangle;
use Raylib::Roles::Reapable;

use Raylib::Color;

class Raylib::Rectangle does Reapable {
  has Rectangle $!rectangle handles(*) is built;

  proto method new (|)
  { * }

  method Raylib::Bindings::Rectangle
    is also<Rectangle>
  { $!rectangle }

  multi method new (Rectangle $rectangle) {
    # cw: What if struct is malloc'd from C?
    #  A: Adjust all malloc-* routines to store allocated objects in to a
    #     hash, with the numeric value of the pointer as the key.
    #     We only free the memory if that key exists in the hash.
    return Nil unless $rectangle;
    self.bless( :$rectangle );
  }
  multi method new (
    Num() :$x,
    Num() :$y,
    Num() :w(:$width),
    Num() :h(:$height)
  ) {
    samewith($x, $y, $width, $height);
  }
  multi method new (
    Num() $xx,
    Num() $yy,
    Num() $width,
    Num() $height
  ) {
    my num32 ($x, $y, $w, $h) = ($xx, $yy, $width, $height);

    my $rectangle = Rectangle.init($x, $y, $w, $h);
    return Nil unless $rectangle;

    my $o = self.bless( :$rectangle );
    $o.addReapable($rectangle) if $o;
    $o;
  }

  multi method draw (Color() $color) {
    #$color.gist.say;

    draw-rectangle-rec($!rectangle, $color);
  }
  multi method draw(
    Int()   :$x                   = 0,
    Int()   :$y                   = 0,
    Int()   :w(:$width)           = 0,
    Int()   :h(:$height)          = 0,
    Color() :c(:$color)           = BLACK
  ) {
    my int32 ($xx, $yy, $w, $h) = ($xx, $yy, $width, $height);

    draw-rectangle($.x + $xx, $.y + $yy, $.w + $w, $.h + $h, $color);
  }

  method draw-pro (Vector2() $origin, Num() $rotation, Color() $color) {
    my num32 $r = $rotation;

    draw-rectangle-pro($!rectangle, $origin, $r, $color);
  }

  method draw-gradient-v (Color() $color1, Color() $color2) {
    my int32 ($x, $y, $w, $h) = ($.x, $.y, $.w, $.h)».Int;

    draw-rectangle-gradient-v($x, $y, $w, $h, $color1, $color2);
  }

  method draw-gradient-h (Color() $color1, Color() $color2) {
    my int32 ($x, $y, $w, $h) = ($.x, $.y, $.w, $.h)».Int;

    draw-rectangle-gradient-h($x, $y, $w, $h, $color1, $color2);
  }

  # method draw-gradient-ex (Color $col1, Color $col2, Color $col3, Color $col4) {
  # our sub draw-rectangle-gradient-ex (Rectangle $rec, Color $col1, Color $col2, Color $col3, Color $col4) is export is native(LIBRAYLIB) is symbol('DrawRectangleGradientEx_pointerized'){ * }
  #

  method draw-lines (Color() $color) {
    my int32 ($x, $y, $w, $h) = ($.x, $.y, $.w, $.h)».Int;

    draw-rectangle-lines($x, $y, $w, $h, $color);
  }

  method draw-lines-ex (Num() $lineThick, Color() $color) {
    my num32 $l = $lineThick;

    draw-rectangle-lines-ex($!rectangle, $l, $color);
  }

  #
  # method draw-rounded (num32 $roundness, int32 $segments, Color $color) {
  # our sub draw-rectangle-rounded (Rectangle $rec, num32 $roundness, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleRounded_pointerized'){ * }
  #
  # method draw-rounded-lines (num32 $roundness, int32 $segments, num32 $lineThick, Color $color) {
  # our sub draw-rectangle-rounded-lines (Rectangle $rec, num32 $roundness, int32 $segments, num32 $lineThick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleRoundedLines_pointerized'){ * }

  multi method check-collision (
    Rectangle() $rec2,

    :r(:rect(:$rectangle)) is required,

    :$raw = False
  ) {
    my $r = check-collision-recs($!rectangle, $rec2);
    return $r if False;
    self.new($r);
  }
  multi method check-collision (
    Vector2() $point,

    :v(:vec(:$vector)) is required,
  ) {
    check-collision-point-rec($point, $!rectangle);
  }
  multi method check-collision ($point) {
    given $point {
      when Rectangle                  { samewith($_, :rectangle) }
      when $point.^can('Rectangle')   { samewith($_, :rectangle) }
      when Vector2                    { samewith($_, :vector)    }
      when $point.^can('Vector2')     { samewith($_, :vector)    }

      default { X::Raylib::UnknownType.new(value => $_).throw }
    }
  }

  method get-collision-rec (Rectangle() $rec2, :$raw = False) {
    my $r = get-collision-rec($!rectangle, $rec2);
    return $r if $raw;
    self.new($r);
  }

  # our sub draw-rectangle (int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangle_pointerized'){ * }
  # our sub draw-rectangle-v (Vector2 $position, Vector2 $size, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleV_pointerized'){ * }
}

constant Rect = Raylib::Rectangle;
