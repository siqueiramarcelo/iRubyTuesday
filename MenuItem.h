//
//  MenuItem.h
//  iNegocios
//
//  Created by Marcelo on 5/21/14.
//  Copyright (c) 2014 RubyTuesday Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MenuItemDelegate;

@interface MenuItem : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) UIImage *iconImage;
@property (strong, nonatomic) NSString *segueID;
@property (strong, nonatomic) NSString *selector;
@property (strong, nonatomic) NSArray *dataProvider;

@property (assign, nonatomic) id<MenuItemDelegate> delegate;

- (id)init;
- (NSArray *)populateDataProvider;

@end

@protocol MenuItemDelegate <NSObject>

@end
