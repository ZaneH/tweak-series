@interface SBLockScreenDateViewController
- (id)dateView;
@end

@interface SBLockScreenManager
+ (id)sharedInstance;
@end

@interface SBLockScreenView
@end

@interface SBLockScreenViewController
@end

UIImageView *snoop;

%hook SBLockScreenDateViewController

- (void)_updateView {
	%orig;
	NSDate *dummyDate = [[self dateView] date];
	// check if the dummyDate is 4:20
	NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
	timeFormatter.dateFormat = @"h:mm"; // 4:20
	if ([[timeFormatter stringFromDate:dummyDate] isEqualToString:@"4:20"]) {
		// // YES: set the background to snoop dogg
		if (snoop) {
			return;
		}
		SBLockScreenViewController *lockViewController = MSHookIvar<SBLockScreenViewController *>([%c(SBLockScreenManager) sharedInstance], "_lockScreenViewController");
		SBLockScreenView *lockView = MSHookIvar<SBLockScreenView *>(lockViewController, "_view");
		UIView *neededView = MSHookIvar<UIView *>(lockView, "_foregroundView");

		NSBundle *bundle = [[NSBundle alloc] initWithPath:@"/Library/MobileSubstrate/DynamicLibraries/com.zanehelton.highnoon.bundle"];
		snoop = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[bundle pathForResource:@"snoop" ofType:@"png"]]];
		[snoop setFrame:neededView.frame];
		[neededView insertSubview:snoop atIndex:0];
	} else {
		// // NO : remove snoop dogg from the lockscreen if it's there, otherwise do nothing
		if (snoop) {
			[snoop removeFromSuperview];
			snoop = nil;
		}
	}
}

%end
