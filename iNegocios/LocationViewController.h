//
//  LocationViewController.h
//  iRubyTuesday
//
//  Created by Marcelo on 6/4/14.
//  Copyright (c) 2014 RubyTuesday Soft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomAnnotation.h"
#import "CustomAnnotationView.h"
#import "Branch.h"
#import "BranchInfoView.h"
#import "BranchTap.h"

@protocol FrontMapDelegate;

@import MapKit;

@interface LocationViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIView *panelView;

@property (weak, nonatomic) IBOutlet UILabel *frontMapMainLabel;

@property (weak, nonatomic) IBOutlet UIButton *panelButtonOK;
- (IBAction)confirmPanel:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *panelButtonClose;
- (IBAction)closePanel:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *panelLabel1;
@property (weak, nonatomic) IBOutlet UILabel *panelLabel2;
@property (weak, nonatomic) IBOutlet UILabel *panelLabel3;
@property (weak, nonatomic) IBOutlet UILabel *panelLabel4;

@property (strong, nonatomic) NSMutableArray *branches;

@property (strong, nonatomic) BranchInfoView *branchesPane;

@property (assign, nonatomic) id<FrontMapDelegate> delegate;

- (NSMutableArray *)setUpShops;

@end

@protocol FrontMapDelegate <NSObject>

- (void)openBranch:(int)branchNumber;

@end













































