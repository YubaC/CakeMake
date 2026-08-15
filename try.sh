#!/usr/bin/env bash
#
# try.sh - YYYY/XXX 

# make sure CC is set
#
[[ -z "$CC" ]] && CC="cc"

# make sure the program has been built
#
if ! make CC="$CC" >/dev/null; then
    echo "Build failed." >&2
    exit 1
fi

# check that the program exists and is executable
#
if [[ ! -x ./prog ]]; then
    echo "Error: ./prog not found or not executable after build." >&2
    exit 1
fi

# clear the screen
#
clear

# try the program
#
echo
./prog