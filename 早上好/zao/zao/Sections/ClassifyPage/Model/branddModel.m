//
//  branddModel.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/4.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "branddModel.h"

@implementation branddModel
- (void)dealloc{
    [_baoyou release];
    [_soure_type release];
    [_price release];
    [_list_price release];
    [_wap_url release];
    [_title release];
    [_sales_count release];
    [_begin_time release];
    [_expire_time release];
    
    [_normal release];
    [super dealloc];
}

//自定义初始化
- (id)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.title = [dic objectForKey:@"short_title"];
        self.list_price = [dic objectForKey:@"list_price"];
        self.price = [dic objectForKey:@"price"];
        self.baoyou = [dic objectForKey:@"baoyou"];
        self.wap_url = [dic objectForKey:@"wap_url"];
        self.soure_type = [dic objectForKey:@"soure_type"];
        self.normal = [[dic objectForKey:@"image_url"] objectForKey:@"normal"];
        self.begin_time = [dic objectForKey:@"begin_time"];
        self.expire_time = [dic objectForKey:@"expire_time"];
        
        self.sales_count = [dic objectForKey:@"sales_count"];
    }
    return self;
}


@end
