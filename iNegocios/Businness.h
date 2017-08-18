//
//  Businness.h
//  iRubyTuesday
//
//  Created by Marcelo on 6/7/14.
//  Copyright (c) 2014 RubyTuesday Soft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Businness : NSObject

@property (assign, nonatomic) NSMutableArray *coordinates;
@property (strong, nonatomic) NSMutableArray *housePhoneNumbers;
@property (strong, nonatomic) NSMutableArray *houseBranchNames;
@property (strong, nonatomic) NSMutableArray *houseWebSites;
@property (strong, nonatomic) NSMutableArray *houseSkypeIds;
@property (strong, nonatomic) NSMutableArray *houseEmails;

@end
