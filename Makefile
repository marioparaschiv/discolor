TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = discolor

discolor_FILES = Tweak.x
discolor_FRAMEWORKS = UIKit Foundation CoreGraphics CoreImage
discolor_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
