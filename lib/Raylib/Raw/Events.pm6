use v6;

use NativeCall;

use Raylib::Raw::Definitions;
use Raylib::Raw::Structs;

unit package Raylib::Raw::Texture2D;

our sub term:<is-window-ready> () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowReady'){ * }
our sub term:<is-window-fullscreen> () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowFullscreen'){ * }
our sub term:<is-window-hidden> () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowHidden'){ * }
our sub term:<is-window-minimized> () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowMinimized'){ * }
our sub term:<is-window-maximized> () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowMaximized'){ * }
our sub term:<is-window-focused> () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowFocused'){ * }
our sub term:<is-window-resized> () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowResized'){ * }
our sub term:<is-cursor-hidden> () returns bool is export is native(LIBRAYLIB) is symbol('IsCursorHidden'){ * }
our sub term:<is-cursor-on-screen> () returns bool is export is native(LIBRAYLIB) is symbol('IsCursorOnScreen'){ * }
our sub term:<is-file-dropped> () returns bool is export is native(LIBRAYLIB) is symbol('IsFileDropped'){ * }
our sub term:<is-audio-device-ready> () returns bool is export is native(LIBRAYLIB) is symbol('IsAudioDeviceReady'){ * }
our sub is-path-file (Str $path) returns bool is export is native(LIBRAYLIB) is symbol('IsPathFile'){ * }
our sub is-key-pressed (int32 $key) returns bool is export is native(LIBRAYLIB) is symbol('IsKeyPressed'){ * }
our sub is-key-pressed-repeat (int32 $key) returns bool is export is native(LIBRAYLIB) is symbol('IsKeyPressedRepeat'){ * }
our sub is-key-down (int32 $key) returns bool is export is native(LIBRAYLIB) is symbol('IsKeyDown'){ * }
our sub is-key-released (int32 $key) returns bool is export is native(LIBRAYLIB) is symbol('IsKeyReleased'){ * }
our sub is-key-up (int32 $key) returns bool is export is native(LIBRAYLIB) is symbol('IsKeyUp'){ * }
our sub is-gamepad-available (int32 $gamepad) returns bool is export is native(LIBRAYLIB) is symbol('IsGamepadAvailable'){ * }
our sub is-gamepad-button-pressed (int32 $gamepad, int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsGamepadButtonPressed'){ * }
our sub is-gamepad-button-down (int32 $gamepad, int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsGamepadButtonDown'){ * }
our sub is-gamepad-button-released (int32 $gamepad, int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsGamepadButtonReleased'){ * }
our sub is-gamepad-button-up (int32 $gamepad, int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsGamepadButtonUp'){ * }
our sub is-mouse-button-pressed (int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsMouseButtonPressed'){ * }
our sub is-mouse-button-down (int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsMouseButtonDown'){ * }
our sub is-mouse-button-released (int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsMouseButtonReleased'){ * }
our sub is-mouse-button-up (int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsMouseButtonUp'){ * }
our sub is-gesture-detected (uint32 $gesture) returns bool is export is native(LIBRAYLIB) is symbol('IsGestureDetected'){ * }
our sub is-window-state (uint32 $flag) returns bool is export is native(LIBRAYLIB) is symbol('IsWindowState'){ * }
our sub is-file-extension (Str $fileName, Str $ext) returns bool is export is native(LIBRAYLIB) is symbol('IsFileExtension'){ * }
our sub is-shader-ready (Shader $shader) returns bool is export is native(LIBRAYLIB) is symbol('IsShaderReady_pointerized'){ * }
our sub is-material-ready (Material $material) returns bool is export is native(LIBRAYLIB) is symbol('IsMaterialReady_pointerized'){ * }
our sub is-wave-ready (Wave $wave) returns bool is export is native(LIBRAYLIB) is symbol('IsWaveReady_pointerized'){ * }
our sub is-music-ready (Music $music) returns bool is export is native(LIBRAYLIB) is symbol('IsMusicReady_pointerized'){ * }
our sub is-music-stream-playing (Music $music) returns bool is export is native(LIBRAYLIB) is symbol('IsMusicStreamPlaying_pointerized'){ * }
our sub is-audio-stream-ready (AudioStream $stream) returns bool is export is native(LIBRAYLIB) is symbol('IsAudioStreamReady_pointerized'){ * }
our sub is-audio-stream-processed (AudioStream $stream) returns bool is export is native(LIBRAYLIB) is symbol('IsAudioStreamProcessed_pointerized'){ * }
our sub is-audio-stream-playing (AudioStream $stream) returns bool is export is native(LIBRAYLIB) is symbol('IsAudioStreamPlaying_pointerized'){ * }
