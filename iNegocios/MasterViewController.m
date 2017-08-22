//
//  MasterViewController.m
//  iNegocios
//
//  Created by Marcelo on 5/21/14.
//  Copyright (c) 2014 RubyTuesday Soft. All rights reserved.
//

#import "MasterViewController.h"

@import CoreLocation;
@import MapKit;
@import MessageUI;

#define IS_SYSTEM_6 [[UIDevice currentDevice].systemVersion hasPrefix:@"6"]
#define is_iPhone5 ( [ [ UIScreen mainScreen ] bounds ].size.height == 568 )
#define is_iPhone4 ( [ [ UIScreen mainScreen ] bounds ].size.height == 480 )

NSString * const businessName = @"Pousada RubyTuesday";
NSString * const appIDNumber = @"881491038";

@interface MasterViewController () <

    MFMailComposeViewControllerDelegate,
    MenuItemDelegate,
    UIGestureRecognizerDelegate,
    FrontMapDelegate

>

{
    NSArray *_objects; //data provider for table menu
    NSMutableArray *_branches;
}

@property (strong, nonatomic) MenuItem *menuItem;
@property (strong, nonatomic) Branch *currentBranch;

@end

@implementation MasterViewController

UIImageView *splashView;
UIImageView *navBarLogoView;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadBranches];
    
    self.currentBranch = _branches[0];
    
    if ([_branches count] > 1) { //Select branch
        
        [self openFrontMap];
        
    }
    
    [self startDisplay];
    
    //Data provider
    self.menuItem = [[MenuItem alloc] init];
    _objects = [[NSArray alloc] initWithArray:[self.menuItem populateDataProvider]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    navBarLogoView.hidden = NO;
    
    if (!IS_SYSTEM_6) {
        
        [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
        
    } else {
        
        
        [[[self navigationController] navigationBar] setBackgroundImage:[UIImage imageNamed:@"navBarBackground"] forBarMetrics:UIBarMetricsDefault];
        
    }
    
}

#pragma mark - Branch selection

- (void)loadBranches {
    
    _branches = [[NSMutableArray alloc] init];
    
    //Include first branch
    Branch *branch1 = [[Branch alloc] init];
    branch1.houseName = businessName;
    branch1.coordinate = CLLocationCoordinate2DMake(-22.755139, -41.887412);
    branch1.housePhoneNumber = NSLocalizedString(@"BRANCH1_PHONE", @"branch info");
    branch1.houseBranchName = NSLocalizedString(@"BRANCH1_NAME", @"branch info");
    branch1.houseBranchLocal = NSLocalizedString(@"BRANCH1_LOCAL", @"branch info");
    branch1.houseWebSite = NSLocalizedString(@"BRANCH1_WEBSITE", @"branch info");
    branch1.houseSkypeId = NSLocalizedString(@"BRANCH1_SKYPE", @"branch info");
    branch1.houseEmail = NSLocalizedString(@"BRANCH1_EMAIL", @"branch info");
    
    [_branches addObject:branch1];

    //Include second branch
    Branch *branch2 = [[Branch alloc] init];
    branch2.houseName = businessName;
    branch2.coordinate = CLLocationCoordinate2DMake(-22.754642, -41.873227);
    branch2.housePhoneNumber = NSLocalizedString(@"BRANCH2_PHONE", @"branch info");
    branch2.houseBranchName = NSLocalizedString(@"BRANCH2_NAME", @"branch info");
    branch2.houseBranchLocal = NSLocalizedString(@"BRANCH2_LOCAL", @"branch info");
    branch2.houseWebSite = NSLocalizedString(@"BRANCH2_WEBSITE", @"branch info");
    branch2.houseSkypeId = NSLocalizedString(@"BRANCH2_SKYPE", @"branch info");
    branch2.houseEmail = NSLocalizedString(@"BRANCH2_EMAIL", @"branch info");
    
    [_branches addObject:branch2];
    
    //Include first branch
    Branch *branch3 = [[Branch alloc] init];
    branch3.coordinate = CLLocationCoordinate2DMake(-22.757052, -41.903954);
    branch3.houseName = businessName;
    branch3.housePhoneNumber = NSLocalizedString(@"BRANCH3_PHONE", @"branch info");
    branch3.houseBranchName = NSLocalizedString(@"BRANCH3_NAME", @"branch info");
    branch3.houseBranchLocal = NSLocalizedString(@"BRANCH3_LOCAL", @"branch info");
    branch3.houseWebSite = NSLocalizedString(@"BRANCH3_WEBSITE", @"branch info");
    branch3.houseSkypeId = NSLocalizedString(@"BRANCH3_SKYPE", @"branch info");
    branch3.houseEmail = NSLocalizedString(@"BRANCH3_EMAIL", @"branch info");
    
    [_branches addObject:branch3];
    
    //Include second branch
    Branch *branch4 = [[Branch alloc] init];
    branch4.coordinate = CLLocationCoordinate2DMake(-22.769279, -41.888129);
    branch4.houseName = businessName;
    branch4.housePhoneNumber = NSLocalizedString(@"BRANCH4_PHONE", @"branch info");
    branch4.houseBranchName = NSLocalizedString(@"BRANCH4_NAME", @"branch info");
    branch4.houseBranchLocal = NSLocalizedString(@"BRANCH4_LOCAL", @"branch info");
    branch4.houseWebSite = NSLocalizedString(@"BRANCH4_WEBSITE", @"branch info");
    branch4.houseSkypeId = NSLocalizedString(@"BRANCH4_SKYPE", @"branch info");
    branch4.houseEmail = NSLocalizedString(@"BRANCH4_EMAIL", @"branch info");
    
    [_branches addObject:branch4];
    
}

- (void)openFrontMap {

    [self performSegueWithIdentifier:@"FrontMapSegue" sender:self];
    
}

- (void)openBranch:(int)branchNumber {
    
    self.currentBranch = _branches[branchNumber];

}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = is_iPhone4 ? @"Cell35" : @"Cell40";
    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    MenuItem *object = _objects[indexPath.row];
    
    cell.titleLabel.text = object.title;
    cell.iconImageView.image = object.iconImage;
    cell.segueID = object.segueID;    
    cell.backgroundView.backgroundColor = indexPath.row % 2 ? [UIColor whiteColor] : [UIColor colorWithRed:236.0/255.0 green:236.0/255.0 blue:236.0/255.0 alpha:1.0];
    cell.backgroundColor = indexPath.row % 2 ? [UIColor whiteColor] : [UIColor colorWithRed:236.0/255.0 green:236.0/255.0 blue:236.0/255.0 alpha:1.0];
    
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //[self playSound];
    
    MenuItem *itemNow = _objects[indexPath.row];
    NSString *segueID = itemNow.segueID;
    
    if (segueID != nil) {
        
        navBarLogoView.hidden = YES;
        [self performSegueWithIdentifier:segueID sender:self];
        
    } else {
        
        objc_msgSend(self, NSSelectorFromString (itemNow.selector));
        
    }
   
    return nil;
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableCell *cell = (TableCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    
    cell.backgroundView.backgroundColor = indexPath.row % 2 ? [UIColor whiteColor] : [UIColor colorWithRed:236.0/255.0 green:236.0/255.0 blue:236.0/255.0 alpha:1.0];
    cell.backgroundColor = indexPath.row % 2 ? [UIColor whiteColor] : [UIColor colorWithRed:236.0/255.0 green:236.0/255.0 blue:236.0/255.0 alpha:1.0];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"FrontMapSegue"]) {
        
        LocationViewController *frontMapView = segue.destinationViewController;
        frontMapView.delegate = self;
        frontMapView.branches = _branches;
        
    }
    
}

