# Makefile.

# Tool configuration.
#

# Fortran compiler.
FORTRAN := gfortran

# Input and output files.
#

OUTPUT := relpair
VERSION := v2.0.1

# Pseudo targets.
#

.PHONY: all distclean

# Targets.
#

all: $(OUTPUT)

distclean:
	rm $(OUTPUT)

%: %.$(VERSION).f
	$(FORTRAN) -o $@ $<
