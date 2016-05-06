//
//  ZeroMoneyLotteryModel.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-4.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "ZeroMoneyLotteryModel.h"

@implementation ZeroMoneyLotteryModel

- (void)dealloc{
    [_title release];
    [_total_count release];
    [_origin_price release];
    [_lottery_notice release];
    [_imageArr release];
    [_join_count release];
    [super dealloc];
}
- (instancetype)initWithDic:(NSDictionary *)dic{
    self =[super init];
    if (self) {
        self.title = [dic objectForKey:@"title"];
        self.total_count = [dic objectForKey:@"total_count"];
        self.origin_price = [dic objectForKey:@"origin_price"];
        self.lottery_notice = [dic objectForKey:@"lottery_notice"];
        self.imageArr = @[[dic objectForKey:@"image"]];
        self.join_count = [dic objectForKey:@"join_count"];
    }
    return self;
}
@end
