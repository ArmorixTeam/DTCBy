TARGET := iphone:clang:latest:14.0
ARCHS = arm64 arm64e
THEOS_PACKAGE_SCHEME = rootless
THEOS_DEVICE_IP = localhost -p 2222

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DTCBy

DTCBy_FILES = Tweak.x
DTCBy_CFLAGS = -fobjc-arc
DTCBy_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
