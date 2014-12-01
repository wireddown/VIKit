# Makefile for VIKit distribution

LABVIEW_RTE_VERSION := 2013

VIKIT_TARBALL := VIKit.tar.gz
VIKIT_STAGING_DIR := VIKit
VIKIT_LIB_DIR := VIKit
VIKIT_BIN_DIR := bin
VIPROJECT_DIR := VIProject
VIVENDOR_DIR := VIVendor
VISNIPPET_DIR := $(VIVENDOR_DIR)/PngSnippet
VISNIPPET_SUPPORT_DIR := $(VISNIPPET_DIR)/PSSupport

SCRIPT_SOURCE_FILES := \
   $(shell find ../source/bash -type f)

C_SOURCE_FILES := \
   $(shell find ../source/c -type f)

LABVIEW_SOURCE_FILES := \
   $(shell find ../source/labview -type f)

CALLABLE_LABVIEW_FILES := \
   ../source/labview/VIBuildProject.vi \
   ../source/labview/VIHost/VIHost.lvlib \
   ../source/labview/VIHost/VHRunVI.vi \
   ../source/labview/VISnipDiagram.vi \
   ../source/labview/VIQueryBuildSpecs.vi \

CALLABLE_VIPROJECT_FILES := \
   ../source/labview/$(VIPROJECT_DIR)/VIProject.lvlib \
   ../source/labview/$(VIPROJECT_DIR)/VPBuildSpecInformation.ctl \
   ../source/labview/$(VIPROJECT_DIR)/VPRebuild.vi \
   ../source/labview/$(VIPROJECT_DIR)/VPTargetBuildSpecs.ctl \

CALLABLE_VIVENDOR_FILES := \
   ../source/labview/$(VIVENDOR_DIR)/VIVendor.lvlib \
   
CALLABLE_VISNIPPET_FILES := \
   ../source/labview/$(VISNIPPET_DIR)/VVPngSnippet.lvlib \
   ../source/labview/$(VISNIPPET_DIR)/PSCreateSnippet.vi \

CALLABLE_VISNIPPET_SUPPORT_FILES := \
   ../source/labview/$(VISNIPPET_SUPPORT_DIR)/PSCalculatePngChecksum.vi \
   ../source/labview/$(VISNIPPET_SUPPORT_DIR)/PSCreatePngChunk.vi \
   ../source/labview/$(VISNIPPET_SUPPORT_DIR)/PSCreatePngTextChunk.vi \
   ../source/labview/$(VISNIPPET_SUPPORT_DIR)/PSGetPngChunks.vi \

VIKIT_BINARY := VIKit.dll.buildCookie

VIKIT_PROJECT := ../source/labview/VIKit.lvproj

LABVIEW_BUILD_DIR := ../builds

LABVIEW_BUILT_FILES := \
   $(LABVIEW_BUILD_DIR)/extcode.h \
   $(LABVIEW_BUILD_DIR)/fundtypes.h \
   $(LABVIEW_BUILD_DIR)/hosttype.h \
   $(LABVIEW_BUILD_DIR)/ILVDataInterface.h \
   $(LABVIEW_BUILD_DIR)/ILVTypeInterface.h \
   $(LABVIEW_BUILD_DIR)/lv_epilog.h \
   $(LABVIEW_BUILD_DIR)/lv_prolog.h \
   $(LABVIEW_BUILD_DIR)/platdefines.h \
   $(LABVIEW_BUILD_DIR)/VIKit.dll \
   $(LABVIEW_BUILD_DIR)/VIKit.h \

AddMinGWSupport := ../patches/platdefines.h.AddMinGWSupport.patch

PATCH_FILES := \
   $(AddMinGWSupport) \

RELEASE_NOTES := ReleaseNotes.md

RELEASE_NOTES_FILES := \
   ../documentation/ReleaseNotesTemplate.md \
   ../documentation/UsageSynopsis.md \
   ../documentation/Requirements.md \

README := ../README.md

