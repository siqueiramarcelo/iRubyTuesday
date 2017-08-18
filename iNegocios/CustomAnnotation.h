//
//  CustomAnnotation.h
//  iRubyTuesday
//
//  Created by Marcelo on 6/4/14.
//  Copyright (c) 2014 RubyTuesday Soft. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface CustomAnnotation : MKPointAnnotation

@property (strong, nonatomic) NSString *branchID;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coord title:(NSString *)title subTitle:(NSString *)subTitle branchID:(NSString *)ID;

@end
