# 🎂 CakeMake

> _CMake_ — except here it means _C cake make_.

A deliberately obfuscated 255-byte C program that bakes a small birthday cake
out of ASCII art. The middle of the cake is iced with the date the program was
compiled (via the standard `__DATE__` macro) and the bottom band carries a
message compiled in with `-DM=...`. No string literal appears anywhere in the
source.

This is my entry for the 29th International Obfuscated C Code Contest
(IOCCC29, 2025).

## Build & run

```sh
make
./prog
```

To put a different message on the cake:

```sh
cc -DM="\"HAPPY BIRTHDAY ALICE\"" prog.c -o prog
```

`M` is required — without it the program will not compile. The Makefile
supplies a default through the `MESSAGE` variable.

## Full write-up

The complete write-up lives in [`remarks.md`](remarks.md): the overview, the
output layout, the `M` macro, the obfuscation and implementation notes, the
deliberately chosen 255-byte size, and the story behind the name.

And yes — run `./prog` before reading the source. The surprise is the point.
