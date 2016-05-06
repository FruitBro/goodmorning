//
//  ClassifyModel.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/7/31.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassifyModel : NSObject
@property (nonatomic,retain)NSString *short_title;//标题
@property (nonatomic,retain)NSString *image_url;//图片
@property (nonatomic,retain)NSString *price;//现价
@property (nonatomic,retain)NSString *list_price;//原价
@property (nonatomic,retain)NSString *baoyou;//包邮
@property (nonatomic,retain)NSString *sales_count;//已售
@property (nonatomic,retain)NSString *wap_url;//进入响应的页面网址
//自定义初始化
- (id)initWithDic:(NSDictionary *)dic;

@end
