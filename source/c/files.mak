# Makefile data for VIKit C executables

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