//
//  HeaderView.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/7/30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView
- (void)dealloc{
    [_headerLabel release];
    [super dealloc];
    
}
//重写初始化方法
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //创建对象
        self.headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.frame.size.height)];
        //self.headerLabel.backgroundColor = [UIColor orangeColor];
        self.headerLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.headerLabel];
        [self.headerLabel release];
    }
    return self;
}

- (void)layoutSubviews{
    self.headerLabel.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,self.frame.size.height);
    
}



@end
