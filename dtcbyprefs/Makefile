TARGET := iphone:clang:latest:14.0
THEOS_PACKAGE_SCHEME = rootless
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = DTCByPrefs

DTCByPrefs_FILES = DTCByRootListController.m
DTCByPrefs_FRAMEWORKS = UIKit
DTCByPrefs_EXTRA_FRAMEWORKS = CepheiPrefs
DTCByPrefs_INSTALL_PATH = /Library/PreferenceBundles
DTCByPrefs_CFLAGS = -fobjc-arc

DTCByPrefs_INSTALL_PATH = /Library/PreferenceBundles

DTCByPrefs_EXTRA_PLISTS = DTCByPrefs.plist

include $(THEOS_MAKE_PATH)/bundle.mk
