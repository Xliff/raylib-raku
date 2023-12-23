use v6;

use Raylib::Bindings;

class Raylib::Shader {
  has Shader $!shader handles(*) is built;

  method begin {
    begin-shader-mode($!shader);
  }

  method is-ready {
    is-shader-ready($shader);
  }

  method get-location (Str() $uniformName) {
    get-shader-location($!shader, $uniformName)

  }
  method get-location-attrib (Str() $attribName) {
    get-shader-location-attrib($!shader, $attribName);
  }

  # cw: Should make multi for various obvious types!
  multi method set-value (
    Int()   $locIndex,
    Pointer $value,
    Int()   $uniformType
  ) {
    my int32 ($l, $u) = ($locIndex, $uniformType)

    set-shader-value($!shader, $value, $u);
  }
  multi method set-value (
    Int() $locIndex,
    Str   $value,
    Int() $uniformType
  ) {
    my int32 $l = $locIndex;

    samewith(
      $l,
      nativecast(Pointer, $value),
      $uniformType
    );
  }
  multi method set-value (
    Int()  $locIndex,
    Int    $value,
    Int()  $uniformType
  ) {
    my $v = CArray[uint32].allocate(1);
    $v[0] = $value;

    samewith(
      $locIndex,
      nativecast(Pointer, $value),
      $uniformType
    );
  }
  multi method set-value (
    Int()  $locIndex,
    Int    $value,
    Int()  $uniformType,
          :s(:$signed)       is required where *.so
  ) {
    my $v = CArray[int32].allocate(1);
    $v[0] = $value;

    samewith(
      $locIndex,
      nativecast(Pointer, $value),
      $uniformType
    );
  }
  multi method set-value (
    Int()  $locIndex,
    Int    $value,
    Int()  $uniformType,
          :d(:$double)       is required where *.so
  ) {
    my $v = CArray[uint64].allocate(1);
    $v[0] = $value;

    samewith(
      $locIndex,
      nativecast(Pointer, $value),
      $uniformType
    );
  }
  multi method set-value (
    Int()  $locIndex,
    Int    $value,
    Int()  $uniformType,
          :s(:$signed)       is required where *.so,
          :d(:$double)       is required where *.so
  ) {
    my $v = CArray[int64].allocate(1);
    $v[0] = $value;

    samewith(
      $locIndex,
      nativecast(Pointer, $value),
      $uniformType
    );
  }

  method set-vector (
    Int()   $locIndex,
    Pointer $value,
    Int()   $uniformType,
    Int()   $count
  ) {
    my int32 ($l, $u, $c) = ($locIndex, $uniformType, $count);

    set-shader-value-v($!shader, $l, $value, $u, $c);
  }

  method set-value-matrix (
    Int()    $locIndex,
    Matrix() $mat
  ) {
    my int32 $l = $locIndex;

    set-shader-value-matrix($!shader, $l, $mat);
  }

  method set-value-texture (
    Int()      $locIndex,
    Texture2D() $texture
  ) {
    my int32 $l = $locIndex;

    set-shader-value-texture($!shader, $l, $texture);
  }

  method unload {
    unload-shader($!shader)
  }

}
