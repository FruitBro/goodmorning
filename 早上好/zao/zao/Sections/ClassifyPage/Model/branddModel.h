//
//  branddModel.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/4.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface branddModel : NSObject
@property (nonatomic,retain)NSString *title;//标题

@property (nonatomic,retain)NSString *normal;//图片
@property (nonatomic,retain)NSString *price;//现价
@property (nonatomic,retain)NSString *list_price;//原价
@property (nonatomic,retain)NSString *baoyou;//包邮
@property (nonatomic,retain)NSString *sales_count;//已售
@property (nonatomic,retain)NSString *soure_type;//天猫
@property (nonatomic,retain)NSString *wap_url;//进入响应的页面网址
@property (nonatomic,retain)NSString *begin_time;//开始时间
@property (nonatomic,retain)NSString *expire_time;//结束时间
- (id)initWithDic:(NSDictionary *)dic;
@end
