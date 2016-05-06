//
//  brandDetailListModel.h
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-7-31.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface brandDetailListModel : NSObject
@property (nonatomic,copy)NSString *baoyou;
@property (nonatomic,copy)NSString *big;
@property (nonatomic,copy)NSString *price;
@property (nonatomic,copy)NSString *sales_count;
@property (nonatomic,copy)NSString *list_price;
@property (nonatomic,copy)NSString *source_type;
@property (nonatomic,copy)NSString *short_title;
@property (nonatomic,copy)NSString *wap_url;
@property (nonatomic,copy)NSString *expire_time;
- (id)initWithDic:(NSDictionary *)dic;
@end
