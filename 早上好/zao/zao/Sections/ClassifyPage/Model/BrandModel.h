//
//  BrandModel.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/3.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BrandModel : NSObject
//brand_url_name 判断依据      logo_image标志图片

@property (nonatomic,retain)NSString *logo_image;
@property (nonatomic,retain)NSString *brand_url_name;
@property (nonatomic,retain)NSString *name;
@property (nonatomic,retain)NSString *idd;
//自定义初始化
- (id)initWithDic:(NSDictionary *)dic;
@end
