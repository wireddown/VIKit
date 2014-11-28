# Makefile for VIKit

VIBuildProject := VIBuildProject
VIQueryVersion := VIQueryVersion
VIQueryBuildSpecs := VIQueryBuildSpecs

BINARY_DIR := bin
VIPROJECT_DIR := VIProject

VIKIT_DLL := VIKit.dll

COMPILED_EXECUTABLE_FILES := \
   $(VIQueryVersion).exe \
   $(VIQueryBuildSpecs).exe \

SETTINGS_FILES := \
   $(BINARY_DIR)/$(VIQueryBuildSpecs).ini \

EXECUTABLE_FILES := \
   $(BINARY_DIR)/VIHost.lvlib \
   $(BINARY_DIR)/VHRunVI.vi \
   $(BINARY_DIR)/VIQueryBuildSpecs.vi \
   $(BINARY_DIR)/$(VIBuildProject).sh \
   $(BINARY_DIR)/$(VIBuildProject).vi \

CALLABLE_VIPROJECT_FILES := \
   $(BINARY_DIR)/$(VIPROJECT_DIR)/VIProject.lvlib \
   $(BINARY_DIR)/$(VIPROJECT_DIR)/VPBuildSpecInformation.ctl \
   $(BINARY_DIR)/$(VIPROJECT_DIR)/VPRebuild.vi \
   $(BINARY_DIR)/$(VIPROJECT_DIR)/VPTargetBuildSpecs.ctl \

CC_FLAGS := -std=c99
LINK_VIKIT_FLAGS := -lVIKit -LVIKit

all: $(COMPILED_EXECUTABLE_FILES)
	@cp VIKit/$(VIKIT_DLL) .

%.exe : %.c
	gcc $(CC_FLAGS) $< -o $@ $(LINK_VIKIT_FLAGS)

install: $(COMPILED_EXECUTABLE_FILES) $(SETTINGS_FILES) $(EXECUTABLE_FILES) $(VIKIT_DLL) $(CALLABLE_VIPROJECT_FILES)
	@ls "$(DEST)" >/dev/null
	@cp $(COMPILED_EXECUTABLE_FILES) $(SETTINGS_FILES) $(EXECUTABLE_FILES) $(VIKIT_DLL) "$(DEST)"
	@mkdir -p "$(DEST)/$(VIPROJECT_DIR)"
	@cp $(CALLABLE_VIPROJECT_FILES) "$(DEST)/$(VIPROJECT_DIR)"

.PHONY: clean
clean:
	rm -rfv *.exe
	rm -rfv *.dll
	rm -rfv *.ini
