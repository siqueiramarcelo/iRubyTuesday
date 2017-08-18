//
//  LocationViewController.m
//  iRubyTuesday
//
//  Created by Marcelo on 6/4/14.
//  Copyright (c) 2014 RubyTuesday Soft. All rights reserved.
//

#import "LocationViewController.h"

#define IS_SYSTEM_6 [[UIDevice currentDevice].systemVersion hasPrefix:@"6"]

@interface LocationViewController () <UIGestureRecognizerDelegate>

@end

@implementation LocationViewController

int selectedBranch = 0;

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
    
    [self.mapView setShowsUserLocation:YES];
    self.mapView.delegate = self;
   
    [self setLayout];
    [self setUpShops];
    
}

- (void)viewWillAppear:(BOOL)animated {

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setLayout {
    
    self.frontMapMainLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:24];
    self.frontMapMainLabel.textColor = [UIColor whiteColor];
    self.frontMapMainLabel.text = NSLocalizedString(@"FRONT_MAP_TITLE", @"title");
    
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
    
}

- (NSArray *)setUpShops {
    
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [self.branches count]; i++) {
        
        Branch *branchNow = self.branches[i];
        CustomAnnotation  *ann = [[CustomAnnotation alloc] init];
        ann.coordinate = branchNow.coordinate;
        ann.branchID = [NSString stringWithFormat:@"%d", i];
        
        [annotations addObject:ann];
        
    }

    [self showAllLocations:annotations];
    
    return annotations;
    
}

- (void)openBranchTable:(UIButton *)sender {
    
    [self.delegate openBranch:(int)sender.tag];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)showAllLocations:(NSArray *)annotations {
    
    MKCoordinateRegion region = self.mapView.region;
    NSMutableDictionary *limits = [[NSMutableDictionary alloc] init];
    
    limits = [self getMapLimits:annotations];
    double maxLat = [[limits objectForKey:@"maxLat"] doubleValue];
    double minLat = [[limits objectForKey:@"minLat"] doubleValue];
    double maxLong = [[limits objectForKey:@"maxLong"] doubleValue];
    double minLong = [[limits objectForKey:@"minLong"] doubleValue];
    
    double latDelta = maxLat - minLat;
    double longDelta = maxLong - minLong;

    //if (latDelta < .05) latDelta = .05;
    //if (longDelta < .05) longDelta = .05;
    
    region.center = [self getMapCenter:annotations];
    region.span.latitudeDelta = latDelta * 2;
    region.span.longitudeDelta = longDelta * 2;
    
    [self.mapView setRegion:region animated:YES];
    [self.mapView addAnnotations:annotations];
    
}

- (NSMutableDictionary *)getMapLimits:(NSArray *)annotations {
    
    NSMutableArray *latitudes = [[NSMutableArray alloc] init];
    NSMutableArray *longitudes = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [annotations count]; i++) {
        
        CustomAnnotation *annotationNow = annotations[i];
        NSNumber *latitudeObj = [NSNumber numberWithFloat:annotationNow.coordinate.latitude];
        NSNumber *longitudeObj = [NSNumber numberWithFloat:annotationNow.coordinate.longitude];
        
        [latitudes addObject:latitudeObj];
        [longitudes addObject:longitudeObj];
        
    }
    
    NSMutableDictionary *limits = [[NSMutableDictionary alloc] init];
    
    NSNumber *maxLat = [latitudes valueForKeyPath:@"@max.doubleValue"];
    NSNumber *minLat = [latitudes valueForKeyPath:@"@min.doubleValue"];
    
    NSNumber *maxLong = [longitudes valueForKeyPath:@"@max.doubleValue"];
    NSNumber *minLong = [longitudes valueForKeyPath:@"@min.doubleValue"];
    
    [limits setObject:maxLat forKey:@"maxLat"];
    [limits setObject:minLat forKey:@"minLat"];
    [limits setObject:maxLong forKey:@"maxLong"];
    [limits setObject:minLong forKey:@"minLong"];
    
    return limits;

}

- (CLLocationCoordinate2D)getMapCenter:(NSArray *)annotations {
    
    CLLocationCoordinate2D centerCoord;
    double totalLat = 0;
    double totalLong = 0;
    long totalShops = [annotations count];
    
    for (CustomAnnotation *shop in annotations) {
        
        totalLat += shop.coordinate.latitude;
        totalLong += shop.coordinate.longitude;
        
    }
    
    centerCoord.latitude = totalLat / totalShops;
    centerCoord.longitude = totalLong / totalShops;
    
    return centerCoord;
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(CustomAnnotation *)annotation {
    
    if ([annotation isKindOfClass:[CustomAnnotation class]]) {
        
        static NSString *customAnnotationID = @"customAnnotation";
        
        CustomAnnotationView *customAnnotationView = (CustomAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:customAnnotationID];
        
        if (customAnnotationView) {
            
            customAnnotationView.annotation = annotation;
            
        } else {
            
            customAnnotationView = [[CustomAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:customAnnotationID];
            
        }
        
        BranchTap *tap = [[BranchTap alloc] initWithTarget:self action:@selector(showPanel:)];
        [tap setNumberOfTouchesRequired:1];
        [tap setDelegate:self];
        tap.branchID = annotation.branchID;
        [customAnnotationView addGestureRecognizer:tap];
//NSLog(@"tap");
        return customAnnotationView;

    }
    
    return nil;
    
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

- (void)showPanel:(CustomAnnotation *)sender {
    
    int branchID = [sender.branchID intValue];
    Branch *branchNow = self.branches[branchID];
    
    self.panelLabel1.font = [UIFont fontWithName:@"OpenSans-Semibold" size:17];
    self.panelLabel1.textColor = [UIColor whiteColor];
    self.panelLabel1.text = branchNow.houseName;
    
    self.panelLabel2.font = [UIFont fontWithName:@"OpenSans" size:17];
    self.panelLabel2.textColor = [UIColor whiteColor];
    self.panelLabel2.text = branchNow.houseBranchName;
    
    self.panelLabel3.font = [UIFont fontWithName:@"OpenSans" size:17];
    self.panelLabel3.textColor = [UIColor whiteColor];
    self.panelLabel3.text = branchNow.houseBranchLocal;
    
    self.panelLabel4.font = [UIFont fontWithName:@"OpenSans" size:17];
    self.panelLabel4.textColor = [UIColor whiteColor];
    self.panelLabel4.text = NULL; 
    
    self.panelView.hidden = NO;
    self.panelButtonOK.tag = branchID;
    
}

- (IBAction)closePanel:(id)sender {
    
    self.panelView.hidden = YES;
   
}

- (IBAction)confirmPanel:(UIButton *)sender {
    
    [self.delegate openBranch:(int)sender.tag];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
















































