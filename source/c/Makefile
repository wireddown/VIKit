# Makefile for VIKit

VIQueryVersion := VIQueryVersion

EXECUTABLE_FILES := \
   $(VIQueryVersion).exe \

SOURCE_FILES := \
   $(VIQueryVersion).c \

LABVIEW_FILES := \
   VIKit/extcode.h \
   VIKit/fundtypes.h \
   VIKit/hosttype.h \
   VIKit/ILVDataInterface.h \
   VIKit/ILVTypeInterface.h \
   VIKit/ILVTypeInterface.h \
   VIKit/lv_epilog.h \
   VIKit/lv_prolog.h \
   VIKit/platdefines.h \
   VIKit/VIKit.dll \
   VIKit/VIKit.h \

CC_FLAGS := -std=c99
LINK_VIKIT_FLAGS := -lVIKit -LVIKit

all: $(EXECUTABLE_FILES) $(SOURCE_FILES) $(LABVIEW_FILES)
	@cp VIKit/VIKit.dll .

%.exe : %.c
	gcc $(CC_FLAGS) $< -o $@ $(LINK_VIKIT_FLAGS)

.PHONY: clean
clean:
	rm -rfv *.exe
	rm -rfv *.dll
	rm -rfv *.ini