#pragma mark - Helper Methods

- (void)startDisplay {
    
    //Cells Height
    float cellHeight = is_iPhone4 ? 52 : 63;
    [self.tableView setRowHeight:cellHeight];
    
    //Splash screen
    splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 504)];
    splashView.image = [UIImage imageNamed:@"splash"];
    [self.view addSubview:splashView];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(setStyle) userInfo:nil repeats:NO];
    
}

- (void)setStyle {
    
    [splashView removeFromSuperview];

    //Back button
    if ([_branches count] > 1) [self setBackToFrontMapButton];
    
    self.navigationItem.title = businessName;
    NSDictionary *navBarTitleTextAttributes = [[NSDictionary alloc] initWithObjectsAndKeys: [UIFont fontWithName:@"OpenSans-Semibold" size:18], NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName, nil];
    
    [self.navigationController.navigationBar setTitleTextAttributes:navBarTitleTextAttributes];
  
    self.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
    
}

- (void)setBackToFrontMapButton {
    
    UIBarButtonItem *backToFrontmapButton = [UIBarButtonItem new];
    //UIImageView *backToFrontmapButtonImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 31, 43)];
    //[backToFrontmapButton setCustomView:backToFrontmapButtonImage];
    [backToFrontmapButton setBackgroundImage:[UIImage imageNamed: @"backArrowBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    backToFrontmapButton.image = [UIImage imageNamed:@"backArrow"];
    [backToFrontmapButton setTarget:self];
    [backToFrontmapButton setAction:@selector(openFrontMap)];
    
    self.navigationItem.leftBarButtonItem = backToFrontmapButton;
    
}

- (void)openMapsForRoute {
    
    CLLocationCoordinate2D houseLocation = self.currentBranch.coordinate;
    MKPlacemark *housePlaceMark = [[MKPlacemark alloc] initWithCoordinate:houseLocation addressDictionary:nil];
    MKMapItem *houseMapItem = [[MKMapItem alloc] initWithPlacemark:housePlaceMark];
    NSURL *houseURL = [[NSURL alloc] initWithString:self.currentBranch.houseWebSite];
    
    houseMapItem.name = businessName;
    houseMapItem.phoneNumber = self.currentBranch.housePhoneNumber;
    houseMapItem.url = houseURL;
    
    NSArray *items = [[NSArray alloc] initWithObjects:houseMapItem, nil];
    NSDictionary *options = @{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving};
    
    [MKMapItem openMapsWithItems:items launchOptions:options];
    
}

- (void)openWebSite {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@", self.currentBranch.houseWebSite]]];
    
}

- (void)WhoWeAre {
    
    [self performSegueWithIdentifier:@"WhoWeAreSegue" sender:nil];
    
}

- (void)phoneCall {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", self.currentBranch.housePhoneNumber]]];
    
}

- (void)skypeCall {
    
    BOOL installed = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"skype:"]];
    
    if(installed) {
        
        NSString *callString = [NSString stringWithFormat:@"skype:%@?call", self.currentBranch.houseSkypeId];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callString]];
        
    } else {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://itunes.com/apps/skype/skype"]];
    }
    
}

