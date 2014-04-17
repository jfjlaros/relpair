# Makefile.

# Tool configuration.
#

# RELPAIR.
RELPAIR_PATH := /usr/local/relpair/relpair-2.0.2
RELPAIR := $(RELPAIR_PATH)/relpair
MKRPCTL := sh $(RELPAIR_PATH)/mkrpctl.sh

# Input and output files.
#

IN := ped
TEMP := ctl
OUT := out out.detail
ERR := fort.1162293296 core

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
