use v6.c;

use Raylib::Raw::Definitions;
use Raylib::Raw::Structs;
use Raylib::Raw::Sphere;
use Raylib::Bindings;

use Raylib::Mesh;

class Raylib::Mesh::Generator {

  method cube (Num() $width, Num() $height, Num() $length, :$raw = False) {
    my num32 ($w, $h, $l) = ($width, $height, $length);

    my $m = gen-mesh-cube($w, $h, $l);
    return $m if $raw;
    Raylib::Mesh.new($m);
  }

  method sphere (Num() $radius, Int() $rings, Int() $slices, :$raw = False) {
    my int32 ($i, $s) = ($rings, $slices);
    my num32  $r      =  $radius;

    my $m = gen-mesh-sphere($r, $i, $s);
    return $m if $raw;
    Raylib::Mesh.new($m);
  }

  method torus (
    Num()  $radius,
    Num()  $size,
    Int()  $radSeg,
    Int()  $sides,
          :$raw     = False
  ) {
    my num32 ($r, $s) = ($radius, $size);
    my int32 ($g, $d) = ($radSeg, $sides);

    my $m = gen-mesh-torus($r, $s, $g, $d);
    return $m if $raw;
    Raylib::Mesh.new($m);
  }

}

constant G is export = Raylib::Mesh::Generator;
