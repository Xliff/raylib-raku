use v6;

use NativeCall;
use Method::Also;

use Raylib::Bindings;
use Raylib::Raw::Sound;

use Raylib::Roles::Reapable;

class Raylib::Sound does Reapable {
  has Sound $!sound handles(*) is built;

  method new (Sound $sound, :$reapable = False) {
    return Nil unless $sound;
    my $o = self.bless( :$sound );
    $o.addReapable($sound) if $reapable;
    $o;
  }

  method Raylib::Bindings::Sound
    is also<Sound>
  { $!sound }

  method is-playing {
    is-sound-playing($!sound);
  }

  method is-ready {
    is-sound-ready($!sound);
  }

  method load-alias {
    load-sound-alias($!sound);
  }

  method pause {
    pause-sound($!sound);
  }

  method play {
    play-sound($!sound);
  }

  method resume {
    resume-sound($!sound);
  }

  method set-pan (Num() $pan) {
    my num32 $p = $pan;

    set-sound-pan($!sound, $p);
  }

  method set-pitch (Num() $pitch) {
    my num32 $p = $pitch;

    set-sound-pitch($!sound, $p);
  }

  method set-volume (Num() $volume) {
    my num32 $v = $volume;

    set-sound-volume($!sound, $v);
  }

  method stop {
    stop-sound($!sound);
  }

  method unload {
    unload-sound($!sound);
  }

  method unload-alias {
    unload-sound-alias($!sound);
  }

  multi method update (@data, $sampleCount) {
    samewith(CArray[uint8].new(@data), $sampleCount);
  }
  multi method update (Blob $data, $sampleCount) {
    samewith(CArray[uint8].new($data), $sampleCount);
  }
  multi method update (CArray[uint8] $data, $sampleCount) {
    samewith( nativecast(Pointer, $data), $sampleCount );
  }
  multi method update(Pointer $data, Int() $sampleCount) {
    my int32 $s = $sampleCount;

    update-sound($!sound, $data, $s);
  }

  # cw: Next two methods into a role called ResourceLoadable?
  multi method load (ResourceFile $file) {
    samewith($file.absolute);
  }
  multi method load ($_) {
    when Distribution::Resource { samewith( .absolute ) }
    when IO                     { samewith( .absolute ) }
    when .^can('IO')            { samewith( .absolute ) }
    when .^can('Str')           { samewith( .Str      ) }

    default {
      X::Raylib::InvalidObject.new( object => $_ ).throw;
    }
  }
  multi method load (Str $fileName, :$raw = False) {
    my $sound = load-sound($fileName);
    return Nil unless $sound;
    return $sound if $raw;
    self.new($sound, :reapable);
  }

  method load-from-wave (Wave() $wave, :$raw = False) {
    my $sound = load-sound-from-wave($wave);
    return Nil unless $sound;
    return $sound if $raw;
    self.new($sound, :reapable);
  }

}
