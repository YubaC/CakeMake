#!/usr/bin/env make
#
# YYYY/XXX 	<<=== The IOCCC Judges will replace this line

#############################
# shell used by this Makefile
#############################

SHELL= bash


#######################
# common tool locations
#######################
#
# XXX - The IOCCC judges will remove this line and uncomment the next line later
# include ../../var.mk var.mk

# XXX - for now, set some common tool locations
# XXX - once var.mk is in use, the IOCCC judges will remove the section below
CC= cc
CHMOD= chmod
CLANG= clang
CLANG_FORMAT= clang-format
CPP= cpp
GCC= gcc
MV= mv
RM= rm
RMDIR= rmdir
TRUE= true


#####################
# C compiler settings
#####################

# Common C compiler warnings to silence
#
# Example: CSILENCE= -Wno-int-conversion
#
CSILENCE= -Wno-poison-system-directories -Wno-unsafe-buffer-usage -Wno-overriding-deployment-version \
          -Wno-main -Wno-shift-op-parentheses \
          -Wno-gnu-conditional-omitted-operand -Wno-newline-eof

# Attempt to silence unknown warning options
#
CUNKNOWN= -Wno-unknown-warning-option

# Common C compiler warning flags
#
# NOTE: The addition of -pedantic to CWARN is a challenge that
#       You may wish to avoid if it proves too problematic.
#       There is NO penalty for removing -pedantic from CWARN.
#
CWARN= -Wall -Wextra -pedantic ${CSILENCE} ${CUNKNOWN}

# Compiler standard
#
# XXX - Your IOCCC submission is free to require older C standards, or
# XXX - even not specify a C standard at all.  We suggest trying
# XXX - for -std=gnu17, but that is not a requirement and you won't
# XXX - be penalized if you name CSTD empty or use another
# XXX - well known and reasonably widely implemented C standard.
#
CSTD= -std=gnu17

# Compiler bit architecture
#
# Example for 32-bitness: ARCH= -m32
# Example for 64-bitness: ARCH= -m64
#
# NOTE: Normally one should NOT specify a specific architecture.
#
ARCH=

# Defines that are needed to compile
#
# Example: -Dfoo -Dbar=baz
#
CDEFINE= -DM="\"${MESSAGE}\""

# Include files that are needed to compile
#
# Example: CINCLUDE= -include stdio.h
#
CINCLUDE=

# Other flags to pass to the C compiler
#
# Example: COTHER= -fno-math-errno
#
COTHER=

# Optimization
#
# NOTE: Feel free to change the level of compiler optimization.
#       The "-O3" is just a friendly default you might wish to try.
#
# Example: OPT= -O0 -g
#
OPT= -O2

# Default flags for ANSI C compilation
#
CFLAGS= ${CSTD} ${CWARN} ${ARCH} ${CDEFINE} ${CINCLUDE} ${COTHER} ${OPT}

# Libraries needed to build
#
# Example: LDFLAGS= -lncurses -lm
#
LDFLAGS=

# C compiler to use
#
# NOTE: The IOCCC Judges recommend you leave CC as just "cc"
#       and NOT set it to clang, or gcc, or something else
#       unless you have a STRONG reason to do so.
#
#       Setting CC to something other than "cc" makes your
#       code less portable to those who do not have your
#       particular C compiler.  **hint**
#
#       If you want to test your code with a particular C compiler,
#       use the make command line.  For example:
#
#           make all CC=clang
#           make all CC=gcc
#
CC= cc

# Compiler add-ons or replacements for clang only
#
ifeq "$(findstring $(CLANG),${CC})" "$(CLANG)"
#
# NOTE: This code is only invoked when CC contains "clang"
#       such as when you use the make command lines like:
#
#           make all CC=clang
#           make all CC=clang-mp-12
#
CSILENCE+=
#
CWARN+= -Weverything
#
endif

# Specific add-ons or replacements for gcc only
#
ifeq "$(findstring $(GCC),${CC})" "$(GCC)"
#
# NOTE: This code is only invoked when CC contains "gcc"
#       such as when you use the make command lines like:
#
#    make all CC=gcc
#    make all CC=gcc-15
#
CSILENCE+=
#
CWARN+=
#
endif


###########################################
# Special Makefile variables for this entry
###########################################

#ENTRY= XXX - The IOCCC judges will change this line later
PROG= prog
#
OBJ= ${PROG}.o
TARGET= ${PROG}

# list any data files supplied with your submission
#
# Example: DATA= curds whey
#
DATA=

# NOTE: Add any new Makefile variables your code might need below.
#
# Example: WIDTH= 120
#

# birthday message to compile in
MESSAGE= HAPPY BIRTHDAY CATIL

#################
# build the entry
#################

all: data ${TARGET}
	@${TRUE}

.PHONY: all data everything clean clobber

${PROG}: ${PROG}.c
	${CC} ${CFLAGS} ${PROG}.c -o $@ ${LDFLAGS}

# data files
#
data: ${DATA}
	@${TRUE}

# both all and alt
#
everything: all
	@${TRUE}


###############
# utility rules
###############
#
clean:
	${RM} -f ${OBJ}

clobber: clean
	@# XXX - put additional ${RM} -f or ${RM} -rf lines so that
	@#       "make clobber" restores things to their submission state.
	${RM} -f ${TARGET}
	${RM} -rf *.dSYM


######################################
# optional include of 1337 hacker rulz
######################################

-include 1337.mk ../1337.mk ../../1337.mk