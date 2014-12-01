# Makefile for VIKit C executables

include c-files.mak

CC_FLAGS := -std=c99
LINK_VIKIT_FLAGS := -lVIKit -LVIKit

all: $(COMPILED_EXECUTABLE_FILES)
	@cp VIKit/$(VIKIT_DLL) .

%.exe : %.c
	gcc $(CC_FLAGS) $< -o $@ $(LINK_VIKIT_FLAGS)

clean:
	rm -rfv *.exe
	rm -rfv *.dll
	rm -rfv *.ini
