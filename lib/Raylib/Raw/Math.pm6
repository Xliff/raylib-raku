use v6.c;

use Raylib::Raw::Definitions;
use Raylib::Raw::Structs;

unit package Raylib::Math;

class Matrix {

  method Multiply (Matrix() $l, Matrix() $r --> Matrix) {
    my $re = Matrix.new;

    $re.m0 =  $l.m0  * $r.m0 + $l.m1  * $r.m4 + $l.m2  * $r.m8  + $l.m3  * $r.m12;
    $re.m1 =  $l.m0  * $r.m1 + $l.m1  * $r.m5 + $l.m2  * $r.m9  + $l.m3  * $r.m13;
    $re.m2 =  $l.m0  * $r.m2 + $l.m1  * $r.m6 + $l.m2  * $r.m10 + $l.m3  * $r.m14;
    $re.m3 =  $l.m0  * $r.m3 + $l.m1  * $r.m7 + $l.m2  * $r.m11 + $l.m3  * $r.m15;
    $re.m4 =  $l.m4  * $r.m0 + $l.m5  * $r.m4 + $l.m6  * $r.m8  + $l.m7  * $r.m12;
    $re.m5 =  $l.m4  * $r.m1 + $l.m5  * $r.m5 + $l.m6  * $r.m9  + $l.m7  * $r.m13;
    $re.m6 =  $l.m4  * $r.m2 + $l.m5  * $r.m6 + $l.m6  * $r.m10 + $l.m7  * $r.m14;
    $re.m7 =  $l.m4  * $r.m3 + $l.m5  * $r.m7 + $l.m6  * $r.m11 + $l.m7  * $r.m15;
    $re.m8 =  $l.m8  * $r.m0 + $l.m9  * $r.m4 + $l.m10 * $r.m8  + $l.m11 * $r.m12;
    $re.m9 =  $l.m8  * $r.m1 + $l.m9  * $r.m5 + $l.m10 * $r.m9  + $l.m11 * $r.m13;
    $re.m10 = $l.m8  * $r.m2 + $l.m9  * $r.m6 + $l.m10 * $r.m10 + $l.m11 * $r.m14;
    $re.m11 = $l.m8  * $r.m3 + $l.m9  * $r.m7 + $l.m10 * $r.m11 + $l.m11 * $r.m15;
    $re.m12 = $l.m12 * $r.m0 + $l.m13 * $r.m4 + $l.m14 * $r.m8  + $l.m15 * $r.m12;
    $re.m13 = $l.m12 * $r.m1 + $l.m13 * $r.m5 + $l.m14 * $r.m9  + $l.m15 * $r.m13;
    $re.m14 = $l.m12 * $r.m2 + $l.m13 * $r.m6 + $l.m14 * $r.m10 + $l.m15 * $r.m14;
    $re.m15 = $l.m12 * $r.m3 + $l.m13 * $r.m7 + $l.m14 * $r.m11 + $l.m15 * $r.m15;

    $re;
  }

  method Rotate (Vector3() $axis, Num() $angle) {
    my num32 $a = $angle;

    my num32 ($x, $y, $z) = ( .x, .y, .z) given $axis;

    my $lengthSquared = $x² + $y² + $z²;

    if $lengthSquared != 1.0 && $lengthSquared != 0e0 {
      my num32 $ilength = 1.0 / $lengthSquared.sqrt;

      ($x, $y, $z) »*=» $ilength;
    }

    my num32 \sinres = $a.sin;
    my num32 \cosres = $a.cos;
    my num32 \t      = 1.0 - cosres;

    my $r = Matrix.new;

    $r.m0  = $x * $x * t + cosres;
    $r.m1  = $y * $x * t + $z * sinres;
    $r.m2  = $z * $x * t - $y * sinres;
    $r.m3  = 0.0;
    $r.m4  = $x * $y * t - $z * sinres;
    $r.m5  = $y * $y * t + cosres;
    $r.m6  = $z * $y * t + $x * sinres;
    $r.m7  = 0.0;
    $r.m8  = $x * $z * t + $y * sinres;
    $r.m9  = $y * $z * t - $x * sinres;
    $r.m10 = $z * $z * t + cosres;
    $r.m11 = 0.0;
    $r.m12 = 0.0;
    $r.m13 = 0.0;
    $r.m14 = 0.0;
    $r.m15 = 1.0;

    $r;
  }

