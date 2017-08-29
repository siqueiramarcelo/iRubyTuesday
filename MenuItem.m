//
//  MenuItem.m
//  iNegocios
//
//  Created by Marcelo on 5/21/14.
//  Copyright (c) 2014 RubyTuesday Soft. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem

- (id)init {

    if (self = [super init]) {
        
    }
    
    return self;
}

- (NSArray *)populateDataProvider {

    NSMutableArray *menuItems = [NSMutableArray new];
    
    MenuItem *menuItem1 = [MenuItem new];
    menuItem1.title = NSLocalizedString(@"MENU_ITEM_1", @"Menu Item");
    menuItem1.iconImage = [UIImage imageNamed:@"icon_WhoWeAre"];
    menuItem1.segueID = @"WhoWeAreSegue";
    menuItem1.selector = @"WhoWeAre";
    [menuItems addObject:menuItem1];
    
    MenuItem *menuItem2 = [MenuItem new];
    menuItem2.title = NSLocalizedString(@"MENU_ITEM_2", @"Menu Item");
    menuItem2.iconImage = [UIImage imageNamed:@"icon_Map"];
    menuItem2.selector = @"openMapsForRoute";
    [menuItems addObject:menuItem2];
    
    MenuItem *menuItem3 = [MenuItem new];
    menuItem3.title = NSLocalizedString(@"MENU_ITEM_3", @"Menu Item");
    menuItem3.iconImage = [UIImage imageNamed:@"icon_Website"];
    menuItem3.selector = @"openWebSite";
    [menuItems addObject:menuItem3];
    
    MenuItem *menuItem4 = [MenuItem new];
    menuItem4.title = NSLocalizedString(@"MENU_ITEM_4", @"Menu Item");
    menuItem4.iconImage = [UIImage imageNamed:@"icon_Phone"];
    menuItem4.selector = @"phoneCall";
    [menuItems addObject:menuItem4];
    
    MenuItem *menuItem5 = [MenuItem new];
    menuItem5.title = NSLocalizedString(@"MENU_ITEM_5", @"Menu Item");
    menuItem5.iconImage = [UIImage imageNamed:@"icon_Skype"];
    menuItem5.selector = @"skypeCall";
    [menuItems addObject:menuItem5];
    
    MenuItem *menuItem6 = [MenuItem new];
    menuItem6.title = NSLocalizedString(@"MENU_ITEM_6", @"Menu Item");
    menuItem6.iconImage = [UIImage imageNamed:@"icon_Email"];
    menuItem6.selector = @"sendEmail";
    [menuItems addObject:menuItem6];
    
    MenuItem *menuItem7 = [MenuItem new];
    menuItem7.title = NSLocalizedString(@"MENU_ITEM_7", @"Menu Item");
    menuItem7.iconImage = [UIImage imageNamed:@"icon_Share"];
    menuItem7.selector = @"share";
    [menuItems addObject:menuItem7];
    
    MenuItem *menuItem8 = [MenuItem new];
    menuItem8.title = NSLocalizedString(@"MENU_ITEM_8", @"Menu Item");
    menuItem8.iconImage = [UIImage imageNamed:@"icon_Promotion"];
    menuItem8.segueID = @"PromotionSegue";
    menuItem8.selector = @"showPromotion";
    [menuItems addObject:menuItem8];
    
    return menuItems;
    
}

@end
