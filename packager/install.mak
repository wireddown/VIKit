# Makefile data for installing VIKit

BINARY_DIR := bin

# Makefile rules for installing VIKit

install : $(BUILT_SCRIPTS) $(COMPILED_EXECUTABLE_FILES) $(SETTINGS_FILES)
	@ls "$(DEST)" >/dev/null
	@cp -Rv $(BINARY_DIR)/* "$(DEST)"
	@cp -v $^ "$(DEST)"

