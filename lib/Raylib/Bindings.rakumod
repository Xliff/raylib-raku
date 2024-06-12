# This Raku module is generated from raylib.h
use Raylib::Raw::Definitions;
use Raylib::Raw::Enums;
use Raylib::Raw::Structs;

use CompUnit::Util :re-export;

unit module Raylib::Bindings:ver<0.0.15>:auth<zef:vushu>;

use NativeCall;

BEGIN re-export-everything('Raylib::Raw::Definitions');


our sub init-window-raw (int32 $width, int32 $height, Str $title)  is native(LIBRAYLIB) is symbol('InitWindow'){ * }

our sub init-window (Int() $width, Int() $height, Str() $title = 'Raku Raylib') is export {
  my int32 ($w, $h) = ($width, $height);

  init-window-raw($w, $h, $title);
}

our sub term:<close-window> () is export is native(LIBRAYLIB) is symbol('CloseWindow'){ * }
our sub term:<window-should-close> () returns bool is export is native(LIBRAYLIB) is symbol('WindowShouldClose'){ * }
our sub set-window-state (uint32 $flags) is export is native(LIBRAYLIB) is symbol('SetWindowState'){ * }
our sub clear-window-state (uint32 $flags) is export is native(LIBRAYLIB) is symbol('ClearWindowState'){ * }
our sub term:<toggle-fullscreen> () is export is native(LIBRAYLIB) is symbol('ToggleFullscreen'){ * }
our sub term:<toggle-borderless-windowed> () is export is native(LIBRAYLIB) is symbol('ToggleBorderlessWindowed'){ * }
our sub term:<maximize-window> () is export is native(LIBRAYLIB) is symbol('MaximizeWindow'){ * }
our sub term:<minimize-window> () is export is native(LIBRAYLIB) is symbol('MinimizeWindow'){ * }
our sub term:<restore-window> () is export is native(LIBRAYLIB) is symbol('RestoreWindow'){ * }
our sub set-window-title (Str $title) is export is native(LIBRAYLIB) is symbol('SetWindowTitle'){ * }
our sub set-window-position (int32 $x, int32 $y) is export is native(LIBRAYLIB) is symbol('SetWindowPosition'){ * }
our sub set-window-monitor (int32 $monitor) is export is native(LIBRAYLIB) is symbol('SetWindowMonitor'){ * }
our sub set-window-min-size (int32 $width, int32 $height) is export is native(LIBRAYLIB) is symbol('SetWindowMinSize'){ * }
our sub set-window-max-size (int32 $width, int32 $height) is export is native(LIBRAYLIB) is symbol('SetWindowMaxSize'){ * }
our sub set-window-size (int32 $width, int32 $height) is export is native(LIBRAYLIB) is symbol('SetWindowSize'){ * }
our sub set-window-opacity (num32 $opacity) is export is native(LIBRAYLIB) is symbol('SetWindowOpacity'){ * }
our sub term:<set-window-focused> () is export is native(LIBRAYLIB) is symbol('SetWindowFocused'){ * }
our sub term:<get-window-handle> () is export is native(LIBRAYLIB) is symbol('GetWindowHandle'){ * }
our sub term:<get-screen-width> () returns int32 is export is native(LIBRAYLIB) is symbol('GetScreenWidth'){ * }
our sub term:<get-screen-height> () returns int32 is export is native(LIBRAYLIB) is symbol('GetScreenHeight'){ * }
our sub term:<get-render-width> () returns int32 is export is native(LIBRAYLIB) is symbol('GetRenderWidth'){ * }
our sub term:<get-render-height> () returns int32 is export is native(LIBRAYLIB) is symbol('GetRenderHeight'){ * }
our sub term:<get-monitor-count> () returns int32 is export is native(LIBRAYLIB) is symbol('GetMonitorCount'){ * }
our sub term:<get-current-monitor> () returns int32 is export is native(LIBRAYLIB) is symbol('GetCurrentMonitor'){ * }
our sub get-monitor-width (int32 $monitor) returns int32 is export is native(LIBRAYLIB) is symbol('GetMonitorWidth'){ * }
our sub get-monitor-height (int32 $monitor) returns int32 is export is native(LIBRAYLIB) is symbol('GetMonitorHeight'){ * }
our sub get-monitor-physical-width (int32 $monitor) returns int32 is export is native(LIBRAYLIB) is symbol('GetMonitorPhysicalWidth'){ * }
our sub get-monitor-physical-height (int32 $monitor) returns int32 is export is native(LIBRAYLIB) is symbol('GetMonitorPhysicalHeight'){ * }
our sub get-monitor-refresh-rate (int32 $monitor) returns int32 is export is native(LIBRAYLIB) is symbol('GetMonitorRefreshRate'){ * }
our sub get-monitor-name (int32 $monitor) returns Str is export is native(LIBRAYLIB) is symbol('GetMonitorName'){ * }
our sub set-clipboard-text (Str $text) is export is native(LIBRAYLIB) is symbol('SetClipboardText'){ * }
our sub term:<get-clipboard-text> () returns Str is export is native(LIBRAYLIB) is symbol('GetClipboardText'){ * }
our sub term:<enable-event-waiting> () is export is native(LIBRAYLIB) is symbol('EnableEventWaiting'){ * }
our sub term:<disable-event-waiting> () is export is native(LIBRAYLIB) is symbol('DisableEventWaiting'){ * }
our sub term:<show-cursor> () is export is native(LIBRAYLIB) is symbol('ShowCursor'){ * }
our sub term:<hide-cursor> () is export is native(LIBRAYLIB) is symbol('HideCursor'){ * }
our sub term:<enable-cursor> () is export is native(LIBRAYLIB) is symbol('EnableCursor'){ * }
our sub term:<disable-cursor> () is export is native(LIBRAYLIB) is symbol('DisableCursor'){ * }
our sub term:<begin-drawing> () is export is native(LIBRAYLIB) is symbol('BeginDrawing'){ * }
our sub term:<end-drawing> () is export is native(LIBRAYLIB) is symbol('EndDrawing'){ * }
our sub term:<end-mode2d> () is export is native(LIBRAYLIB) is symbol('EndMode2D'){ * }
our sub term:<end-mode3d> () is export is native(LIBRAYLIB) is symbol('EndMode3D'){ * }
our sub term:<end-shader-mode> () is export is native(LIBRAYLIB) is symbol('EndShaderMode'){ * }
our sub begin-blend-mode (int32 $mode) is export is native(LIBRAYLIB) is symbol('BeginBlendMode'){ * }
our sub term:<end-blend-mode> () is export is native(LIBRAYLIB) is symbol('EndBlendMode'){ * }
our sub begin-scissor-mode (int32 $x, int32 $y, int32 $width, int32 $height) is export is native(LIBRAYLIB) is symbol('BeginScissorMode'){ * }
our sub term:<end-scissor-mode> () is export is native(LIBRAYLIB) is symbol('EndScissorMode'){ * }
our sub term:<end-vr-stereo-mode> () is export is native(LIBRAYLIB) is symbol('EndVrStereoMode'){ * }

