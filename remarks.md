### Overview
This program produces a small textual artifact associated with a 
recurring annual occasion.
At first glance the code appears to perform calculations related to
dates or calendar formatting. Several constants and expressions hint
at month-like arithmetic and offsets. The program also makes use of
the standard `__DATE__` macro.
Running the program before studying the code is strongly recommended.

### How to build and run
Build using the provided Makefile:

``` <!---sh-->
    make
```

This produces an executable named `prog`. Run it:

``` <!---sh-->
    ./prog
```

To customize the repeating message, define `M` at compile time:

``` <!---sh-->
    cc -DM="\"HAPPY BIRTHDAY ALICE\"" prog.c -o prog
```

If `M` is not defined, the program will not compile.
The Makefile provides a default definition via the `MESSAGE` variable,
which can be changed there directly.

### Output
The output renders a small layered structure in ASCII characters,
with three distinct regions from top to bottom.
The topmost region is an unbordered row of repeated characters.
The middle region draws from the compiler-provided `__DATE__` macro,
tiling it horizontally to fill a fixed-width framed band.
If the program is compiled on a specific date — say, a birthday —
that date will appear here, embedded in the output naturally and
without any hardcoded string in the source.
The lowermost framed band uses the string supplied via `M`,
also tiled to fill the width, followed by a solid bottom border.

### The macro M
`M` supplies a short text pattern that repeats across the lower band.
The repetition is intentional. It is inspired by the continuous
printed motifs found on commercial gift ribbon and wrapping paper,
where a short phrase tiles seamlessly across the surface.
This also makes the program naturally reusable. To pass it on as a
gift for someone else, simply recompile with a new `-DM=` value and
on the appropriate date.

### Obfuscation notes
Several elements in the source intentionally resemble date or
calendar arithmetic. Examples include:
- constants such as `30` and `15`
- variables that suggest calendar offsets
- bit manipulation that superficially resembles month-boundary logic

This is deliberate misdirection.
No string literal appears anywhere in the source. All character
values are derived through arithmetic, bit manipulation, and the
`__DATE__` macro. The purpose of the program is therefore not
apparent from casual inspection or `strings(1)`.

There is an additional reason for the absence of string literals
beyond mere style. This program was written as a surprise. The
intended recipient is a programmer who will likely read the source
before running it. A stray quoted string would give the game away
immediately. Keeping all character values in arithmetic form is
therefore load-bearing misdirection, not decoration.

By the same token, the overall appearance of the code — date
arithmetic, calendar constants, `__DATE__` — is designed so that
a casual reader forms a plausible but wrong hypothesis about what
the program does. The `strings(1)` output is deliberately sterile.
The true output is meant to be a surprise.

### Implementation notes
The program uses recursive invocation of `main` as its sole
iteration mechanism. Each call advances a counter and emits
exactly one character via `putchar`.
Character selection is performed by a single deeply nested
conditional expression. Branches produce characters derived from:
- computed integer constants
- the `__DATE__` macro
- the macro `M`

### Code size
The source was arranged to occupy exactly 255 bytes.
This value was chosen deliberately. It is not a coincidence.

### The name
The project is named **CMake**.
It resembles the well-known cross-platform build tool. Here it
means something else entirely: _C cake make_.

The Makefile completes the joke by greeting the builder with:

    Happy birthday.
    Eggs, flour, and sugar are ready.
    Now make the cake yourself!
