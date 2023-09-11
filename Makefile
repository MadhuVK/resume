# Makefile

# This file is organized based on approximate end-to-end workflow:
#
# 1.  Variables and common definitions are located at the top
# 1.  Main entry-point targets, like "default" and "help"
# 1.  Primary build targets
# 1.  Auxiliary targets
# 1.  Cleanup targets


## Variables & Definitions
SHELL := /bin/bash

PROJECT := https://github.com/madhuvk/resume
TEXCMD ?= $(shell command -v lualatex || echo 'TEXCMD-undefined')

CONTAINER ?= $(shell command -v podman || command -v docker || echo 'CONTAINER-undefined')
CONTAINER_IMAGE := resume-texlive

TARGET_NAME := resume
TARGET := $(TARGET_NAME).pdf

## Primary entry-point targets
.PHONY: default
default: container

.PHONY: help
help:
	@echo -e "make [container] (Default)\n\
		\nTEXCMD: $(TEXCMD)\
		\nCONTAINER: $(CONTAINER)\n\
		\nmake <help> - Print help\
		\nmake <auxclean> - Remove auxiliary artifacts and logs\
		\nmake <distclean> - Remove resume artifact\
		\nmake <container_clean> - Remove container image\
		\nmake <clean> - Remove all make artifacts\
		\nmake <resume.pdf> - Compile resume using TEXCMD\
		\nmake <strip_pdf> - Compile & remove metadata\
		\nmake <container> - Run default target using CONTAINER\
		\nmake <container_image> - Build container image\
"

.PHONY: container
container: container_image
	$(CONTAINER) run --rm -w /workdir -v .:/workdir $(CONTAINER_IMAGE) $(MAKE) strip_pdf

## Primary build targets

$(TARGET): $(TARGET_NAME).tex
	@echo "Compiling $(TARGET). See $(TARGET_NAME).log for compilation logs/errors."
	>/dev/null $(TEXCMD) $<

.PHONY: strip_pdf
strip_pdf: $(TARGET)
	@scripts/strip_pdf $<

## Auxiliary targets

.PHONY: container_image
container_image:
	$(CONTAINER) build -t $(CONTAINER_IMAGE) .

## Cleanup targets

.PHONY: auxclean
auxclean:
	rm -f $(TARGET_NAME).aux $(TARGET_NAME).log

.PHONY: distclean
distclean:
	rm -f $(TARGET)

.PHONY: containerclean
containerclean:
ifeq ($(CONTAINER), CONTAINER-undefined)
	@echo "CONTAINER not defined. Skipping image clean."
else
	$(CONTAINER) rmi -i resume-texlive
endif

.PHONY: clean
clean: auxclean distclean containerclean
