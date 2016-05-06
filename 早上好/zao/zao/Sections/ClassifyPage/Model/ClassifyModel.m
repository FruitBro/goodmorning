//
//  ClassifyModel.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/7/31.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "ClassifyModel.h"

@implementation ClassifyModel
- (void)dealloc{
    [_baoyou release];
    [_short_title release];
    [_list_price release];
    [_sales_count release];
    [_image_url release];
    [_price release];
    [_wap_url release];
    [super dealloc];
}

//自定义初始化
- (id)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.short_title = [dic objectForKey:@"short_title"];
        self.price = [dic objectForKey:@"price"];
        self.list_price = [dic objectForKey:@"list_price"];
        self.sales_count = [dic objectForKey:@"sales_count"];
        self.image_url = [dic objectForKey:@"image_url"];
        self.baoyou = [dic objectForKey:@"baoyou"];
        self.wap_url = [dic objectForKey:@"wap_url"];
    }
    return self;
}









@end
