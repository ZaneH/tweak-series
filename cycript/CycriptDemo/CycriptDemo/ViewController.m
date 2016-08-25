//
//  ViewController.m
//  CycriptDemo
//
//  Created by Zane Helton on 8/25/16.
//  Copyright © 2016 Bison Software. All rights reserved.
//

#import "ViewController.h"
#import "ScoreKeeper.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *clickButton;
@property (nonatomic, strong) UILabel *scoreLabel;
@property (nonatomic, strong) ScoreKeeper *scoreModel;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	_scoreModel = [ScoreKeeper new];
	_scoreModel.score = 0;
	
	_clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
	_scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 25)];
	
	[_clickButton setFrame:self.view.frame];
	[_clickButton setTitle:@"Click Me!" forState:UIControlStateNormal];
	[_clickButton addTarget:self action:@selector(clickButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
	[_scoreLabel setText:[NSString stringWithFormat:@"Score: %i", _scoreModel.score]];
	[_scoreLabel setTextColor:[UIColor whiteColor]];
	
	[self.view setBackgroundColor:[UIColor redColor]];
	[self.view addSubview:_clickButton];
	[self.view addSubview:_scoreLabel];
}

- (void)clickButtonTapped:(id)sender {
	_scoreModel.score++;
	[_scoreLabel setText:[NSString stringWithFormat:@"Score: %i", _scoreModel.score]];
}

@end
