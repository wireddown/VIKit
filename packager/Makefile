# Makefile for VIKit distribution

VIKIT_TARBALL := VIKit.tar.gz
VIKIT_STAGING_DIR := VIKit
VIKIT_LIB_DIR := VIKit
VIKIT_BIN_DIR := bin
VIPROJECT_DIR := VIProject

SOURCE_FILES := \
   $(shell find ../source/c -type f)

LABVIEW_SOURCE_FILES := \
   $(shell find ../source/labview -type f)

CALLABLE_VIPROJECT_FILES := \
   ../source/labview/$(VIPROJECT_DIR)/VIProject.lvlib \
   ../source/labview/$(VIPROJECT_DIR)/VPBuildSpecInformation.ctl \
   ../source/labview/$(VIPROJECT_DIR)/VPCutProjectDependencies.vi \
   ../source/labview/$(VIPROJECT_DIR)/VPRebuild.vi \
   ../source/labview/$(VIPROJECT_DIR)/VPTargetBuildSpecs.ctl \

CALLABLE_LABVIEW_FILES := \
   ../source/labview/VIBuildProject.vi \
   ../source/labview/VIHost/VIHost.lvlib \
   ../source/labview/VIHost/VHRunVI.vi \
   ../source/labview/VIQueryBuildSpecs.vi \

SCRIPT_SOURCE_FILES := \
   $(shell find ../source/bash -type f)

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

all : $(VIKIT_TARBALL) $(VIKIT_BINARY) $(RELEASE_NOTES) $(README)

$(VIKIT_TARBALL): $(SOURCE_FILES) $(VIKIT_BINARY) $(LABVIEW_BUILT_FILES) $(PATCH_FILES) $(SCRIPT_SOURCE_FILES) $(CALLABLE_LABVIEW_FILES) $(CALLABLE_VIPROJECT_FILES)
	@rm -rfv $(VIKIT_STAGING_DIR)
	@rm -rfv $(VIKIT_TARBALL)
	@mkdir -p $(VIKIT_STAGING_DIR)/$(VIKIT_LIB_DIR)
	@cp $(SOURCE_FILES) $(VIKIT_STAGING_DIR)
	@cp $(LABVIEW_BUILT_FILES) $(VIKIT_STAGING_DIR)/$(VIKIT_LIB_DIR)
	@patch $(VIKIT_STAGING_DIR)/$(VIKIT_LIB_DIR)/platdefines.h < $(AddMinGWSupport)
	@cd $(VIKIT_STAGING_DIR) && make
	@mkdir -p $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)
	@mkdir -p $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)/$(VIPROJECT_DIR)
	@mv $(VIKIT_STAGING_DIR)/*.exe $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)
	@mv $(VIKIT_STAGING_DIR)/*.dll $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)
	@cp $(SCRIPT_SOURCE_FILES) $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)
	@cp $(CALLABLE_LABVIEW_FILES) $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)
	@cp $(CALLABLE_VIPROJECT_FILES) $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)/$(VIPROJECT_DIR)
	tar -czvf $(VIKIT_TARBALL) $(VIKIT_LIB_DIR)

$(VIKIT_BINARY) : $(VIKIT_PROJECT) $(LABVIEW_SOURCE_FILES)
	@VIBuildProject.sh --project $(abspath $<)
	@ls ../builds/VIKit.dll >/dev/null && touch $@

$(RELEASE_NOTES) : $(RELEASE_NOTES_FILES)
	cat $^ > $@

$(README) : $(README_FILES)
	cat $^ > $@

.PHONY: clean $(README)
clean:
	@rm -rfv $(VIKIT_STAGING_DIR)
	@rm -rfv $(VIKIT_TARBALL)
	@rm -rfv $(VIKIT_BINARY)
	@rm -rfv $(LABVIEW_BUILD_DIR)
	@rm -rfv $(RELEASE_NOTES)
	git reset HEAD $(README) && git checkout -- $(README)
