# This file is based on https://github.com/moewew/biblatex-trad/blob/master/Makefile

# ===    Definitions   === #
.SILENT:
SHELL		:= /bin/sh

# .PHONY: all clean

# ==     File list      == #
CLASS		= wsbthesis
BIBLIOGRAPHY	= wsb

# == Color definitions  == #
PACKAGE		= wsb-style
NO_COLOR    	= \033[0m
OK_COLOR   	= \033[32m
WARN_COLOR 	= \033[33m
ERROR_COLOR 	= \033[31m

# ===   Installation   === #
localinstall:	makelocalinstall

makelocalinstall:
	echo "Start local install" ;\
	PATHTEXHOME=`kpsewhich --var-value=TEXMFHOME` ;\
	PACKAGE_DIR="$$PATHTEXHOME/tex/latex/$(PACKAGE)/" ;\
	\
	echo "Creating folders if they don't exist" ;\
	mkdir -p				"$$PACKAGE_DIR" ;\
	cp $(CLASS).cls 		"$$PACKAGE_DIR" ;\
	\
	mkdir -p        		"$$PACKAGE_DIR/bbx/" ;\
	cp $(BIBLIOGRAPHY).bbx 	"$$PACKAGE_DIR/bbx" ;\
	\
	mkdir -p        		"$$PACKAGE_DIR/cbx/" ;\
	cp $(BIBLIOGRAPHY).cbx 	"$$PACKAGE_DIR/cbx" ;\
	\
	mkdir -p        		"$$PACKAGE_DIR/dbx/" ;\
	cp $(BIBLIOGRAPHY).dbx 	"$$PACKAGE_DIR/dbx" ;\
	\
	echo "$(OK_COLOR)Installation finished$(NO_COLOR)" ;\
