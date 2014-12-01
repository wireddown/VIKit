# Makefile for VIKit bash scripts

include files.mak

all : $(BUILT_SCRIPTS)

%.sh : %.sh.in
	@printf "$@ <-- $<\n"
	@head -n$(SHH_BANG_LINE) $(VISharedFunctions).sh > $@
	@head -n$(SCRIPT_HEADER_LINE) $< >> $@
	@tail -n+$(SHARED_FUNCTIONS_START_LINE) $(VISharedFunctions).sh >> $@
	@tail -n+$(SCRIPT_HEADER_LINE) $< >> $@

clean :
	@rm -rfv $(BUILT_SCRIPTS)
