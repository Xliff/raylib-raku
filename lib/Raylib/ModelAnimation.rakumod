use v6;

use NativeCall;
use Method::Also;

use Raylib::Raw::Exceptions;

use Raylib::Bindings;
use Raylib::Transform;

class ModelAnimationRevised is export is repr('CStruct') is rw {
  my (%BONES, %FRAMES, %FRAMEBONES);

  has int32           $.boneCount;
  has int32           $.frameCount;
  has Pointer         $!bones;
  has CArray[Pointer] $!framePoses;
  has CArray[uint8]   $.name;

  method init(
    int32            $boneCount,
    int32            $frameCount,
    Pointer          $bones,
    CArray[Pointer]  $framePoses,
                     $name         is copy,
                    :$encoding              = 'utf8'
  )
    returns ModelAnimation
  {
    $name = do given $name -> $_ is rw {
      when Str            { $_ .= encode($encoding);             proceed }
      when Buf            { $_ = CArray[uint8].new($_);          proceed }
      when Pointer        { $_ = nativecast(CArray[uint8], $_);  proceed }
      when CArray[uint8]  { $_ }

      default             { X::Raylib::UnknownType.new( value => $_ ).throw }
    }

    our sub malloc-ModelAnimationRevised(
      int32           $boneCount,
      int32           $frameCount,
      Pointer         $bones,
      CArray[Pointer] $framePoses,
      CArray[uint8]   $name
    )
      returns ModelAnimation
      is native(LIBRAYLIB)
      is symbol('malloc_ModelAnimation')
      is export {*}

    malloc-ModelAnimationRevised(
      $boneCount,
      $frameCount,
      $bones,
      $framePoses,
      $name
    );
  }

  # needs to act like another array!
  method framePose ($frameIndex is copy, :$raw = False) {
    X::Raylib::OutOfRange.new.throw if $frameIndex > $!frameCount;

    unless %FRAMEBONES{ self.WHERE } {
      my ($s, $c, $f) = (self, $!boneCount, $!framePoses);

      %FRAMEBONES{ self.WHERE } = (
        class :: does Positional {
          method bonePose ($index, :$raw = False)  {
            X::Raylib::OutOfRange.new.throw if $index > $c;

            my $t = nativecast(
              Transform,
              Pointer.new( $f[$frameIndex] + $index * nativesizeof(Transform) )
            );
            return $t if $raw;
            Raylib::Transform.new($t);
          }

          method elems       { $c                             }
          method AT-POS (\k) { self.bonePose(k)               }
          method head        { self.bonePose(0)               }
          method tail        { self.bonePose(self.elems.pred) }
        }
      ).new;
    }

    %FRAMEBONES{ self.WHERE }
  }

  method frames is also<framePoses> {
    unless %FRAMES{ self.WHERE } {
      my ($s, $c) = (self, $!frameCount);

      %FRAMES{ self.WHERE } = class :: does Positional {
        method elems       { $c                            }
        method AT-POS (\k) { $s.framePose(k)               }
        method head        { $s.framePose(0)               }
        method tail        { $s.framePose($s.elems.pred)   }
      }
    }
    %FRAMES{ self.WHERE }
  }

  method bone ($index) {
    X::Raylib::OutOfRange.new.throw if $index > $!boneCount;

    nativecast(
      BoneInfo,
      Pointer.new( $!bones + $index * nativesizeof(BoneInfo) )
    );
  }

  method bones {
    unless %BONES{ self.WHERE } {
      my ($s, $c) = (self, $!boneCount);

      %BONES{ self.WHERE } = class :: does Positional    {
        method elems       { $c                       }
        method AT-POS (\k) { $s.bone(k)               }
        method head        { $s.bone(0)               }
        method tail        { $s.bone($s.elems.pred)   }
      }
    }
    %BONES{ self.WHERE }
  }

  submethod DESTROY {
    %FRAMES{ self.WHERE }:destroy;
    %BONES{ self.WHERE }:destroy;
    free-ModelAnimation( nativecast(ModelAnimation, self) );
  }

}

class Raylib::ModelAnimation {
  has ModelAnimation        $!oldanimation;
  has ModelAnimationRevised $!animation     handles(*);
  has                       $!animCount;

  multi method load (Str() $filename) {
    samewith($filename, $);
  }
  multi method load (Str() $fileName, $animCount is rw) {
    my int32 $a = 0;

    my $rv = load-model-animations($fileName, $a);
    $!animCount = $a;
    $rv;
  }

  method unload {
    unload-model-animation($!oldanimation)
  }

}

class Raylib::ModelAnimations does Positional {
  has Pointer $!animations is built;
  has int32   $!animCount  is built;

  method animation ($index) {
    X::Raylib::OutOfRange.new.throw if $index > $!animCount;

    nativecast(
      ModelAnimationRevised,
      Pointer.new( $!animations + $index * nativesizeof(ModelAnimationRevised) )
    );
  }

  method elems       { $!animCount                  }
  method AT-POS (\k) { $.animation(k)               }
  method head        { $.animation(0)               }
  method tail        { $.animation(self.elems.pred) }

  multi method load (IO $file) {
    samewith( $file.absolute );
  }
  multi method load (Str() $fileName) {
    my int32 $animCount = 0;

    my $animations = load-model-animations($fileName, $animCount);
    return Nil unless $animations;
    self.bless(
      animations => nativecast(Pointer, $animations),
      animCount  => $animCount
    );
  }

  method unload {
    unload-model-animations(
      nativecast(ModelAnimation, $!animations),
      $!animCount
    )
  }
}
