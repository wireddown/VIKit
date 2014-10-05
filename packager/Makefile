# Makefile for VIKit distribution

VIKIT_TARBALL := VIKit.tar.gz
VIKIT_STAGING_DIR := VIKit
VIKIT_LIB_DIR := VIKit

SOURCE_FILES := \
   ../source/c/VIQueryVersion.c \
   ../source/c/Makefile \

LABVIEW_FILES := \
   ../builds/extcode.h \
   ../builds/fundtypes.h \
   ../builds/hosttype.h \
   ../builds/ILVDataInterface.h \
   ../builds/ILVTypeInterface.h \
   ../builds/ILVTypeInterface.h \
   ../builds/lv_epilog.h \
   ../builds/lv_prolog.h \
   ../builds/platdefines.h \
   ../builds/VIKit.dll \
   ../builds/VIKit.h \

AddMinGWSupport := ../patches/platdefines.h.AddMinGWSupport.patch

PATCH_FILES := \
   $(AddMinGWSupport) \

$(VIKIT_TARBALL): $(SOURCE_FILES) $(LABVIEW_FILES) $(PATCH_FILES)
	@mkdir -p $(VIKIT_STAGING_DIR)/$(VIKIT_LIB_DIR)
	@cp $(SOURCE_FILES) $(VIKIT_STAGING_DIR)
	@cp $(LABVIEW_FILES) $(VIKIT_STAGING_DIR)/$(VIKIT_LIB_DIR)
	@patch $(VIKIT_STAGING_DIR)/$(VIKIT_LIB_DIR)/platdefines.h < $(AddMinGWSupport)
	tar -czvf $(VIKIT_TARBALL) $(VIKIT_LIB_DIR)

.PHONY: clean
clean:
	rm -rfv $(VIKIT_STAGING_DIR)
	rm -rfv $(VIKIT_TARBALL)
