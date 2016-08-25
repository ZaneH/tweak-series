include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HighNoon
HighNoon_FILES = Tweak.xm
ADDITIONAL_OBJCFLAGS = -fobjc-arc

BUNDLE_NAME = com.zanehelton.highnoon
com.zanehelton.highnoon_INSTALL_PATH = /Library/MobileSubstrate/DynamicLibraries

include $(THEOS)/makefiles/bundle.mk
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
