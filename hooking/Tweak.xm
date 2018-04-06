@interface SBLockScreenViewControllerBase : UIViewController

@end

%hook SBLockScreenViewControllerBase
- (void)viewDidLoad {
	%orig;

	UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
	[v setBackgroundColor:[UIColor redColor]];
	[self.view addSubview:v];
}
%end