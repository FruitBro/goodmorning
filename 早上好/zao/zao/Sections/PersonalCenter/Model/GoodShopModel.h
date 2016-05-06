//
//  GoodShopModel.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/6.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodShopModel : NSObject
@property (nonatomic,retain)NSString *logo;//
@property (nonatomic,retain)NSString *discount;
@property (nonatomic,retain)NSString *info;
@property (nonatomic,retain)NSString *pic;
@property (nonatomic,retain)NSString *date;
@property (nonatomic,retain)NSString *title;
//自定义初始化
- (id)initWithDic:(NSDictionary *)dic;
@end
