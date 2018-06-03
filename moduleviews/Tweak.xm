@interface CCUIModuleCollectionViewController : UIViewController {
	NSDictionary *_moduleContainerViewByIdentifier;
}

- (void)viewWillAppear:(BOOL)arg1;

// %new
- (UIColor *)randomColor;
@end

@interface CCUIContentModuleContainerView : UIView
@end

UIView *newView;

%hook CCUIModuleCollectionViewController

- (void)viewWillAppear:(BOOL)arg1 {
	%orig;

	NSDictionary *moduleDictionary = MSHookIvar<NSDictionary *>(self, "_moduleContainerViewByIdentifier");
	for (NSString *key in moduleDictionary) {
		id val = moduleDictionary[key];

		if ([val isMemberOfClass:[%c(CCUIContentModuleContainerView) class]]) {
			[val setBackgroundColor:[self randomColor]];
		}
	}

	if (!newView) {
		newView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
		[newView setBackgroundColor:[self randomColor]];
	}

	UIButton *newButton = [UIButton buttonWithType:UIButtonTypeSystem];
	[newButton setTitle:@"Press me!" forState:UIControlStateNormal];
	[newButton setFrame:newView.frame];
	[newButton addTarget:self action:@selector(didPressButton:) forControlEvents:UIControlEventTouchUpInside];

	[newView addSubview:newButton];

	[[[UIApplication sharedApplication] keyWindow] addSubview:newView];

	UIImage *bobImage = [UIImage imageWithContentsOfFile:@"/Library/Application Support/ModuleViews.bundle/bob-saget.png"];
	UIImageView *bobImageView = [[UIImageView alloc] initWithImage:bobImage];
	[bobImageView setFrame:CGRectMake(0, 250, 250, 250)];

	[[[UIApplication sharedApplication] keyWindow] addSubview:bobImageView];
}

%new
- (void)didPressButton:(UIButton *)arg1 {
	[newView setBackgroundColor:[self randomColor]];
}

%new
- (UIColor *)randomColor {
	// 0 - 255
	int r = arc4random_uniform(256);
	int g = arc4random_uniform(256);
	int b = arc4random_uniform(256);

	return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:1.0f];
}

%end