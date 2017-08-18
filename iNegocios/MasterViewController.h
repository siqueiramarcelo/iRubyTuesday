//
//  MasterViewController.h
//  iNegocios
//
//  Created by Marcelo on 5/21/14.
//  Copyright (c) 2014 RubyTuesday Soft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableCell.h"
#import "DetailViewController.h"
#import <objc/message.h>
#import "MenuItem.h"
#import "LocationViewController.h"
#import "Branch.h"

@import AVFoundation;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) AVAudioPlayer *player;

@end