  method InitIdentity {
    Matrix.init(
      1.0, 0.0, 0.0, 0.0,
      0.0, 1.0, 0.0, 0.0,
      0.0, 0.0, 1.0, 0.0,
      0.0, 0.0, 0.0, 1.0
    );
  }


  method RotateX (Num() $angle) {
    my num32 $a = $angle;

    my num32 (\cosres, \sinres) = ($a.cos, $a.sin);

    my $r = self.InitIdentity;

    $r.m5  =  cosres;
    $r.m6  =  sinres;
    $r.m9  = -sinres;
    $r.m10 =  cosres;

    $r;
  }

  method RotateY (Num() $angle) {
    my num32 $a = $angle;

    my num32 (\cosres, \sinres) = ($a.cos, $a.sin);

    my $r = self.InitIdentity;

    $r.m0  =  cosres;
    $r.m2  = -sinres;
    $r.m8  =  sinres;
    $r.m10 =  cosres;

    $r;
  }

  method RotateZ (Num() $angle) {
    my num32 $a = $angle;

    my num32 (\cosres, \sinres) = ($a.cos, $a.sin);

    my $r = self.InitIdentity;

    $r.m0 =  cosres;
    $r.m1 =  sinres;
    $r.m4 = -sinres;
    $r.m5 =  cosres;

    $r;
  }

  method RotateXYZ (Vector3() $a) {
    my $r = self.InitIdentity;

    my num32 \cosz = (-$a.z).cos;
    my num32 \sinz = (-$a.z).sin;
    my num32 \cosy = (-$a.y).cos;
    my num32 \siny = (-$a.y).sin;
    my num32 \cosx = (-$a.x).cos;
    my num32 \sinx = (-$a.x).sin;

    $r.m0  = cosz * cosy;
    $r.m1  = (cosz * siny * sinx) - (sinz * cosx);
    $r.m2  = (cosz * siny * cosx) + (sinz * sinx);
    $r.m4  = sinz * cosy;
    $r.m5  = (sinz * siny * sinx) + (cosz * cosx);
    $r.m6  = (sinz * siny * cosx) - (cosz * sinx);
    $r.m8  = -siny;
    $r.m9  = cosy * sinx;
    $r.m10 = cosy * cosx;

    $r;
  }

  method RotateZYX (Vector3() $a) {
    my $r = Matrix.new;

    my num32 \cz = ($a.z).cos;
    my num32 \sz = ($a.z).sin;
    my num32 \cy = ($a.y).cos;
    my num32 \sy = ($a.y).sin;
    my num32 \cx = ($a.x).cos;
    my num32 \sx = ($a.x).sin;

    $r.m0  = cz * cy;
    $r.m4  = cz * sy * sx - cx * sz;
    $r.m8  = sz * sx + cz * cx * sy;
    $r.m12 = 0.00;
    $r.m1  = cy * sz;
    $r.m5  = cz * cx + sz * sy * sx;
    $r.m9  = cx * sz * sy - cz * sx;
    $r.m13 = 0.0;
    $r.m2  = -sy;
    $r.m6  = cy * sx;
    $r.m10 = cy * cx;
    $r.m14 = 0.0;
    $r.m3  = 0.0;
    $r.m7  = 0.0;
    $r.m11 = 0.0;
    $r.m15 = 1.0;

    $r
  }

  method Scale (Num() $xx, Num() $yy, Num() $zz --> Matrix) {
    my num32 ($x, $y, $z) = ($xx, $yy, $zz);

    Matrix.init(
      $x,  0.0, 0.0, 0.0,
      0.0, $y,  0.0, 0.0,
      0.0, 0.0, $z,  0.0,
      0.0, 0.0, 0.0, 1.0
    );
  }

  # ...


}
