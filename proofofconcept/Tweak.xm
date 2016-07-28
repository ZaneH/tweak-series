%hook SBLockScreenViewController

- (void)viewWillAppear:(BOOL)arg1 {
	%orig;
	[[[UIAlertView alloc] initWithTitle:@"Sup" message:@"It works" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil] show];
}

%end
