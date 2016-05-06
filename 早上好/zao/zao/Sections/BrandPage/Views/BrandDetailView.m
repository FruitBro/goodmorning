//
//  BrandDetailView.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-7-31.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "BrandDetailView.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#import "BrandDetailViewController.h"
#import "UIImageView+WebCache.h"
@implementation BrandDetailView
- (void)dealloc{
    [_backgroundImage release];
    [_special_nameLabel release];
    [_titleLabel release];
    [_logo_imageView release];
    
    [super dealloc];
}
- (UIImageView *)logo_imageView{
    if (_logo_imageView == nil) {
        self.logo_imageView = [[[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/2-kScreenWidth/12, kScreenHeight/16.67, kScreenWidth/6, kScreenHeight/10.9)]autorelease];
        self.logo_imageView.layer.cornerRadius = 29;
        self.logo_imageView.layer.masksToBounds = YES;
        self.logo_imageView.layer.borderColor = [UIColor grayColor].CGColor;
        self.logo_imageView.layer.borderWidth = .8;
    }
    return [[_logo_imageView retain]autorelease];
}

- (UILabel *)special_nameLabel{
    if (_special_nameLabel == nil) {
        self.special_nameLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2-kScreenWidth/3.92, kScreenHeight/16.9+kScreenHeight/12+kScreenHeight/16.67/5.2, kScreenWidth/2, 40)]autorelease];
        //self.special_nameLabel.backgroundColor = [UIColor greenColor];
        //self.special_nameLabel.adjustsFontSizeToFitWidth = YES;
        self.special_nameLabel.font = [UIFont systemFontOfSize:15];
        self.special_nameLabel.textAlignment = NSTextAlignmentCenter;
        self.special_nameLabel.textColor = [UIColor whiteColor];
    }
    return [[_special_nameLabel retain]autorelease];
}
- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        self.titleLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2-kScreenWidth/3.7,kScreenHeight/16.9+kScreenHeight/12+kScreenHeight/16.67/4+kScreenHeight/66.7+25 , kScreenWidth/1.7, 20)]autorelease];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        //self.titleLabel.adjustsFontSizeToFitWidth = YES;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel.textColor = [UIColor whiteColor];
    }
    return [[_titleLabel retain]autorelease];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.userInteractionEnabled = YES;
    if (self) {
        self.backgroundImage = [[UIImageView alloc]initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bg1" ofType:@"jpg"]]];
        _backgroundImage.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight/3.9);
        [self addSubview:_backgroundImage];
        [_backgroundImage release];
        [_backgroundImage addSubview:self.logo_imageView];
        [_backgroundImage addSubview:self.special_nameLabel];
        [_backgroundImage addSubview:self.titleLabel];
        _backgroundImage.userInteractionEnabled = YES;
        self.userInteractionEnabled = YES;
        

    }
    return self;
}














@end
