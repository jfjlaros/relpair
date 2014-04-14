# Makefile.

# Tool configuration.
#

# RELPAIR.
RELPAIR := ../../relpair
MKRPCTL := sh ../mkrpctl.sh

# Input and output files.
#

IN := ped
TEMP := ctl out.detail
OUT := out
ERR := fort.1162293296

INPUT := $(basename $(shell ls *.$(IN)))
INTERMEDIATE := $(foreach I, $(TEMP), $(addsuffix .$I, $(INPUT)))
OUTPUT := $(foreach I, $(OUT), $(addsuffix .$I, $(INPUT)))

# Pseudo targets.
#

.PHONY: all clean distclean

# Targets.
#

all: $(OUTPUT)

clean:
	rm -f $(INTERMEDIATE) $(ERR)

distclean: clean
	rm -f $(OUTPUT)

%.ctl: %.loc %.ped
	$(MKRPCTL) $* > $@

%.out.stdout: %.ctl %.loc %.ped
	echo $< | $(RELPAIR) > $@

%.out.detail: %.out.stdout
	@

%.out: %.out.detail
	@
