//
//  ZeroMoneyLotteryModel.h
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-4.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZeroMoneyLotteryModel : NSObject
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *total_count;
@property (nonatomic,copy)NSString *origin_price;
@property (nonatomic,copy)NSString *lottery_notice;
@property (nonatomic,copy)NSString *join_count;
@property (nonatomic,retain)NSArray *imageArr;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
