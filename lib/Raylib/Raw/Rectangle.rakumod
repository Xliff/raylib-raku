use v6;

use NativeCall;

use Raylib::Bindings;

unit package Raylib::Raw::Rectangle;

our sub draw-rectangle-rec (Rectangle $rec, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleRec_pointerized'){ * }
our sub draw-rectangle-pro (Rectangle $rec, Vector2 $origin, num32 $rotation, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectanglePro_pointerized'){ * }
our sub draw-rectangle-gradient-v (int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color1, Color $color2) is export is native(LIBRAYLIB) is symbol('DrawRectangleGradientV_pointerized'){ * }
our sub draw-rectangle-gradient-h (int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color1, Color $color2) is export is native(LIBRAYLIB) is symbol('DrawRectangleGradientH_pointerized'){ * }
our sub draw-rectangle-gradient-ex (Rectangle $rec, Color $col1, Color $col2, Color $col3, Color $col4) is export is native(LIBRAYLIB) is symbol('DrawRectangleGradientEx_pointerized'){ * }
our sub draw-rectangle-lines (int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleLines_pointerized'){ * }
our sub draw-rectangle-lines-ex (Rectangle $rec, num32 $lineThick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleLinesEx_pointerized'){ * }
our sub draw-rectangle-rounded (Rectangle $rec, num32 $roundness, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleRounded_pointerized'){ * }
our sub draw-rectangle-rounded-lines (Rectangle $rec, num32 $roundness, int32 $segments, num32 $lineThick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleRoundedLines_pointerized'){ * }
our sub check-collision-recs (Rectangle $rec1, Rectangle $rec2) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionRecs_pointerized'){ * }
our sub get-collision-rec (Rectangle $rec1, Rectangle $rec2) returns Rectangle is export is native(LIBRAYLIB) is symbol('GetCollisionRec_pointerized'){ * }
our sub check-collision-point-rec (Vector2 $point, Rectangle $rec) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionPointRec_pointerized'){ * }
our sub draw-rectangle (int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangle_pointerized'){ * }
