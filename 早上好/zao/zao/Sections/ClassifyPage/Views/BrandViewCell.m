//
//  BrandViewCell.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/3.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "BrandViewCell.h"
#import "SizeMacros.h"
@implementation BrandViewCell
- (void)dealloc{
    [_brandView release];
    [super dealloc];
}

//重写初始化
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //创建lable对象
        self.brandView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/6, kScreenWidth/9)];
        [self.contentView addSubview:self.brandView];
        [self.brandView release];
    }
    return self;
}






@end
