TARGET := iphone:clang:latest:14.0
THEOS_PACKAGE_SCHEME = rootless
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = DTCByPrefs

DTCByPrefs_FILES = DTCByRootListController.m
DTCByPrefs_FRAMEWORKS = UIKit
DTCByPrefs_INSTALL_PATH = /Library/PreferenceBundles
DTCByPrefs_CFLAGS = -fobjc-arc
DTCByPrefs_LDFLAGS = -F$(SYSROOT)/System/Library/PrivateFrameworks

include $(THEOS_MAKE_PATH)/bundle.mk
