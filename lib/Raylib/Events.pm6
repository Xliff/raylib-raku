use v6.c;

my %Events;

use Raylib::Raw::Events;

class Raylib::Events {

  method add-event( *%event ) {
    %Events.append: %event;
  }

  method check-events {
    start %Events<window-ready>()
      if %Events<window-ready>:exists       && is-window-ready;

    start %Events<window-fullscreen>()
      if %Events<window-fullscreen>:exists  && is-window-fullscreen;

    start %Events<window-hidden>()
      if %Events<window-hidden>:exists      && is-window-hidden;

    start %Events<window-minimized>()
      if %Events<window-minimized>:exists   && is-window-minimized;

    start %Events<window-maximized>()
      if %Events<window-maximized>:exists   && is-window-maximized;

    start %Events<window-focused>()
      if %Events<window-focused>:exists     && is-window-focused;

    start %Events<window-resized>()
      if %Events<window-resized>:exists     && is-window-resized;

    start %Events<cursor-hidden>()
      if %Events<cursor-hidden>:exists      && is-cursor-hidden;

    start %Events<cursor-on-screen>()
      if %Events<cursor-on-screen>:exists   && is-cursor-on-screen;

    start %Events<file-dropped>()
      if %Events<file-dropped>:exists       && is-file-dropped;

    start %Events<audio-device-ready>()
      if %Events<audio-device-ready>:exists && is-audio-device-ready;

    for <
      path-file
      key-pressed-repeat      key-down                key-released
      key-up
      gamepad-available       gamepad-button-pressed gamepad-button-down
      gamepad-button-released gamepad-button-up
      mouse-button-pressed    mouse-button-down      mouse-button-released
      mouse-button-up
    >.hyper -> $e {
      for %Events{$e}.keys.grep( * ne 'default') -> $e { {
        if %Events<key-pressed>{$_}:exists and is-key-pressed( ::($_) )
          start %Events{$e}{$_}();
          next;
        }
      }

      my $*v = $_;

      start %Events{$e}<default>() if %Events{$e}<default>
    }

  }

  method delete-event ( *@events ) {
    %Events{$_}:delete for @events;
  }

}
