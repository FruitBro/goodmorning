//
//  ThemeModel.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/2.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThemeModel : NSObject
@property (nonatomic,retain)NSString *pictupian;//图片网址
@property (nonatomic,retain)NSString *wap_url;//拼接网址
@property (nonatomic,retain)NSString *url_name;//型号
@property (nonatomic,retain)NSString *title;//
@property (nonatomic,retain)NSString *idd;
//自定义初始化
- (id)initWithDic:(NSDictionary *)dic;
@end
