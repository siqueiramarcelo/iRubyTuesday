//
//  BranchInfoView.m
//  iRubyTuesday
//
//  Created by Marcelo on 6/8/14.
//  Copyright (c) 2014 RubyTuesday Soft. All rights reserved.
//

#import "BranchInfoView.h"

@implementation BranchInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)showBranchPane:(id *)sender {
    
    //Arbitrary measures
    int totalLabels = 2;
    int totalRows = totalLabels + 1;
    int totalRowGaps = totalRows + 1;
    float paneWidth = 210;
    float paneHeight = 135;
    float paneItemHeight = 30;
    float paneY = 80;
    
    //Pre defined measures
    float paneX = (320 - paneWidth) / 2;
    float paneGap = (paneHeight - (paneItemHeight * totalRows)) / totalRowGaps;
    
    //Pane
    self.branchesPane = [[BranchInfoView alloc] init];
    [self addSubview:self.branchesPane];
    
    CGRect paneFrame = CGRectMake(paneX, paneY, paneWidth, paneHeight);
    self.branchesPane.frame = paneFrame;
    self.branchesPane.backgroundColor = [UIColor colorWithRed:73.0/255.0 green:73.0/255.0 blue:37.0/255.0 alpha:1];
    
    //Pane Labels
    float paneLabelX = paneGap;
    float paneLabelY;
    float paneLabelWidth = (paneWidth - (paneGap * 2));
    CGRect paneLabelFrame;
    
    //Pane Label1
    paneLabelY = paneGap;
    paneLabelFrame = CGRectMake(paneLabelX, paneLabelY, paneLabelWidth, paneItemHeight);
    
    UILabel *branchInfoPaneLabel1 = [UILabel new];
    [self.branchesPane addSubview:branchInfoPaneLabel1];
    
    branchInfoPaneLabel1.frame = paneLabelFrame;
    branchInfoPaneLabel1.textColor = [UIColor whiteColor];
    branchInfoPaneLabel1.textAlignment = NSTextAlignmentCenter;
    branchInfoPaneLabel1.text = @"texto1";
    
    //Pane Label2
    paneLabelY = paneGap + paneItemHeight + paneGap;
    paneLabelFrame = CGRectMake(paneLabelX, paneLabelY, paneLabelWidth, paneItemHeight);
    
    UILabel *branchInfoPaneLabel2 = [UILabel new];
    [self.branchesPane addSubview:branchInfoPaneLabel2];
    
    branchInfoPaneLabel2.frame = paneLabelFrame;
    branchInfoPaneLabel2.textColor = [UIColor whiteColor];
    branchInfoPaneLabel2.textAlignment = NSTextAlignmentCenter;
    branchInfoPaneLabel2.text = @"texto2";
    
    //Buttons
    float paneButtonX;
    float paneButtonY = paneGap + paneItemHeight + paneGap + paneItemHeight + paneGap;
    float paneButtonWidth = (paneWidth - (paneGap * 3)) / 2;
    CGRect paneButtonFrame;
    
    //Cancel Button
    UIButton *branchInfoPaneButtonCancel = [UIButton new];
    [self.branchesPane addSubview:branchInfoPaneButtonCancel];
    
    paneButtonX = paneGap;
    
    paneButtonFrame = CGRectMake(paneButtonX, paneButtonY, paneButtonWidth, paneItemHeight);
    branchInfoPaneButtonCancel.frame = paneButtonFrame;
    [branchInfoPaneButtonCancel addTarget:self action:@selector(null) forControlEvents:UIControlEventTouchUpInside];
    
    //Cancel Button Label
    UILabel *branchInfoPaneButtonCancelLabel = [UILabel new];
    [branchInfoPaneButtonCancel addSubview:branchInfoPaneButtonCancelLabel];
    
    branchInfoPaneButtonCancelLabel.frame = CGRectMake(0, 0, paneButtonWidth, paneItemHeight);
    branchInfoPaneButtonCancelLabel.textAlignment = NSTextAlignmentCenter;
    branchInfoPaneButtonCancelLabel.textColor = [UIColor whiteColor];
    branchInfoPaneButtonCancelLabel.text = @"Cancel";
    
    //OK Button
    UIButton *branchInfoPaneButtonOK = [UIButton new];
    [self.branchesPane addSubview:branchInfoPaneButtonOK];
    branchInfoPaneButtonOK.tag = 0;
    [branchInfoPaneButtonOK addTarget:self action:@selector(null) forControlEvents:UIControlEventTouchUpInside];
    
    paneButtonX = paneGap + paneButtonWidth + paneGap;
    paneButtonFrame = CGRectMake(paneButtonX, paneButtonY, paneButtonWidth, paneItemHeight);
    branchInfoPaneButtonOK.frame = paneButtonFrame;
    
    //OK Button Label
    UILabel *branchInfoPaneButtonOKLabel = [UILabel new];
    [branchInfoPaneButtonOK addSubview:branchInfoPaneButtonOKLabel];
    
    branchInfoPaneButtonOKLabel.frame = CGRectMake(0, 0, paneButtonWidth, paneItemHeight);
    branchInfoPaneButtonOKLabel.textAlignment = NSTextAlignmentCenter;
    branchInfoPaneButtonOKLabel.textColor = [UIColor whiteColor];
    branchInfoPaneButtonOKLabel.text = @"Ok";
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
