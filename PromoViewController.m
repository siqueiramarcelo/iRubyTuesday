//
//  PromoViewController.m
//  iNegocios
//
//  Created by Marcelo on 5/22/14.
//  Copyright (c) 2014 RubyTuesday Soft. All rights reserved.
//

#import "PromoViewController.h"

#define IS_SYSTEM_6 [[UIDevice currentDevice].systemVersion hasPrefix:@"6"]

@interface PromoViewController ()

@end

@implementation PromoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = NSLocalizedString(@"MENU_ITEM_8", @"");
    
    //self.promoLabel.font = [UIFont fontWithName:@"OpenSans-Bold" size:24];
    //self.promoLabel.textColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
    //self.promoLabel.textAlignment = NSTextAlignmentCenter;
    //self.promoLabel.text = @"20% Off!";
    
    [self.navigationItem.leftBarButtonItem setImage:[UIImage imageNamed:@"backArrow"]];
    [self.navigationItem.leftBarButtonItem setTarget:self];
    [self.navigationItem.leftBarButtonItem setAction:@selector(closeUp)];
    
    if (IS_SYSTEM_6) {
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame = CGRectMake(0, 0, 30, 30);
        [rightButton setImage:[UIImage imageNamed:@"backArrow"] forState:UIControlStateNormal];
        //[rightButton setImage:[UIImage imageNamed:@"logout-hover"] forState:UIControlStateHighlighted];
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

- (void)closeUp {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
