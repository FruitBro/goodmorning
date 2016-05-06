//
//  ThemePavilionsViewCell.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/2.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "ThemePavilionsViewCell.h"
#import "SizeMacros.h"
@implementation ThemePavilionsViewCell
- (void)dealloc{
    [_themeView release];
    [super dealloc];
}

//
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.themeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/1.56, kScreenHeight/6.67)];
        //self.themeView.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:self.themeView];
    }
    return self;
}
















@end
