//
//  brandDetailListModel.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-7-31.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "brandDetailListModel.h"

@implementation brandDetailListModel


- (id)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.baoyou = [dic objectForKey:@"baoyou"];
        self.wap_url = [dic objectForKey:@"wap_url"];
        self.expire_time = [dic objectForKey:@"expire_time"];
        
        NSDictionary *Dic = [dic objectForKey:@"image_url"];
        NSString *str = [Dic objectForKey:@"big"];
        
        if (![str hasSuffix:@"webp"]) {
             self.big = str;
        }else{
            NSString *Str = [str substringToIndex:[str length]-5];
            self.big = Str;
        }
        self.price = [dic objectForKey:@"price"];
        self.sales_count = [dic objectForKey:@"sales_count"];
        self.list_price = [dic objectForKey:@"list_price"];
        self.source_type = [dic objectForKey:@"source_type"];
        self.short_title = [dic objectForKey:@"short_title"];
    }
    return self;
}











@end
