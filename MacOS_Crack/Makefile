TARGET := macosx:clang:latest:10.14.4
ARCHS = x86_64 arm64

FINALPACKAGE = 1
DEBUG = 0

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = UlyssesCrack

$(LIBRARY_NAME)_FILES = $(LIBRARY_NAME).m
$(LIBRARY_NAME)_CFLAGS = -fobjc-arc
$(LIBRARY_NAME)_INSTALL_PATH = /

include $(THEOS_MAKE_PATH)/library.mk
