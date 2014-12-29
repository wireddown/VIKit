# Makefile data for VIKit bash scripts

SHH_BANG_LINE := 2
SHARED_FUNCTIONS_START_LINE := 7
SCRIPT_HEADER_LINE := 4

VISharedFunctions := VISharedFunctions
VIBuildProject := VIBuildProject
VIPreCommitSnipDiagram := VIPreCommitSnipDiagram
VISnipDiagram := VISnipDiagram

BUILT_SCRIPTS := \
   $(VIBuildProject).sh \
   $(VIPreCommitSnipDiagram).sh \
   $(VISnipDiagram).sh \

# Makefile rules for VIKit bash scripts

all : $(BUILT_SCRIPTS)

%.sh : %.sh.in
	@printf "$@ <-- $<\n"
	@head -n$(SHH_BANG_LINE) $(VISharedFunctions).sh > $@
	@head -n$(SCRIPT_HEADER_LINE) $< >> $@
	@tail -n+$(SHARED_FUNCTIONS_START_LINE) $(VISharedFunctions).sh >> $@
	@tail -n+$(SCRIPT_HEADER_LINE) $< >> $@

clean : clean-sh

clean-sh :
	rm -rf $(BUILT_SCRIPTS)

