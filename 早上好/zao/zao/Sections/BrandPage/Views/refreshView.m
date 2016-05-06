//
//  refreshView.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-7.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "refreshView.h"
#import "SizeMacros.h"

@implementation refreshView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        NSArray *arr = @[@"默认",@"销量",@"价格"];
        for (int i = 0; i < 3; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(kScreenWidth/3*i, 3, kScreenWidth/3, kScreenWidth/375*30);
            //button.backgroundColor = [UIColor redColor];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitle:arr[i] forState:UIControlStateNormal];
            button.tag = 100+i;
            [self addSubview:button];
        }
        
    }
    return self;
}

@end
