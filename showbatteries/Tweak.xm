@interface BCBatteryDeviceController {
	NSArray *_sortedDevices;
}

+ (id)sharedInstance;
@end

@interface BCBatteryDevice {
	long long _percentCharge;
	NSString *_name;
}
@end

%hook UIViewController
- (void)presentViewController:(UIViewController *)viewControllerToPresent 
                     animated:(BOOL)flag 
                   completion:(void (^)(void))completion {
	if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
		UIAlertController *ac = (UIAlertController *)viewControllerToPresent;

		BCBatteryDeviceController *bcb = [%c(BCBatteryDeviceController) sharedInstance];
		NSArray *devices = MSHookIvar<NSArray *>(bcb, "_sortedDevices");

		NSMutableString *newMessage = [NSMutableString new];

		for (BCBatteryDevice *device in devices) {
			NSString *deviceName = MSHookIvar<NSString *>(device, "_name");
			long long deviceCharge = MSHookIvar<long long>(device, "_percentCharge");

			[newMessage appendString:[NSString stringWithFormat:@"%@ : %lld%%\n", deviceName, deviceCharge]];
		}

		[ac setMessage:newMessage];
		return %orig(ac, flag, completion);
	} else {
		return %orig;
	}
}
%end