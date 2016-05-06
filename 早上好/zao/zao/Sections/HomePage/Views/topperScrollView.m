//
//  topperScrollView.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-6.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "topperScrollView.h"
#import "SizeMacros.h"

@interface topperScrollView()
@property(nonatomic,retain)UIPageControl *pageController;
@end
@implementation topperScrollView

- (void)dealloc{
    [_ImageView release];
    [_pageController release];
    [super dealloc];
}
- (UIImageView *)ImageView{
    if (_ImageView == nil) {
        self.ImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/4)]autorelease];
        self.ImageView.backgroundColor = [UIColor greenColor];
    }
    return [[_ImageView retain]autorelease];
}
- (UIPageControl *)pageController{
    if (_pageController == nil) {
        self.pageController = [[[UIPageControl alloc]initWithFrame:CGRectMake(kScreenWidth-kScreenWidth/3.75,self.frame.size.height-kScreenWidth/375*50 , kScreenWidth/3.75, kScreenWidth/375*50)]autorelease];
    }
    return [[_pageController retain]autorelease];
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.ImageView];
        self.pagingEnabled = YES;
    }
    return self;
}






@end