README_FILES := \
   ../documentation/ReadmeHeader.md \
   ../documentation/UsageSynopsis.md \
   ../documentation/GettingStarted.md \
   ../documentation/Requirements.md \

MASTER_MAKEFILE := $(VIKIT_STAGING_DIR)/Makefile

all : $(VIKIT_TARBALL) $(RELEASE_NOTES) $(README)

$(VIKIT_TARBALL): $(VIKIT_BINARY) $(MASTER_MAKEFILE) $(SCRIPT_SOURCE_FILES) $(C_SOURCE_FILES) $(LABVIEW_BUILT_FILES) $(PATCH_FILES) $(CALLABLE_LABVIEW_FILES) $(CALLABLE_VIPROJECT_FILES) $(CALLABLE_VIVENDOR_FILES) $(CALLABLE_VISNIPPET_FILES) $(CALLABLE_VISNIPPET_SUPPORT_FILES)
	@mkdir -p $(VIKIT_STAGING_DIR)/$(VIKIT_LIB_DIR)
	@mkdir -p $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)
	@mkdir -p $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)/$(VIPROJECT_DIR)
	@mkdir -p $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)/$(VISNIPPET_SUPPORT_DIR)
	@cp $(filter-out %Makefile,$(SCRIPT_SOURCE_FILES)) $(VIKIT_STAGING_DIR)
	@cp $(filter-out %Makefile,$(C_SOURCE_FILES)) $(VIKIT_STAGING_DIR)
	@cp $(LABVIEW_BUILT_FILES) $(VIKIT_STAGING_DIR)/$(VIKIT_LIB_DIR)
	@patch $(VIKIT_STAGING_DIR)/$(VIKIT_LIB_DIR)/platdefines.h < $(AddMinGWSupport)
	@cd $(VIKIT_STAGING_DIR) && make
	@mv $(VIKIT_STAGING_DIR)/*.ini $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)
	@mv $(VIKIT_STAGING_DIR)/*.exe $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)
	@mv $(VIKIT_STAGING_DIR)/*.dll $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)
	@mv $(VIKIT_STAGING_DIR)/*.sh $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)
	@mv $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)/VISharedFunctions.sh $(VIKIT_STAGING_DIR)
	@cd $(VIKIT_STAGING_DIR) && make clean
	@cp $(CALLABLE_LABVIEW_FILES) $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)
	@cp $(CALLABLE_VIPROJECT_FILES) $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)/$(VIPROJECT_DIR)
	@cp $(CALLABLE_VIVENDOR_FILES) $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)/$(VIVENDOR_DIR)
	@cp $(CALLABLE_VISNIPPET_FILES) $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)/$(VISNIPPET_DIR)
	@cp $(CALLABLE_VISNIPPET_SUPPORT_FILES) $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)/$(VISNIPPET_SUPPORT_DIR)
	tar -czf $(VIKIT_TARBALL) $(VIKIT_LIB_DIR)

$(VIKIT_BINARY) : $(VIKIT_PROJECT) $(LABVIEW_SOURCE_FILES)
	@VIBuildProject.sh --project $(abspath $<) --lv-version $(LABVIEW_RTE_VERSION)
	@ls ../builds/VIKit.dll >/dev/null && touch $@

$(RELEASE_NOTES) : $(RELEASE_NOTES_FILES)
	cat $^ > $@

$(README) : $(README_FILES)
	cat $^ > $@

$(MASTER_MAKEFILE) :
	@mkdir -p $(VIKIT_STAGING_DIR)
	cat $(filter %Makefile,$(SCRIPT_SOURCE_FILES) $(C_SOURCE_FILES)) install.mak > $@

.PHONY: $(README)

clean:
	@cd ../source/bash && make clean
	@cd ../source/c && make clean
	rm -rf $(VIKIT_STAGING_DIR)
	rm -rf $(VIKIT_TARBALL)
	rm -rf $(VIKIT_BINARY)
	rm -rf $(LABVIEW_BUILD_DIR)
	rm -rf $(RELEASE_NOTES)
	git reset HEAD $(README) && git checkout -- $(README)
