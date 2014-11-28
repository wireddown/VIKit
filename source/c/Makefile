# Makefile for VIKit

VIBuildProject := VIBuildProject
VIQueryVersion := VIQueryVersion
VIQueryBuildSpecs := VIQueryBuildSpecs

VIPROJECT_DIR := VIProject

COMPILED_EXECUTABLE_FILES := \
   $(VIQueryVersion).exe \
   $(VIQueryBuildSpecs).exe \

SOURCE_FILES := \
   $(VIQueryVersion).c \
   $(VIQueryBuildSpecs).c \

LABVIEW_FILES := \
   VIKit/extcode.h \
   VIKit/fundtypes.h \
   VIKit/hosttype.h \
   VIKit/ILVDataInterface.h \
   VIKit/ILVTypeInterface.h \
   VIKit/lv_epilog.h \
   VIKit/lv_prolog.h \
   VIKit/platdefines.h \
   VIKit/VIKit.dll \
   VIKit/VIKit.h \

EXECUTABLE_FILES := \
   bin/VIHost.lvlib \
   bin/VHRunVI.vi \
   bin/VIQueryBuildSpecs.vi \
   bin/$(VIBuildProject).sh \
   bin/$(VIBuildProject).vi \

CALLABLE_VIPROJECT_FILES := \
   bin/$(VIPROJECT_DIR)/VIProject.lvlib \
   bin/$(VIPROJECT_DIR)/VPBuildSpecInformation.ctl \
   bin/$(VIPROJECT_DIR)/VPCutProjectDependencies.vi \
   bin/$(VIPROJECT_DIR)/VPRebuild.vi \
   bin/$(VIPROJECT_DIR)/VPTargetBuildSpecs.ctl \


CC_FLAGS := -std=c99
LINK_VIKIT_FLAGS := -lVIKit -LVIKit

all: $(COMPILED_EXECUTABLE_FILES) $(SOURCE_FILES) $(LABVIEW_FILES)
	@cp VIKit/VIKit.dll .

%.exe : %.c
	gcc $(CC_FLAGS) $< -o $@ $(LINK_VIKIT_FLAGS)

install: $(COMPILED_EXECUTABLE_FILES) $(EXECUTABLE_FILES) $(CALLABLE_VIPROJECT_FILES) VIKit.dll
	@cp $(COMPILED_EXECUTABLE_FILES) $(EXECUTABLE_FILES) VIKit.dll "$(DEST)"
	@mkdir -p "$(DEST)/$(VIPROJECT_DIR)"
	@cp $(CALLABLE_VIPROJECT_FILES) "$(DEST)/$(VIPROJECT_DIR)"

.PHONY: clean
clean:
	rm -rfv *.exe
	rm -rfv *.dll
	rm -rfv *.ini
