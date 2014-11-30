# Makefile for VIKit

VIBuildProject := VIBuildProject
VIQueryVersion := VIQueryVersion
VIQueryBuildSpecs := VIQueryBuildSpecs
VISnipDiagram := VISnipDiagram

BINARY_DIR := bin
VIPROJECT_DIR := VIProject
VIVENDOR_DIR := VIVendor
VISNIPPET_DIR := $(VIVENDOR_DIR)/PngSnippet
VISNIPPET_SUPPORT_DIR := $(VISNIPPET_DIR)/PSSupport

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
   $(BINARY_DIR)/$(VISnipDiagram).sh \
   $(BINARY_DIR)/$(VISnipDiagram).vi \

CALLABLE_VIPROJECT_FILES := \
   $(BINARY_DIR)/$(VIPROJECT_DIR)/VIProject.lvlib \
   $(BINARY_DIR)/$(VIPROJECT_DIR)/VPBuildSpecInformation.ctl \
   $(BINARY_DIR)/$(VIPROJECT_DIR)/VPRebuild.vi \
   $(BINARY_DIR)/$(VIPROJECT_DIR)/VPTargetBuildSpecs.ctl \

CALLABLE_VIVENDOR_FILES := \
   $(BINARY_DIR)/$(VIVENDOR_DIR)/VIVendor.lvlib \
   
CALLABLE_VISNIPPET_FILES := \
   $(BINARY_DIR)/$(VISNIPPET_DIR)/VVPngSnippet.lvlib \
   $(BINARY_DIR)/$(VISNIPPET_DIR)/PSCreateSnippet.vi \

CALLABLE_VISNIPPET_SUPPORT_FILES := \
   $(BINARY_DIR)/$(VISNIPPET_SUPPORT_DIR)/PSCalculatePngChecksum.vi \
   $(BINARY_DIR)/$(VISNIPPET_SUPPORT_DIR)/PSCreatePngChunk.vi \
   $(BINARY_DIR)/$(VISNIPPET_SUPPORT_DIR)/PSCreatePngTextChunk.vi \
   $(BINARY_DIR)/$(VISNIPPET_SUPPORT_DIR)/PSGetPngChunks.vi \

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
	@mkdir -p "$(DEST)/$(VISNIPPET_SUPPORT_DIR)"
	@cp $(CALLABLE_VIVENDOR_FILES) "$(DEST)/$(VIVENDOR_DIR)"
	@cp $(CALLABLE_VISNIPPET_FILES) "$(DEST)/$(VISNIPPET_DIR)"
	@cp $(CALLABLE_VISNIPPET_SUPPORT_FILES) "$(DEST)/$(VISNIPPET_SUPPORT_DIR)"

.PHONY: clean
clean:
	rm -rfv *.exe
	rm -rfv *.dll
	rm -rfv *.ini
