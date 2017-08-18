//
//  CustomAnnotationView.m
//  iRubyTuesday
//
//  Created by Marcelo on 6/4/14.
//  Copyright (c) 2014 RubyTuesday Soft. All rights reserved.
//

#import "CustomAnnotationView.h"

@implementation CustomAnnotationView

- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        UIImage *customImage = [UIImage imageNamed:@"mapMarker"];
        self.image = customImage;
        self.frame = CGRectMake(0, 0, 47, 65);
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.centerOffset = CGPointMake(0, -32.5);
       
    }
    
    return self;
    
}



@end
