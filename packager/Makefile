# Makefile for VIKit distribution

VIKIT_TARBALL := VIKit.tar.gz
VIKIT_STAGING_DIR := VIKit
VIKIT_LIB_DIR := VIKit
VIKIT_BIN_DIR := bin

SOURCE_FILES := \
   ../source/c/VIQueryBuildSpecs.c \
   ../source/c/VIQueryVersion.c \
   ../source/c/Makefile \

LABVIEW_FILES := \
   ../builds/extcode.h \
   ../builds/fundtypes.h \
   ../builds/hosttype.h \
   ../builds/ILVDataInterface.h \
   ../builds/ILVTypeInterface.h \
   ../builds/lv_epilog.h \
   ../builds/lv_prolog.h \
   ../builds/platdefines.h \
   ../builds/VIKit.dll \
   ../builds/VIKit.h \

AddMinGWSupport := ../patches/platdefines.h.AddMinGWSupport.patch

PATCH_FILES := \
   $(AddMinGWSupport) \

RELEASE_NOTES := ReleaseNotes.md

RELEASE_NOTES_FILES := \
   ../documentation/ReleaseNotesTemplate.md \
   ../documentation/UsageSynopsis.md \

README := ../README.md

README_FILES := \
   ../documentation/ReadmeHeader.md \
   ../documentation/UsageSynopsis.md \
   ../documentation/GettingStarted.md \

all : $(VIKIT_TARBALL) $(RELEASE_NOTES) $(README)

$(VIKIT_TARBALL): $(SOURCE_FILES) $(LABVIEW_FILES) $(PATCH_FILES)
	@mkdir -p $(VIKIT_STAGING_DIR)/$(VIKIT_LIB_DIR)
	@cp $(SOURCE_FILES) $(VIKIT_STAGING_DIR)
	@cp $(LABVIEW_FILES) $(VIKIT_STAGING_DIR)/$(VIKIT_LIB_DIR)
	@patch $(VIKIT_STAGING_DIR)/$(VIKIT_LIB_DIR)/platdefines.h < $(AddMinGWSupport)
	@cd $(VIKIT_STAGING_DIR) && make
	@mkdir $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)
	@mv $(VIKIT_STAGING_DIR)/*.exe $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)
	@mv $(VIKIT_STAGING_DIR)/*.dll $(VIKIT_STAGING_DIR)/$(VIKIT_BIN_DIR)
	tar -czvf $(VIKIT_TARBALL) $(VIKIT_LIB_DIR)

$(RELEASE_NOTES) : $(RELEASE_NOTES_FILES)
	cat $^ > $@

$(README) : $(README_FILES)
	cat $^ > $@

.PHONY: clean $(README)
clean:
	@rm -rfv $(VIKIT_STAGING_DIR)
	@rm -rfv $(VIKIT_TARBALL)
	@rm -rfv $(RELEASE_NOTES)
	git reset HEAD $(README) && git checkout -- $(README)
