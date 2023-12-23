.PHONY: clean test
CC = gcc
RAKU = /home/cbwood/.rakubrew/versions/moar-blead/install/bin/rakudo
CFLAGS =-shared $$(pkg-config --libs --cflags raylib)

all: raylib-raku

raylib-raku:
	$(CC) -g -fPIC resources/raylib_allocations.c resources/raylib_pointerized_wrapper.c $(CFLAGS) -o resources/libraries/libraylib.so

install:
	$(RAKU) configure.raku --install