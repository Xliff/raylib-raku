use v6;

use NativeCall;

use Raylib::Bindings;

unit package Raylib::Raw::Sound;

sub is-sound-playing (
    Sound $sound
    --> bool
  )
  is symbol("IsSoundPlaying_pointerized")
  is export
  is native(LIBRAYLIB) {*};

sub is-sound-ready (
    Sound $sound
    --> bool
  )
  is symbol("IsSoundReady_pointerized")
  is export
  is native(LIBRAYLIB) {*};

sub load-sound-alias (
    Sound $source
    --> Sound
  )
  is symbol("LoadSoundAlias_pointerized")
  is export
  is native(LIBRAYLIB) {*};

sub pause-sound (Sound $sound)
  is symbol("PauseSound_pointerized")
  is export
  is native(LIBRAYLIB) {*};

sub play-sound (Sound $sound)
  is symbol("PlaySound_pointerized")
  is export
  is native(LIBRAYLIB) {*};

sub resume-sound (Sound $sound)
  is symbol("ResumeSound_pointerized")
  is export
  is native(LIBRAYLIB) {*};

sub set-sound-pan (
    Sound $sound,
    num32 $pan
  )
  is symbol("SetSoundPan_pointerized")
  is export
  is native(LIBRAYLIB) {*};

sub set-sound-pitch (
    Sound $sound,
    num32 $pitch
  )
  is symbol("SetSoundPitch_pointerized")
  is export
  is native(LIBRAYLIB) {*};

sub set-sound-volume (
    Sound $sound,
    num32 $volume
  )
  is symbol("SetSoundVolume_pointerized")
  is export
  is native(LIBRAYLIB) {*};

sub stop-sound (Sound $sound)
  is symbol("StopSound_pointerized")
  is export
  is native(LIBRAYLIB) {*};

sub unload-sound (Sound $sound)
  is symbol("UnloadSound_pointerized")
  is export
  is native(LIBRAYLIB) {*};

sub unload-sound-alias (Sound $alias)
  is symbol("UnloadSoundAlias_pointerized")
  is export
  is native(LIBRAYLIB) {*};

sub update-sound (
    Sound   $sound,
    Pointer $data,
    int32   $sampleCount
  )
  is symbol("UpdateSound_pointerized")
  is export
  is native(LIBRAYLIB) {*};

our sub load-sound (Str $fileName)
  returns Sound
  is      export
  is      native(LIBRAYLIB)
  is      symbol('LoadSound_pointerized'){ * }

our sub load-sound-from-wave (Wave $wave)
  returns Sound
  is      export
  is      native(LIBRAYLIB)
  is      symbol('LoadSoundFromWave_pointerized'){ * }
