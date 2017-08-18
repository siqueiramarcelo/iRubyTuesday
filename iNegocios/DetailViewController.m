//
//  DetailViewController.m
//  iNegocios
//
//  Created by Marcelo on 5/21/14.
//  Copyright (c) 2014 RubyTuesday Soft. All rights reserved.
//

#import "DetailViewController.h"

#define IS_SYSTEM_6 [[UIDevice currentDevice].systemVersion hasPrefix:@"6"]
#define is_iPhone5 ( [ [ UIScreen mainScreen ] bounds ].size.height == 568 )
#define is_iPhone4 ( [ [ UIScreen mainScreen ] bounds ].size.height == 480 )

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = NSLocalizedString(@"MENU_ITEM_1", @"");
    
    //[self setNeedsStatusBarAppearanceUpdate];
    
    if (!IS_SYSTEM_6) self.automaticallyAdjustsScrollViewInsets = NO;
    
    float textViewFrameHeight = is_iPhone5 ? 280 : 192;
    
	// Do any additional setup after loading the view, typically from a nib.
    self.titleLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:18];
    self.titleLabel.textColor = [UIColor colorWithRed:87.0/255.0 green:87.0/255.0 blue:87.0/255.0 alpha:1.0];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.text = NSLocalizedString(@"ABOUT_US_TITLE", @"About us");
    
    UITextView *whoWeAreText = [[UITextView alloc] initWithFrame:CGRectMake(16, 204, 280, textViewFrameHeight)];
    [self.view addSubview:whoWeAreText];
    whoWeAreText.font = [UIFont fontWithName:@"OpenSans-Light" size:16];
    whoWeAreText.textAlignment = NSTextAlignmentJustified;
    whoWeAreText.text = NSLocalizedString(@"ABOUT_US", @"text description");
    
    [self.navigationItem.leftBarButtonItem setImage:[UIImage imageNamed:@"backArrow"]];
    [self.navigationItem.leftBarButtonItem setTarget:self];
    [self.navigationItem.leftBarButtonItem setAction:@selector(closeUp)];
    
    if (IS_SYSTEM_6) {
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame = CGRectMake(0, 0, 30, 30);
        [rightButton setImage:[UIImage imageNamed:@"backArrow"] forState:UIControlStateNormal];
        [rightButton addTarget:self action:@selector(closeUp) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
        self.navigationItem.leftBarButtonItem = rightBarButtonItem;
        
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
    
}

- (void)closeUp {

    [self.navigationController popViewControllerAnimated:YES];
    
}

@end





