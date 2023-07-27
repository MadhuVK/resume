# Makefile

# This file is organized based on approximate end-to-end workflow:
#
# 1.  Variables and common definitions are located at the top
# 1.  Main entry-point targets, like "default" and "help"
# 1.  Primary build targets
# 1.  Cleanup targets


## Variables & Definitions
SHELL := /bin/bash

PROJECT := github.com/madhuvk/resume.git
TEX = lualatex  
TEX_FLAGS ?= 
TEXCMD = $(TEX) $(TEX_FLAGS)

TARGET_NAME := resume
TARGET := $(TARGET_NAME).pdf

## Primary entry-point targets

.PHONY: default
default: $(TARGET)

## Primary build targets

$(TARGET): $(TARGET_NAME).tex
	$(TEXCMD) $<

## Cleanup targets

.PHONY: clean
clean: 
	rm -f $(TARGET_NAME).aux $(TARGET_NAME).log

.PHONY: distclean
distclean: clean
	rm -f $(TARGET)
