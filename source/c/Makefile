# Makefile data for VIKit C executables

VIQueryVersion := VIQueryVersion
VIQueryBuildSpecs := VIQueryBuildSpecs

LABVIEW_RTE_VERSION := 2013
VIKIT_DLL := VIKit.dll

COMPILED_EXECUTABLE_FILES := \
   $(VIQueryVersion).exe \
   $(VIQueryBuildSpecs).exe \

SETTINGS_FILES := \
   $(VIQueryBuildSpecs).ini

CC_FLAGS := -std=c99
LINK_VIKIT_FLAGS := -lVIKit -LVIKit

ifeq ($(PROGRAMFILES),)
   LABVIEW_PATH := $(PROGRAMFILES) (x86)\National Instruments\LabVIEW $(LABVIEW_RTE_VERSION)
else
   LABVIEW_PATH := $(PROGRAMFILES)\National Instruments\LabVIEW $(LABVIEW_RTE_VERSION)
endif

SAFE_LABVIEW_PATH := $(strip $(subst \,\\\\,$(LABVIEW_PATH)))

# Makefile rules for VIKit C executables

all : $(COMPILED_EXECUTABLE_FILES) $(SETTINGS_FILES)
	@cp VIKit/$(VIKIT_DLL) .

%.exe : %.c
	gcc $(CC_FLAGS) $< -o $@ $(LINK_VIKIT_FLAGS)

$(VIQueryBuildSpecs).ini :
	@ls "$(LABVIEW_PATH)" > /dev/null
	@echo libdir=\"$(SAFE_LABVIEW_PATH)\" > $@

clean : clean-c

clean-c :
	rm -rf $(COMPILED_EXECUTABLE_FILES)
	rm -rf $(VIKIT_DLL)
	rm -rf $(SETTINGS_FILES)

