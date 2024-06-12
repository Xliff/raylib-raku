use v6;

use NativeCall;

use Raylib::Bindings;

use Raylib::Raw::Math;

class Raylib::Matrix {
  has Matrix $!matrix handles(*) is built;

  method Raylib::Bindings::Matrix { $!matrix }

  multi method new (Matrix $matrix) {
    return Nil unless $matrix;
    self.bless( :$matrix );
  }
  multi method new (*@mm) {

    samewith(
      @mm.map({ .Num if $_ !~~ Num && .^can('Num') })
    );
  }
  multi method new (Num @mm, :$original = False) {
    samewith( CArray[num32].new(@mm), :$original );
  }
  multi method new (CArray[num32] @mm, :$original) {
    my @c = @mm[^16].Array;

    return samewith(|@c, :original) if $original;
    samewith( |@c );
  }
  multi method new(
    Num()  $mm0,
    Num()  $mm1,
    Num()  $mm2,
    Num()  $mm3,
    Num()  $mm4,
    Num()  $mm5,
    Num()  $mm6,
    Num()  $mm7,
    Num()  $mm8,
    Num()  $mm9,
    Num()  $mm10,
    Num()  $mm11,
    Num()  $mm12,
    Num()  $mm13,
    Num()  $mm14,
    Num()  $mm15
  ) {
    samewith(
      :original,
      $mm0,
      $mm4,
      $mm8,
      $mm12,
      $mm1,
      $mm5,
      $mm9,
      $mm13,
      $mm2,
      $mm6,
      $mm10,
      $mm14,
      $mm3,
      $mm7,
      $mm11,
      $mm15,
    );
  }

  multi method new(
    Num()  $mm0,
    Num()  $mm4,
    Num()  $mm8,
    Num()  $mm12,
    Num()  $mm1,
    Num()  $mm5,
    Num()  $mm9,
    Num()  $mm13,
    Num()  $mm2,
    Num()  $mm6,
    Num()  $mm10,
    Num()  $mm14,
    Num()  $mm3,
    Num()  $mm7,
    Num()  $mm11,
    Num()  $mm15,
          :$original is required where *.so
  ) {
    my num32 ($m0,  $m1,  $m2,  $m3)  = ($mm0,  $mm1,  $mm2,  $mm3);
    my num32 ($m4,  $m5,  $m6,  $m7)  = ($mm4,  $mm5,  $mm6,  $mm7);
    my num32 ($m8,  $m9,  $m10, $m11) = ($mm8,  $mm9,  $mm10, $mm11);
    my num32 ($m12, $m13, $m14, $m15) = ($mm12, $mm13, $mm14, $mm15);

    self.bless(
      matrix => Matrix.init(
        $m0,
        $m4,
        $m8,
        $m12,
        $m1,
        $m5,
        $m9,
        $m13,
        $m2,
        $m6,
        $m10,
        $m14,
        $m3,
        $m7,
        $m11,
        $m15
      )
    );
  }

  method multiply ($b) {
    Raylib::Raw::Math::Matrix.Multiply(
      self,
      $b
    );
  }

  method rotate ($axis, $angle) {
    Raylib::Raw::Math::Matrix.Rotate($axis, $angle);
  }

  method rotate-x ($angle) {
    Raylib::Raw::Math::Matrix.RotateX($angle);
  }

  method rotate-y ($angle) {
    Raylib::Raw::Math::Matrix.RotateY($angle);
  }

  method rotate-z ($angle) {
    Raylib::Raw::Math::Matrix.RotateZ($angle);
  }

}

constant M = Raylib::Matrix;