- (void)sendEmail {
    
    if ([MFMailComposeViewController canSendMail]) {
        
        [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:0/255.0 green:80/255.0 blue:152/255.0 alpha:1]];
        
        MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc] init];
        mailVC.mailComposeDelegate = self;
        
        [mailVC setSubject:[NSString stringWithFormat:@"%@ - %@", NSLocalizedString(@"APP_DESCRIPTION", @"reference"), NSLocalizedString(@"EMAIL_SUBJECT", @"Email setting")]];
        [mailVC setToRecipients:@[self.currentBranch.houseEmail]];
        
        [self presentViewController:mailVC animated:YES completion:nil];
        
    } else {
        
        NSLog(@"E-mailing not available");
        
    }
    
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)showPromotion {
    
    [self performSegueWithIdentifier:@"PromotionSegue" sender:nil];
    
}

- (void)share {
    
    NSString *appName = [self getAppName];
    NSString *text = [NSString stringWithFormat:@"\n\n%@", NSLocalizedString(@"APP_DESCRIPTION", @"reference")];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/app/id%@", appIDNumber]];
    NSArray *items = @[text, url];
    UIActivityViewController *vc = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];
    
    [vc setValue:appName forKey:@"subject"];
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (void)playSound {
    
    NSString *soundFilePath = [NSString stringWithFormat:@"%@/click.caf", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    self.player.numberOfLoops = 1;
    
    [self.player play];
    
}

- (NSString *)getAppName {
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSDictionary *info = [bundle infoDictionary];
    
    return [info objectForKey:@"CFBundleDisplayName"];
    
}

@end































