our sub set-target-fps-raw (int32 $fps) is export is native(LIBRAYLIB) is symbol('SetTargetFPS'){ * }

our sub set-target-fps (Int() $fps) is export {
  my int32 $f = $fps;

  set-target-fps-raw($f);
}

our sub term:<get-frame-time> () returns num32 is export is native(LIBRAYLIB) is symbol('GetFrameTime'){ * }
our sub term:<get-time> () returns num64 is export is native(LIBRAYLIB) is symbol('GetTime'){ * }
our sub term:<get-fps> () returns int32 is export is native(LIBRAYLIB) is symbol('GetFPS'){ * }
our sub term:<swap-screen-buffer> () is export is native(LIBRAYLIB) is symbol('SwapScreenBuffer'){ * }
our sub term:<poll-input-events> () is export is native(LIBRAYLIB) is symbol('PollInputEvents'){ * }
our sub wait-time (num64 $seconds) is export is native(LIBRAYLIB) is symbol('WaitTime'){ * }
our sub set-random-seed (uint32 $seed) is export is native(LIBRAYLIB) is symbol('SetRandomSeed'){ * }
our sub get-random-value (int32 $min, int32 $max) returns int32 is export is native(LIBRAYLIB) is symbol('GetRandomValue'){ * }
our sub load-random-sequence (uint32 $count, int32 $min, int32 $max) returns int32 is export is native(LIBRAYLIB) is symbol('LoadRandomSequence'){ * }
our sub unload-random-sequence (int32 $sequence is rw, ) is export is native(LIBRAYLIB) is symbol('UnloadRandomSequence'){ * }
our sub take-screenshot (Str $fileName) is export is native(LIBRAYLIB) is symbol('TakeScreenshot'){ * }
our sub set-config-flags (uint32 $flags) is export is native(LIBRAYLIB) is symbol('SetConfigFlags'){ * }
our sub open-url (Str $url) is export is native(LIBRAYLIB) is symbol('OpenURL'){ * }
our sub trace-log (int32 $logLevel, Str $text, ) is export is native(LIBRAYLIB) is symbol('TraceLog'){ * }
our sub set-trace-log-level (int32 $logLevel) is export is native(LIBRAYLIB) is symbol('SetTraceLogLevel'){ * }
our sub mem-alloc (uint32 $size) is export is native(LIBRAYLIB) is symbol('MemAlloc'){ * }
our sub mem-realloc (Pointer[void] $ptr, uint32 $size) is export is native(LIBRAYLIB) is symbol('MemRealloc'){ * }
our sub mem-free (Pointer[void] $ptr, ) is export is native(LIBRAYLIB) is symbol('MemFree'){ * }
our sub set-trace-log-callback (&trace-log-callback (int32 $logLevel, Str $text, Str $args)) is export is native(LIBRAYLIB) is symbol('SetTraceLogCallback'){ * }
our sub set-load-file-data-callback (&load-file-data-callback (Str $fileName, int32 $dataSize is rw,  --> Str)) is export is native(LIBRAYLIB) is symbol('SetLoadFileDataCallback'){ * }
our sub set-save-file-data-callback (&save-file-data-callback (Str $fileName, Pointer[void] $data, int32 $dataSize --> bool)) is export is native(LIBRAYLIB) is symbol('SetSaveFileDataCallback'){ * }
our sub set-load-file-text-callback (&load-file-text-callback (Str $fileName --> Str)) is export is native(LIBRAYLIB) is symbol('SetLoadFileTextCallback'){ * }
our sub set-save-file-text-callback (&save-file-text-callback (Str $fileName, CArray[uint8] $text,  --> bool)) is export is native(LIBRAYLIB) is symbol('SetSaveFileTextCallback'){ * }
our sub load-file-data (Str $fileName, int32 $dataSize is rw, ) returns Str is export is native(LIBRAYLIB) is symbol('LoadFileData'){ * }
our sub unload-file-data (CArray[uint8] $data, ) is export is native(LIBRAYLIB) is symbol('UnloadFileData'){ * }
our sub save-file-data (Str $fileName, Pointer[void] $data, int32 $dataSize) returns bool is export is native(LIBRAYLIB) is symbol('SaveFileData'){ * }
our sub export-data-as-code (uint8 $data is rw, int32 $dataSize, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportDataAsCode'){ * }
our sub load-file-text (Str $fileName) returns Str is export is native(LIBRAYLIB) is symbol('LoadFileText'){ * }
our sub unload-file-text (CArray[uint8] $text, ) is export is native(LIBRAYLIB) is symbol('UnloadFileText'){ * }
our sub save-file-text (Str $fileName, CArray[uint8] $text, ) returns bool is export is native(LIBRAYLIB) is symbol('SaveFileText'){ * }
our sub file-exists (Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('FileExists'){ * }
our sub directory-exists (Str $dirPath) returns bool is export is native(LIBRAYLIB) is symbol('DirectoryExists'){ * }
our sub get-file-length (Str $fileName) returns int32 is export is native(LIBRAYLIB) is symbol('GetFileLength'){ * }
our sub get-file-extension (Str $fileName) returns Str is export is native(LIBRAYLIB) is symbol('GetFileExtension'){ * }
our sub get-file-name (Str $filePath) returns Str is export is native(LIBRAYLIB) is symbol('GetFileName'){ * }
our sub get-file-name-without-ext (Str $filePath) returns Str is export is native(LIBRAYLIB) is symbol('GetFileNameWithoutExt'){ * }
our sub get-directory-path (Str $filePath) returns Str is export is native(LIBRAYLIB) is symbol('GetDirectoryPath'){ * }
our sub get-prev-directory-path (Str $dirPath) returns Str is export is native(LIBRAYLIB) is symbol('GetPrevDirectoryPath'){ * }
our sub term:<get-working-directory> () returns Str is export is native(LIBRAYLIB) is symbol('GetWorkingDirectory'){ * }
our sub term:<get-application-directory> () returns Str is export is native(LIBRAYLIB) is symbol('GetApplicationDirectory'){ * }
our sub change-directory (Str $dir) returns bool is export is native(LIBRAYLIB) is symbol('ChangeDirectory'){ * }
our sub compress-data (uint8 $data is rw, int32 $dataSize, int32 $compDataSize is rw, ) returns Str is export is native(LIBRAYLIB) is symbol('CompressData'){ * }
our sub decompress-data (uint8 $compData is rw, int32 $compDataSize, int32 $dataSize is rw, ) returns Str is export is native(LIBRAYLIB) is symbol('DecompressData'){ * }
our sub encode-data-base64 (uint8 $data is rw, int32 $dataSize, int32 $outputSize is rw, ) returns Str is export is native(LIBRAYLIB) is symbol('EncodeDataBase64'){ * }
our sub decode-data-base64 (uint8 $data is rw, int32 $outputSize is rw, ) returns Str is export is native(LIBRAYLIB) is symbol('DecodeDataBase64'){ * }
our sub unload-automation-event-list (AutomationEventList $list is rw) is export is native(LIBRAYLIB) is symbol('UnloadAutomationEventList'){ * }
our sub set-automation-event-list (AutomationEventList $list is rw) is export is native(LIBRAYLIB) is symbol('SetAutomationEventList'){ * }
our sub set-automation-event-base-frame (int32 $frame) is export is native(LIBRAYLIB) is symbol('SetAutomationEventBaseFrame'){ * }
our sub term:<start-automation-event-recording> () is export is native(LIBRAYLIB) is symbol('StartAutomationEventRecording'){ * }
our sub term:<stop-automation-event-recording> () is export is native(LIBRAYLIB) is symbol('StopAutomationEventRecording'){ * }
our sub term:<get-key-pressed> () returns int32 is export is native(LIBRAYLIB) is symbol('GetKeyPressed'){ * }
our sub term:<get-char-pressed> () returns int32 is export is native(LIBRAYLIB) is symbol('GetCharPressed'){ * }
our sub set-exit-key (int32 $key) is export is native(LIBRAYLIB) is symbol('SetExitKey'){ * }
our sub get-gamepad-name (int32 $gamepad) returns Str is export is native(LIBRAYLIB) is symbol('GetGamepadName'){ * }
our sub term:<get-gamepad-button-pressed> () returns int32 is export is native(LIBRAYLIB) is symbol('GetGamepadButtonPressed'){ * }
our sub get-gamepad-axis-count (int32 $gamepad) returns int32 is export is native(LIBRAYLIB) is symbol('GetGamepadAxisCount'){ * }
our sub get-gamepad-axis-movement (int32 $gamepad, int32 $axis) returns num32 is export is native(LIBRAYLIB) is symbol('GetGamepadAxisMovement'){ * }
our sub set-gamepad-mappings (Str $mappings) returns int32 is export is native(LIBRAYLIB) is symbol('SetGamepadMappings'){ * }
our sub term:<get-mouse-x> () returns int32 is export is native(LIBRAYLIB) is symbol('GetMouseX'){ * }
our sub term:<get-mouse-y> () returns int32 is export is native(LIBRAYLIB) is symbol('GetMouseY'){ * }
our sub set-mouse-position (int32 $x, int32 $y) is export is native(LIBRAYLIB) is symbol('SetMousePosition'){ * }
our sub set-mouse-offset (int32 $offsetX, int32 $offsetY) is export is native(LIBRAYLIB) is symbol('SetMouseOffset'){ * }
our sub set-mouse-scale (num32 $scaleX, num32 $scaleY) is export is native(LIBRAYLIB) is symbol('SetMouseScale'){ * }
our sub term:<get-mouse-wheel-move> () returns num32 is export is native(LIBRAYLIB) is symbol('GetMouseWheelMove'){ * }
our sub set-mouse-cursor (int32 $cursor) is export is native(LIBRAYLIB) is symbol('SetMouseCursor'){ * }
our sub term:<get-touch-x> () returns int32 is export is native(LIBRAYLIB) is symbol('GetTouchX'){ * }
our sub term:<get-touch-y> () returns int32 is export is native(LIBRAYLIB) is symbol('GetTouchY'){ * }
our sub get-touch-point-id (int32 $index) returns int32 is export is native(LIBRAYLIB) is symbol('GetTouchPointId'){ * }
our sub term:<get-touch-point-count> () returns int32 is export is native(LIBRAYLIB) is symbol('GetTouchPointCount'){ * }
our sub set-gestures-enabled (uint32 $flags) is export is native(LIBRAYLIB) is symbol('SetGesturesEnabled'){ * }
our sub term:<get-gesture-detected> () returns int32 is export is native(LIBRAYLIB) is symbol('GetGestureDetected'){ * }
our sub term:<get-gesture-hold-duration> () returns num32 is export is native(LIBRAYLIB) is symbol('GetGestureHoldDuration'){ * }
our sub term:<get-gesture-drag-angle> () returns num32 is export is native(LIBRAYLIB) is symbol('GetGestureDragAngle'){ * }
our sub term:<get-gesture-pinch-angle> () returns num32 is export is native(LIBRAYLIB) is symbol('GetGesturePinchAngle'){ * }
our sub update-camera (Camera $camera is rw, int32 $mode) is export is native(LIBRAYLIB) is symbol('UpdateCamera'){ * }

our sub get-pixel-data-size (int32 $width, int32 $height, int32 $format) returns int32 is export is native(LIBRAYLIB) is symbol('GetPixelDataSize'){ * }
our sub load-font-data (uint8 $fileData is rw, int32 $dataSize, int32 $fontSize, int32 $codepoints is rw, int32 $codepointCount, int32 $type) returns GlyphInfo is export is native(LIBRAYLIB) is symbol('LoadFontData'){ * }
our sub unload-font-data (GlyphInfo $glyphs is rw, int32 $glyphCount) is export is native(LIBRAYLIB) is symbol('UnloadFontData'){ * }
our sub draw-fps (int32 $posX, int32 $posY) is export is native(LIBRAYLIB) is symbol('DrawFPS'){ * }
our sub set-text-line-spacing (int32 $spacing) is export is native(LIBRAYLIB) is symbol('SetTextLineSpacing'){ * }
our sub measure-text-raw (Str $text, int32 $fontSize) returns int32 is export is native(LIBRAYLIB) is symbol('MeasureText'){ * }

sub measure-text (Str() $text, Int() $fontSize) is export {
  my int32 $f = $fontSize;

  measure-text-raw($text, $f);
}

our sub load-utf8 (int32 $codepoints is rw, int32 $length) returns Str is export is native(LIBRAYLIB) is symbol('LoadUTF8'){ * }
our sub unload-utf8 (CArray[uint8] $text, ) is export is native(LIBRAYLIB) is symbol('UnloadUTF8'){ * }
our sub load-codepoints (Str $text, int32 $count is rw, ) returns int32 is export is native(LIBRAYLIB) is symbol('LoadCodepoints'){ * }
our sub unload-codepoints (int32 $codepoints is rw, ) is export is native(LIBRAYLIB) is symbol('UnloadCodepoints'){ * }
our sub get-codepoint-count (Str $text) returns int32 is export is native(LIBRAYLIB) is symbol('GetCodepointCount'){ * }
our sub get-codepoint (Str $text, int32 $codepointSize is rw, ) returns int32 is export is native(LIBRAYLIB) is symbol('GetCodepoint'){ * }
our sub get-codepoint-next (Str $text, int32 $codepointSize is rw, ) returns int32 is export is native(LIBRAYLIB) is symbol('GetCodepointNext'){ * }
our sub get-codepoint-previous (Str $text, int32 $codepointSize is rw, ) returns int32 is export is native(LIBRAYLIB) is symbol('GetCodepointPrevious'){ * }
our sub codepoint-to-utf8 (int32 $codepoint, int32 $utf8Size is rw, ) returns Str is export is native(LIBRAYLIB) is symbol('CodepointToUTF8'){ * }
our sub text-copy (CArray[uint8] $dst, Str $src) returns int32 is export is native(LIBRAYLIB) is symbol('TextCopy'){ * }
our sub text-is-equal (Str $text1, Str $text2) returns bool is export is native(LIBRAYLIB) is symbol('TextIsEqual'){ * }
our sub text-length (Str $text) returns int32 is export is native(LIBRAYLIB) is symbol('TextLength'){ * }
our sub text-format (Str $text, ) returns Str is export is native(LIBRAYLIB) is symbol('TextFormat'){ * }
our sub text-subtext (Str $text, int32 $position, int32 $length) returns Str is export is native(LIBRAYLIB) is symbol('TextSubtext'){ * }
our sub text-replace (CArray[uint8] $text, Str $replace, Str $by) returns Str is export is native(LIBRAYLIB) is symbol('TextReplace'){ * }
our sub text-insert (Str $text, Str $insert, int32 $position) returns Str is export is native(LIBRAYLIB) is symbol('TextInsert'){ * }
our sub text-join (Str $textList, int32 $count, Str $delimiter) returns Str is export is native(LIBRAYLIB) is symbol('TextJoin'){ * }
our sub text-split (Str $text, Str $delimiter, int32 $count is rw, ) returns Str is export is native(LIBRAYLIB) is symbol('TextSplit'){ * }
our sub text-append (CArray[uint8] $text, Str $append, int32 $position is rw, ) is export is native(LIBRAYLIB) is symbol('TextAppend'){ * }
our sub text-find-index (Str $text, Str $find) returns int32 is export is native(LIBRAYLIB) is symbol('TextFindIndex'){ * }
our sub text-to-upper (Str $text) returns Str is export is native(LIBRAYLIB) is symbol('TextToUpper'){ * }
our sub text-to-lower (Str $text) returns Str is export is native(LIBRAYLIB) is symbol('TextToLower'){ * }
our sub text-to-pascal (Str $text) returns Str is export is native(LIBRAYLIB) is symbol('TextToPascal'){ * }
our sub text-to-integer (Str $text) returns int32 is export is native(LIBRAYLIB) is symbol('TextToInteger'){ * }
our sub text-to-float (Str $text) returns num32 is export is native(LIBRAYLIB) is symbol('TextToFloat'){ * }
our sub draw-grid (int32 $slices, num32 $spacing) is export is native(LIBRAYLIB) is symbol('DrawGrid'){ * }
our sub upload-mesh (Mesh $mesh is rw, bool $dynamic) is export is native(LIBRAYLIB) is symbol('UploadMesh'){ * }
our sub gen-mesh-tangents (Mesh $mesh is rw) is export is native(LIBRAYLIB) is symbol('GenMeshTangents'){ * }
our sub load-materials (Str $fileName, int32 $materialCount is rw, ) returns Material is export is native(LIBRAYLIB) is symbol('LoadMaterials'){ * }

our sub load-model-animations (Str $fileName, int32 $animCount is rw, ) returns ModelAnimation is export is native(LIBRAYLIB) is symbol('LoadModelAnimations'){ * }
our sub unload-model-animations (ModelAnimation $animations is rw, int32 $animCount) is export is native(LIBRAYLIB) is symbol('UnloadModelAnimations'){ * }
our sub term:<init-audio-device> () is export is native(LIBRAYLIB) is symbol('InitAudioDevice'){ * }
our sub term:<close-audio-device> () is export is native(LIBRAYLIB) is symbol('CloseAudioDevice'){ * }
our sub set-master-volume (num32 $volume) is export is native(LIBRAYLIB) is symbol('SetMasterVolume'){ * }
our sub term:<get-master-volume> () returns num32 is export is native(LIBRAYLIB) is symbol('GetMasterVolume'){ * }
our sub wave-crop (Wave $wave is rw, int32 $initSample, int32 $finalSample) is export is native(LIBRAYLIB) is symbol('WaveCrop'){ * }
our sub wave-format (Wave $wave is rw, int32 $sampleRate, int32 $sampleSize, int32 $channels) is export is native(LIBRAYLIB) is symbol('WaveFormat'){ * }
our sub unload-wave-samples (num32 $samples is rw) is export is native(LIBRAYLIB) is symbol('UnloadWaveSamples'){ * }
our sub set-audio-stream-buffer-size-default (int32 $size) is export is native(LIBRAYLIB) is symbol('SetAudioStreamBufferSizeDefault'){ * }
our sub attach-audio-mixed-processor (&audio-callback (Pointer[void] $bufferData, uint32 $frames)) is export is native(LIBRAYLIB) is symbol('AttachAudioMixedProcessor'){ * }

####### Pointerized functions ########
our sub get-monitor-position (int32 $monitor) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetMonitorPosition_pointerized'){ * }
our sub term:<get-window-position> () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetWindowPosition_pointerized'){ * }
our sub term:<get-window-scale-dpi> () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetWindowScaleDPI_pointerized'){ * }
our sub clear-background (Color $color) is export is native(LIBRAYLIB) is symbol('ClearBackground_pointerized'){ * }
our sub begin-mode2d (Camera2D $camera) is export is native(LIBRAYLIB) is symbol('BeginMode2D_pointerized'){ * }
our sub begin-mode3d (Camera3D $camera) is export is native(LIBRAYLIB) is symbol('BeginMode3D_pointerized'){ * }

our sub begin-shader-mode (Shader $shader) is export is native(LIBRAYLIB) is symbol('BeginShaderMode_pointerized'){ * }
our sub begin-vr-stereo-mode (VrStereoConfig $config) is export is native(LIBRAYLIB) is symbol('BeginVrStereoMode_pointerized'){ * }
our sub load-vr-stereo-config (VrDeviceInfo $device) returns VrStereoConfig is export is native(LIBRAYLIB) is symbol('LoadVrStereoConfig_pointerized'){ * }
our sub unload-vr-stereo-config (VrStereoConfig $config) is export is native(LIBRAYLIB) is symbol('UnloadVrStereoConfig_pointerized'){ * }

our sub load-shader (
  CArray[uint8] $vsFileName,
  CArray[uint8] $fsFileName
)
  returns Shader
  is      export 
  is      native(LIBRAYLIB)
  is      symbol('LoadShader_pointerized')
{ * }

our sub load-shader-from-memory (Str $vsCode, Str $fsCode) returns Shader is export is native(LIBRAYLIB) is symbol('LoadShaderFromMemory_pointerized'){ * }
our sub get-shader-location (Shader $shader, Str $uniformName) returns int32 is export is native(LIBRAYLIB) is symbol('GetShaderLocation_pointerized'){ * }
our sub get-shader-location-attrib (Shader $shader, Str $attribName) returns int32 is export is native(LIBRAYLIB) is symbol('GetShaderLocationAttrib_pointerized'){ * }
our sub set-shader-value (Shader $shader, int32 $locIndex, Pointer[void] $value, int32 $uniformType) is export is native(LIBRAYLIB) is symbol('SetShaderValue_pointerized'){ * }
our sub set-shader-value-v (Shader $shader, int32 $locIndex, Pointer[void] $value, int32 $uniformType, int32 $count) is export is native(LIBRAYLIB) is symbol('SetShaderValueV_pointerized'){ * }
our sub set-shader-value-matrix (Shader $shader, int32 $locIndex, Matrix $mat) is export is native(LIBRAYLIB) is symbol('SetShaderValueMatrix_pointerized'){ * }
our sub set-shader-value-texture (Shader $shader, int32 $locIndex, Texture2D $texture) is export is native(LIBRAYLIB) is symbol('SetShaderValueTexture_pointerized'){ * }
our sub unload-shader (Shader $shader) is export is native(LIBRAYLIB) is symbol('UnloadShader_pointerized'){ * }
our sub get-mouse-ray (Vector2 $mousePosition, Camera $camera) returns Ray is export is native(LIBRAYLIB) is symbol('GetMouseRay_pointerized'){ * }
our sub get-camera-matrix (Camera $camera) returns Matrix is export is native(LIBRAYLIB) is symbol('GetCameraMatrix_pointerized'){ * }
our sub get-camera-matrix2d (Camera2D $camera) returns Matrix is export is native(LIBRAYLIB) is symbol('GetCameraMatrix2D_pointerized'){ * }
our sub get-world-to-screen (Vector3 $position, Camera $camera) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetWorldToScreen_pointerized'){ * }
our sub get-screen-to-world2d (Vector2 $position, Camera2D $camera) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetScreenToWorld2D_pointerized'){ * }
our sub get-world-to-screen-ex (Vector3 $position, Camera $camera, int32 $width, int32 $height) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetWorldToScreenEx_pointerized'){ * }
our sub get-world-to-screen2d (Vector2 $position, Camera2D $camera) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetWorldToScreen2D_pointerized'){ * }
our sub load-directory-files (Str $dirPath) returns FilePathList is export is native(LIBRAYLIB) is symbol('LoadDirectoryFiles_pointerized'){ * }
our sub load-directory-files-ex (Str $basePath, Str $filter, bool $scanSubdirs) returns FilePathList is export is native(LIBRAYLIB) is symbol('LoadDirectoryFilesEx_pointerized'){ * }
our sub unload-directory-files (FilePathList $files) is export is native(LIBRAYLIB) is symbol('UnloadDirectoryFiles_pointerized'){ * }
our sub term:<load-dropped-files> () returns FilePathList is export is native(LIBRAYLIB) is symbol('LoadDroppedFiles_pointerized'){ * }
our sub unload-dropped-files (FilePathList $files) is export is native(LIBRAYLIB) is symbol('UnloadDroppedFiles_pointerized'){ * }
our sub get-file-mod-time (Str $fileName) returns long is export is native(LIBRAYLIB) is symbol('GetFileModTime_pointerized'){ * }
our sub load-automation-event-list (Str $fileName) returns AutomationEventList is export is native(LIBRAYLIB) is symbol('LoadAutomationEventList_pointerized'){ * }
our sub export-automation-event-list (AutomationEventList $list, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportAutomationEventList_pointerized'){ * }
our sub play-automation-event (AutomationEvent $event) is export is native(LIBRAYLIB) is symbol('PlayAutomationEvent_pointerized'){ * }
our sub term:<get-mouse-position> () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetMousePosition_pointerized'){ * }
our sub term:<get-mouse-delta> () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetMouseDelta_pointerized'){ * }
our sub term:<get-mouse-wheel-move-v> () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetMouseWheelMoveV_pointerized'){ * }
our sub get-touch-position (int32 $index) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetTouchPosition_pointerized'){ * }
our sub term:<get-gesture-drag-vector> () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetGestureDragVector_pointerized'){ * }
our sub term:<get-gesture-pinch-vector> () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetGesturePinchVector_pointerized'){ * }
our sub update-camera-pro (Camera $camera is rw, Vector3 $movement, Vector3 $rotation, num32 $zoom) is export is native(LIBRAYLIB) is symbol('UpdateCameraPro_pointerized'){ * }

our sub draw-pixel (int32 $posX, int32 $posY, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPixel_pointerized'){ * }
our sub draw-pixel-v (Vector2 $position, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPixelV_pointerized'){ * }
our sub draw-line (int32 $startPosX, int32 $startPosY, int32 $endPosX, int32 $endPosY, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLine_pointerized'){ * }
our sub draw-line-v (Vector2 $startPos, Vector2 $endPos, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLineV_pointerized'){ * }
our sub draw-line-ex (Vector2 $startPos, Vector2 $endPos, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLineEx_pointerized'){ * }
our sub draw-line-strip (Vector2 $points is rw, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLineStrip_pointerized'){ * }
our sub draw-line-bezier (Vector2 $startPos, Vector2 $endPos, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLineBezier_pointerized'){ * }
our sub draw-ellipse (int32 $centerX, int32 $centerY, num32 $radiusH, num32 $radiusV, Color $color) is export is native(LIBRAYLIB) is symbol('DrawEllipse_pointerized'){ * }
our sub draw-ellipse-lines (int32 $centerX, int32 $centerY, num32 $radiusH, num32 $radiusV, Color $color) is export is native(LIBRAYLIB) is symbol('DrawEllipseLines_pointerized'){ * }
our sub draw-ring (Vector2 $center, num32 $innerRadius, num32 $outerRadius, num32 $startAngle, num32 $endAngle, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRing_pointerized'){ * }
our sub draw-ring-lines (Vector2 $center, num32 $innerRadius, num32 $outerRadius, num32 $startAngle, num32 $endAngle, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRingLines_pointerized'){ * }

our sub draw-spline-linear (Vector2 $points is rw, int32 $pointCount, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineLinear_pointerized'){ * }
our sub draw-spline-basis (Vector2 $points is rw, int32 $pointCount, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineBasis_pointerized'){ * }
our sub draw-spline-catmull-rom (Vector2 $points is rw, int32 $pointCount, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineCatmullRom_pointerized'){ * }
our sub draw-spline-bezier-quadratic (Vector2 $points is rw, int32 $pointCount, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineBezierQuadratic_pointerized'){ * }
our sub draw-spline-bezier-cubic (Vector2 $points is rw, int32 $pointCount, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineBezierCubic_pointerized'){ * }
our sub draw-spline-segment-linear (Vector2 $p1, Vector2 $p2, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineSegmentLinear_pointerized'){ * }
our sub draw-spline-segment-basis (Vector2 $p1, Vector2 $p2, Vector2 $p3, Vector2 $p4, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineSegmentBasis_pointerized'){ * }
our sub draw-spline-segment-catmull-rom (Vector2 $p1, Vector2 $p2, Vector2 $p3, Vector2 $p4, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineSegmentCatmullRom_pointerized'){ * }
our sub draw-spline-segment-bezier-quadratic (Vector2 $p1, Vector2 $c2, Vector2 $p3, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineSegmentBezierQuadratic_pointerized'){ * }
our sub draw-spline-segment-bezier-cubic (Vector2 $p1, Vector2 $c2, Vector2 $c3, Vector2 $p4, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineSegmentBezierCubic_pointerized'){ * }
our sub get-spline-point-linear (Vector2 $startPos, Vector2 $endPos, num32 $t) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetSplinePointLinear_pointerized'){ * }
our sub get-spline-point-basis (Vector2 $p1, Vector2 $p2, Vector2 $p3, Vector2 $p4, num32 $t) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetSplinePointBasis_pointerized'){ * }
our sub get-spline-point-catmull-rom (Vector2 $p1, Vector2 $p2, Vector2 $p3, Vector2 $p4, num32 $t) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetSplinePointCatmullRom_pointerized'){ * }
our sub get-spline-point-bezier-quad (Vector2 $p1, Vector2 $c2, Vector2 $p3, num32 $t) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetSplinePointBezierQuad_pointerized'){ * }
our sub get-spline-point-bezier-cubic (Vector2 $p1, Vector2 $c2, Vector2 $c3, Vector2 $p4, num32 $t) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetSplinePointBezierCubic_pointerized'){ * }



our sub check-collision-lines (Vector2 $startPos1, Vector2 $endPos1, Vector2 $startPos2, Vector2 $endPos2, Vector2 $collisionPoint is rw) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionLines_pointerized'){ * }
our sub check-collision-point-line (Vector2 $point, Vector2 $p1, Vector2 $p2, int32 $threshold) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionPointLine_pointerized'){ * }


our sub load-texture-cubemap (Image $image, int32 $layout) returns TextureCubemap is export is native(LIBRAYLIB) is symbol('LoadTextureCubemap_pointerized'){ * }



our sub fade (Color $color, num32 $alpha) returns Color is export is native(LIBRAYLIB) is symbol('Fade_pointerized'){ * }
our sub color-to-int (Color $color) returns int32 is export is native(LIBRAYLIB) is symbol('ColorToInt_pointerized'){ * }
our sub color-normalize (Color $color) returns Vector4 is export is native(LIBRAYLIB) is symbol('ColorNormalize_pointerized'){ * }
our sub color-from-normalized (Vector4 $normalized) returns Color is export is native(LIBRAYLIB) is symbol('ColorFromNormalized_pointerized'){ * }
our sub color-to-hsv (Color $color) returns Vector3 is export is native(LIBRAYLIB) is symbol('ColorToHSV_pointerized'){ * }
our sub color-from-hsv (num32 $hue, num32 $saturation, num32 $value) returns Color is export is native(LIBRAYLIB) is symbol('ColorFromHSV_pointerized'){ * }
our sub color-tint (Color $color, Color $tint) returns Color is export is native(LIBRAYLIB) is symbol('ColorTint_pointerized'){ * }
our sub color-brightness (Color $color, num32 $factor) returns Color is export is native(LIBRAYLIB) is symbol('ColorBrightness_pointerized'){ * }
our sub color-contrast (Color $color, num32 $contrast) returns Color is export is native(LIBRAYLIB) is symbol('ColorContrast_pointerized'){ * }
our sub color-alpha (Color $color, num32 $alpha) returns Color is export is native(LIBRAYLIB) is symbol('ColorAlpha_pointerized'){ * }
our sub color-alpha-blend (Color $dst, Color $src, Color $tint) returns Color is export is native(LIBRAYLIB) is symbol('ColorAlphaBlend_pointerized'){ * }
our sub get-color (uint32 $hexValue) returns Color is export is native(LIBRAYLIB) is symbol('GetColor_pointerized'){ * }
our sub get-pixel-color (Pointer[void] $srcPtr, int32 $format) returns Color is export is native(LIBRAYLIB) is symbol('GetPixelColor_pointerized'){ * }
our sub set-pixel-color (Pointer[void] $dstPtr, Color $color, int32 $format) is export is native(LIBRAYLIB) is symbol('SetPixelColor_pointerized'){ * }

our sub gen-image-font-atlas (GlyphInfo $glyphs is rw, Rectangle $glyphRecs is rw, int32 $glyphCount, int32 $fontSize, int32 $padding, int32 $packMethod) returns Image is export is native(LIBRAYLIB) is symbol('GenImageFontAtlas_pointerized'){ * }


our sub draw-text (Str $text, int32 $posX, int32 $posY, int32 $fontSize, Color $color) is export is native(LIBRAYLIB) is symbol('DrawText_pointerized'){ * }
our sub draw-line3d (Vector3 $startPos, Vector3 $endPos, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLine3D_pointerized'){ * }
our sub draw-point3d (Vector3 $position, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPoint3D_pointerized'){ * }
our sub draw-triangle3d (Vector3 $v1, Vector3 $v2, Vector3 $v3, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangle3D_pointerized'){ * }
our sub draw-triangle-strip3d (Vector3 $points is rw, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleStrip3D_pointerized'){ * }
our sub draw-cube (Vector3 $position, num32 $width, num32 $height, num32 $length, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCube_pointerized'){ * }
our sub draw-cube-v (Vector3 $position, Vector3 $size, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCubeV_pointerized'){ * }
our sub draw-cube-wires (Vector3 $position, num32 $width, num32 $height, num32 $length, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCubeWires_pointerized'){ * }
our sub draw-cube-wires-v (Vector3 $position, Vector3 $size, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCubeWiresV_pointerized'){ * }
our sub draw-cylinder (Vector3 $position, num32 $radiusTop, num32 $radiusBottom, num32 $height, int32 $slices, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCylinder_pointerized'){ * }
our sub draw-cylinder-ex (Vector3 $startPos, Vector3 $endPos, num32 $startRadius, num32 $endRadius, int32 $sides, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCylinderEx_pointerized'){ * }
our sub draw-cylinder-wires (Vector3 $position, num32 $radiusTop, num32 $radiusBottom, num32 $height, int32 $slices, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCylinderWires_pointerized'){ * }
our sub draw-cylinder-wires-ex (Vector3 $startPos, Vector3 $endPos, num32 $startRadius, num32 $endRadius, int32 $sides, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCylinderWiresEx_pointerized'){ * }
our sub draw-capsule (Vector3 $startPos, Vector3 $endPos, num32 $radius, int32 $slices, int32 $rings, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCapsule_pointerized'){ * }
our sub draw-capsule-wires (Vector3 $startPos, Vector3 $endPos, num32 $radius, int32 $slices, int32 $rings, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCapsuleWires_pointerized'){ * }
our sub draw-plane (Vector3 $centerPos, Vector2 $size, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPlane_pointerized'){ * }
our sub draw-ray (Ray $ray, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRay_pointerized'){ * }

our sub draw-billboard (Camera $camera, Texture2D $texture, Vector3 $position, num32 $size, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawBillboard_pointerized'){ * }
our sub draw-billboard-rec (Camera $camera, Texture2D $texture, Rectangle $source, Vector3 $position, Vector2 $size, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawBillboardRec_pointerized'){ * }
our sub draw-billboard-pro (Camera $camera, Texture2D $texture, Rectangle $source, Vector3 $position, Vector3 $up, Vector2 $size, Vector2 $origin, num32 $rotation, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawBillboardPro_pointerized'){ * }
our sub update-mesh-buffer (Mesh $mesh, int32 $index, Pointer[void] $data, int32 $dataSize, int32 $offset) is export is native(LIBRAYLIB) is symbol('UpdateMeshBuffer_pointerized'){ * }
our sub unload-mesh (Mesh $mesh) is export is native(LIBRAYLIB) is symbol('UnloadMesh_pointerized'){ * }
our sub draw-mesh (Mesh $mesh, Material $material, Matrix $transform) is export is native(LIBRAYLIB) is symbol('DrawMesh_pointerized'){ * }
our sub draw-mesh-instanced (Mesh $mesh, Material $material, Matrix $transforms is rw, int32 $instances) is export is native(LIBRAYLIB) is symbol('DrawMeshInstanced_pointerized'){ * }
our sub get-mesh-bounding-box (Mesh $mesh) returns BoundingBox is export is native(LIBRAYLIB) is symbol('GetMeshBoundingBox_pointerized'){ * }
our sub export-mesh (Mesh $mesh, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportMesh_pointerized'){ * }
our sub export-mesh-as-code (Mesh $mesh, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportMeshAsCode_pointerized'){ * }

our sub gen-mesh-plane (num32 $width, num32 $length, int32 $resX, int32 $resZ) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshPlane_pointerized'){ * }
our sub gen-mesh-cube (num32 $width, num32 $height, num32 $length) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshCube_pointerized'){ * }
our sub gen-mesh-cylinder (num32 $radius, num32 $height, int32 $slices) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshCylinder_pointerized'){ * }
our sub gen-mesh-cone (num32 $radius, num32 $height, int32 $slices) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshCone_pointerized'){ * }
our sub gen-mesh-torus (num32 $radius, num32 $size, int32 $radSeg, int32 $sides) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshTorus_pointerized'){ * }
our sub gen-mesh-knot (num32 $radius, num32 $size, int32 $radSeg, int32 $sides) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshKnot_pointerized'){ * }
our sub term:<load-material-default> () returns Material is export is native(LIBRAYLIB) is symbol('LoadMaterialDefault_pointerized'){ * }
our sub unload-material (Material $material) is export is native(LIBRAYLIB) is symbol('UnloadMaterial_pointerized'){ * }
our sub set-material-texture (Material $material is rw, int32 $mapType, Texture2D $texture) is export is native(LIBRAYLIB) is symbol('SetMaterialTexture_pointerized'){ * }

our sub unload-model-animation (ModelAnimation $anim) is export is native(LIBRAYLIB) is symbol('UnloadModelAnimation_pointerized'){ * }
our sub get-ray-collision-sphere (Ray $ray, Vector3 $center, num32 $radius) returns RayCollision is export is native(LIBRAYLIB) is symbol('GetRayCollisionSphere_pointerized'){ * }
our sub get-ray-collision-box (Ray $ray, BoundingBox $box) returns RayCollision is export is native(LIBRAYLIB) is symbol('GetRayCollisionBox_pointerized'){ * }
our sub get-ray-collision-mesh (Ray $ray, Mesh $mesh, Matrix $transform) returns RayCollision is export is native(LIBRAYLIB) is symbol('GetRayCollisionMesh_pointerized'){ * }
our sub get-ray-collision-triangle (Ray $ray, Vector3 $p1, Vector3 $p2, Vector3 $p3) returns RayCollision is export is native(LIBRAYLIB) is symbol('GetRayCollisionTriangle_pointerized'){ * }
our sub get-ray-collision-quad (Ray $ray, Vector3 $p1, Vector3 $p2, Vector3 $p3, Vector3 $p4) returns RayCollision is export is native(LIBRAYLIB) is symbol('GetRayCollisionQuad_pointerized'){ * }
our sub load-wave (Str $fileName) returns Wave is export is native(LIBRAYLIB) is symbol('LoadWave_pointerized'){ * }
our sub load-wave-from-memory (Str $fileType, uint8 $fileData is rw, int32 $dataSize) returns Wave is export is native(LIBRAYLIB) is symbol('LoadWaveFromMemory_pointerized'){ * }

our sub unload-wave (Wave $wave) is export is native(LIBRAYLIB) is symbol('UnloadWave_pointerized'){ * }
our sub export-wave (Wave $wave, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportWave_pointerized'){ * }
our sub export-wave-as-code (Wave $wave, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportWaveAsCode_pointerized'){ * }
our sub wave-copy (Wave $wave) returns Wave is export is native(LIBRAYLIB) is symbol('WaveCopy_pointerized'){ * }
our sub load-wave-samples (Wave $wave) returns num32 is export is native(LIBRAYLIB) is symbol('LoadWaveSamples_pointerized'){ * }
our sub load-music-stream (Str $fileName) returns Music is export is native(LIBRAYLIB) is symbol('LoadMusicStream_pointerized'){ * }
our sub load-music-stream-from-memory (Str $fileType, uint8 $data is rw, int32 $dataSize) returns Music is export is native(LIBRAYLIB) is symbol('LoadMusicStreamFromMemory_pointerized'){ * }
our sub unload-music-stream (Music $music) is export is native(LIBRAYLIB) is symbol('UnloadMusicStream_pointerized'){ * }
our sub play-music-stream (Music $music) is export is native(LIBRAYLIB) is symbol('PlayMusicStream_pointerized'){ * }
our sub update-music-stream (Music $music) is export is native(LIBRAYLIB) is symbol('UpdateMusicStream_pointerized'){ * }
our sub stop-music-stream (Music $music) is export is native(LIBRAYLIB) is symbol('StopMusicStream_pointerized'){ * }
our sub pause-music-stream (Music $music) is export is native(LIBRAYLIB) is symbol('PauseMusicStream_pointerized'){ * }
our sub resume-music-stream (Music $music) is export is native(LIBRAYLIB) is symbol('ResumeMusicStream_pointerized'){ * }
our sub seek-music-stream (Music $music, num32 $position) is export is native(LIBRAYLIB) is symbol('SeekMusicStream_pointerized'){ * }
our sub set-music-volume (Music $music, num32 $volume) is export is native(LIBRAYLIB) is symbol('SetMusicVolume_pointerized'){ * }
our sub set-music-pitch (Music $music, num32 $pitch) is export is native(LIBRAYLIB) is symbol('SetMusicPitch_pointerized'){ * }
our sub set-music-pan (Music $music, num32 $pan) is export is native(LIBRAYLIB) is symbol('SetMusicPan_pointerized'){ * }
our sub get-music-time-length (Music $music) returns num32 is export is native(LIBRAYLIB) is symbol('GetMusicTimeLength_pointerized'){ * }
our sub get-music-time-played (Music $music) returns num32 is export is native(LIBRAYLIB) is symbol('GetMusicTimePlayed_pointerized'){ * }
our sub load-audio-stream (uint32 $sampleRate, uint32 $sampleSize, uint32 $channels) returns AudioStream is export is native(LIBRAYLIB) is symbol('LoadAudioStream_pointerized'){ * }
our sub unload-audio-stream (AudioStream $stream) is export is native(LIBRAYLIB) is symbol('UnloadAudioStream_pointerized'){ * }
our sub update-audio-stream (AudioStream $stream, Pointer[void] $data, int32 $frameCount) is export is native(LIBRAYLIB) is symbol('UpdateAudioStream_pointerized'){ * }
our sub play-audio-stream (AudioStream $stream) is export is native(LIBRAYLIB) is symbol('PlayAudioStream_pointerized'){ * }
our sub pause-audio-stream (AudioStream $stream) is export is native(LIBRAYLIB) is symbol('PauseAudioStream_pointerized'){ * }
our sub resume-audio-stream (AudioStream $stream) is export is native(LIBRAYLIB) is symbol('ResumeAudioStream_pointerized'){ * }
our sub stop-audio-stream (AudioStream $stream) is export is native(LIBRAYLIB) is symbol('StopAudioStream_pointerized'){ * }
our sub set-audio-stream-volume (AudioStream $stream, num32 $volume) is export is native(LIBRAYLIB) is symbol('SetAudioStreamVolume_pointerized'){ * }
our sub set-audio-stream-pitch (AudioStream $stream, num32 $pitch) is export is native(LIBRAYLIB) is symbol('SetAudioStreamPitch_pointerized'){ * }
our sub set-audio-stream-pan (AudioStream $stream, num32 $pan) is export is native(LIBRAYLIB) is symbol('SetAudioStreamPan_pointerized'){ * }
our sub set-audio-stream-callback (AudioStream $stream, &audio-callback (Pointer[void] $bufferData, uint32 $frames)) is export is native(LIBRAYLIB) is symbol('SetAudioStreamCallback_pointerized'){ * }
our sub attach-audio-stream-processor (AudioStream $stream, &audio-callback (Pointer[void] $bufferData, uint32 $frames)) is export is native(LIBRAYLIB) is symbol('AttachAudioStreamProcessor_pointerized'){ * }
our sub detach-audio-stream-processor (AudioStream $stream, &audio-callback (Pointer[void] $bufferData, uint32 $frames)) is export is native(LIBRAYLIB) is symbol('DetachAudioStreamProcessor_pointerized'){ * }
####### Allocation functions ########
