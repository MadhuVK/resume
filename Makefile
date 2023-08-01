# Makefile

# This file is organized based on approximate end-to-end workflow:
#
# 1.  Variables and common definitions are located at the top
# 1.  Main entry-point targets, like "default" and "help"
# 1.  Primary build targets
# 1.  Cleanup targets


## Variables & Definitions
SHELL := /bin/bash

PROJECT := https://github.com/madhuvk/resume
TEX = lualatex  
TEX_FLAGS ?= 
TEXCMD = $(TEX) $(TEX_FLAGS)

TARGET_NAME := resume
TARGET := $(TARGET_NAME).pdf

## Primary entry-point targets

.PHONY: help
help:
	@echo -e "make [strip_pdf] (Default)\n\
		\nmake <help> - Print help\
		\nmake <distclean> - Remove all make output\
		\nmake <clean> - Remove logs and auxillary make output files\
		\nmake <resume.pdf> - Compile resume using lualatex\
		\nmake <strip_pdf> - Remove metadata from resume.pdf\
"

.PHONY: default
default: strip_pdf

## Primary build targets

$(TARGET): $(TARGET_NAME).tex
	@echo "Compiling $(TARGET)"
	@$(TEXCMD) $< > /dev/null

.PHONY: strip_pdf
strip_pdf: $(TARGET)
	@scripts/strip_pdf $<

## Cleanup targets

.PHONY: clean
clean: 
	rm -f $(TARGET_NAME).aux $(TARGET_NAME).log

.PHONY: distclean
distclean: clean
	rm -f $(TARGET)
