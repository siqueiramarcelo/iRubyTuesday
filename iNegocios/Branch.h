//
//  Branch.h
//  iRubyTuesday
//
//  Created by Marcelo on 6/7/14.
//  Copyright (c) 2014 RubyTuesday Soft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Branch : NSObject

@property (strong, nonatomic) NSString *houseName;
@property (assign, nonatomic) CLLocationCoordinate2D coordinate;
@property (strong, nonatomic) NSString *housePhoneNumber;
@property (strong, nonatomic) NSString *houseBranchName;
@property (strong, nonatomic) NSString *houseBranchLocal;
@property (strong, nonatomic) NSString *houseWebSite;
@property (strong, nonatomic) NSString *houseSkypeId;
@property (strong, nonatomic) NSString *houseEmail;

@end
