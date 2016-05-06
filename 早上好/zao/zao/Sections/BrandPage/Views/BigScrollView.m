//
//  BigScrollView.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-3.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "BigScrollView.h"
#import "SizeMacros.h"
@implementation BigScrollView
- (void)dealloc{
    [_bigScrollView release];
    [super dealloc];
}
- (UIScrollView *)bigScrollView{
    if (_bigScrollView == nil) {
        self.bigScrollView = [[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64,kScreenWidth , kScreenHeight-64-44)]autorelease];
        self.bigScrollView.showsHorizontalScrollIndicator = YES;
        self.bigScrollView.bounces = YES;
        //self.bigScrollView.backgroundColor = [UIColor redColor];
        self.bigScrollView.alwaysBounceHorizontal = YES;
        self.bigScrollView.pagingEnabled = YES;
    }
    return [[_bigScrollView retain]autorelease];
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
       self.bigScrollView.contentSize = CGSizeMake(kScreenWidth*17, kScreenHeight-64-44);
        [self addSubview:self.bigScrollView];
    }
    return self;
}

@end
