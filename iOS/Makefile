SYSROOT = $(THEOS)/sdks/iPhoneOS14.4.sdk/
ARCHS = arm64
TARGET = iphone:clang:latest:11.0

FINALPACKAGE = 1
DEBUG = 0
THEOS_LEAN_AND_MEAN = 1

INSTALL_TARGET_PROCESSES = Ulysses

TWEAK_NAME = UlyssesCrack
$(TWEAK_NAME)_FILES = $(TWEAK_NAME).m
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
