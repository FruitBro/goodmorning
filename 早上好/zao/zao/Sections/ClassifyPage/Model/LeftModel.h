//
//  LeftModel.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeftModel : NSObject
@property (nonatomic,retain)NSString *category_name;//名字
@property (nonatomic,retain)NSString *url_name;//型号
@property (nonatomic,retain)NSString *pic;//网址;
@property (nonatomic,retain)NSString *parent_url_name;//判断
@property (nonatomic,retain)NSString *idd;
//自定义初始化
- (id)initWithDic:(NSDictionary *)dic;
@end
