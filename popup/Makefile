include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Popup
Popup_FILES = Listener.xm
Popup_LIBRARIES = activator
ADDITIONAL_OBJCFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

internal-stage::
	#Filter plist
	$(ECHO_NOTHING)if [ -f Filter.plist ]; then mkdir -p $(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries/; cp Filter.plist $(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries/Popup.plist; fi$(ECHO_END)
	#PreferenceLoader plist
	$(ECHO_NOTHING)if [ -f Preferences.plist ]; then mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Popup; cp Preferences.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Popup/; fi$(ECHO_END)

after-install::
	install.exec "killall -9 SpringBoard"
