//
//  CustomAnnotation.m
//  iRubyTuesday
//
//  Created by Marcelo on 6/4/14.
//  Copyright (c) 2014 RubyTuesday Soft. All rights reserved.
//

#import "CustomAnnotation.h"

@implementation CustomAnnotation

- (id)initWithCoordinate:(CLLocationCoordinate2D)coord title:(NSString *)title subTitle:(NSString *)subTitle branchID:(NSString *)ID {
    
    self = [super init];
    
    if (self) {
        
        self.coordinate = coord;
        self.title = title;
        self.subtitle = subTitle;
        self.branchID = ID;
        
    }
    
    return self;
    
}

@end
