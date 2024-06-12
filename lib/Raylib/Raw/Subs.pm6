use v6.c;

use NativeCall;

unit package Raylib::Raw::Subs;

sub SUB  (&block, :b(:$block) = False) is export {
  my $p = &block.signature.params.elems;

  $block
    ??  ->   *@a   { $p ?? &block( |@a[ ^$p ] ) !! &block() }
    !! sub ( *@a ) { $p ?? &block( |@a[ ^$p ] ) !! &block() }
}
sub CB   (&block, :b(:$block) = False) is export { SUB(&block) }
sub DEF  (&block, :b(:$block) = False) is export { SUB(&block) }
sub FUNC (&block, :b(:$block) = False) is export { SUB(&block) }

sub cast (\T, $v) is export {
  nativecast(T, $v);
}

sub newCArray (
  \T,
   $fv?,
  :$size      = 1,
  :$encoding = 'utf8'
)
  is export
{
  # cw: It's almost always better to make Str a CArray[uint8]
  if (T, $fv).all ~~ Str {
    return CArray[uint8].new( |$fv.encode($encoding), 0 );
  }

  my $s = T.REPR eq 'CStruct' || T ~~ Str;

  sub nilVal {
    do given T {
      when uint8 | int8 | uint16 | int16 | uint32 | int32 | uint64 | int64
        { 0 }
      when num32 | num64
        { 0e0 }
      when $s.not
        { T }
      default
        { Pointer[T] }
    }
  }

  my $p = do if T ~~ Str {
    # cw: The below should work, but doesn't for strings for some reason...
    #     2023/26/04
    my $pp = CArray[Pointer].allocate($size);
    cast(CArray[Str], $pp);
  } else {
    ( $s.not ?? CArray[T] !! CArray[ Pointer[T] ] ).allocate($size);
  }
  $p[0] = $fv ?? $fv !! nilVal();
  $p;
}
