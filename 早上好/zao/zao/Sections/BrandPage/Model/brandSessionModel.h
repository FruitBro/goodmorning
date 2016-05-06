//
//  brandSessionModel.h
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-7-30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface brandSessionModel : NSObject
@property (nonatomic,copy)NSString *special_name;
@property (nonatomic,copy)NSString *low_price;
@property (nonatomic,copy)NSString *brand_image_url;
@property (nonatomic,copy)NSString *logo_image;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *_id;
//@property (nonatomic,copy)NSString *begin_time;
@property (nonatomic,copy)NSString *expire_time;

- (id)initWithDic:(NSDictionary *)dic;
@end
