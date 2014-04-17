# Makefile.

# Tool configuration.
#

# Fortran compiler.
FORTRAN := gfortran

# Input and output files.
#

OUTPUT := relpair

# Pseudo targets.
#

.PHONY: all distclean

# Targets.
#

all: $(OUTPUT)

distclean:
	rm $(OUTPUT)

%: %.f
	$(FORTRAN) -o $@ $<
