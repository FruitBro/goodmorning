//
//  CustomCollectionViewCell.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "CustomCollectionViewCell.h"
#import "SizeMacros.h"
@implementation CustomCollectionViewCell
-(void)dealloc{
    [_imageView release];
    [_titleCollectionLabel release];
    [super dealloc];
}


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/12, kScreenHeight/32, kScreenWidth/12, kScreenWidth/12)];
//        self.imageView.backgroundColor = [UIColor purpleColor];
        [self.contentView addSubview:self.imageView];
        [self.imageView release];
        self.titleCollectionLabel  = [[UILabel alloc]initWithFrame:CGRectMake(0, kScreenHeight/8-20, kScreenWidth/4, 20)];
        self.titleCollectionLabel.adjustsFontSizeToFitWidth = YES;
      self.titleCollectionLabel.textColor = [UIColor blackColor];
//        self.titleCollectionLabel.backgroundColor = [UIColor whiteColor];
        self.titleCollectionLabel.textAlignment = NSTextAlignmentCenter;
        self.titleCollectionLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.titleCollectionLabel];
    }
    return self;
}
@end
