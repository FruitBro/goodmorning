//
//  TopperTwoBrandView.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-7-30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "TopperTwoBrandView.h"
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@implementation TopperTwoBrandView
- (void)dealloc{
    [_leftButton release];
    [_rightButton release];
    [super dealloc];
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.frame = CGRectMake(40, 30, kScreenWidth/4, 40);
        [_leftButton setTitle:nil forState:UIControlStateNormal];
        _leftButton.titleLabel.font = [UIFont systemFontOfSize:22];
        _leftButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.frame = CGRectMake(40, 30, kScreenWidth/4, 40);
        [_rightButton setTitle:nil forState:UIControlStateNormal];
        _rightButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:22];
        UIImageView *leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/37.5, kScreenHeight/60, (kScreenWidth - kScreenWidth/37.5 *3)/2, kScreenHeight/7.8)];
        leftImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"4" ofType:@"jpg"]];
        //leftImageView.backgroundColor = [UIColor redColor];
        leftImageView.userInteractionEnabled = YES;
        UIImageView *rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth-(kScreenWidth - kScreenWidth/37.5 *3)/2-kScreenWidth/37.5, kScreenHeight/60, (kScreenWidth - kScreenWidth/37.5 *3)/2, kScreenHeight/7.8)];
        rightImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"jpg"]];
        //rightImageView.backgroundColor = [UIColor  blueColor];
        rightImageView.userInteractionEnabled = YES;
        [leftImageView addSubview:_leftButton];
        [rightImageView addSubview:_rightButton];
        [self addSubview:leftImageView];
        [self addSubview:rightImageView];
        
        [leftImageView release];
        [rightImageView release];
        
    }
    return self;
}
@end
