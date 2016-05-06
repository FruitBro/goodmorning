//
//  CustomCell.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/7/30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "CustomCell.h"
#import "SizeMacros.h"
@implementation CustomCell
- (void)dealloc{
    [_titleLabel release];
    [_imageView release];
    [super dealloc];
}
//重写初始化方法
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor redColor];
        //创建titelabel
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/37.5, kScreenHeight/8.33,kScreenWidth/6.25 ,kScreenHeight/33.35)];
        
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel release];
        //创建imageView
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/37.5, kScreenHeight/66.7, kScreenWidth/6.25, kScreenHeight/9.528)];
        [self.contentView addSubview:self.imageView];
        [self.imageView release];
    }
    return self;
}
@end
