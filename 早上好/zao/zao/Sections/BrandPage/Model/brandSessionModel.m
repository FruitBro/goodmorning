//
//  brandSessionModel.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-7-30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "brandSessionModel.h"

@implementation brandSessionModel
- (id)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.low_price = [dic objectForKey:@"low_price"];
        self.special_name = [dic objectForKey:@"special_name"];
        self._id = [dic objectForKey:@"id"];
        //self.begin_time = [dic objectForKey:@"expire_time"];
        NSArray *arr = [dic objectForKey:@"deals"];
        NSDictionary *di = [arr objectAtIndex:0];
        
        self.expire_time = [di objectForKey:@"expire_time"];
        NSDictionary *Dic = [dic objectForKey:@"brand_image_url"];
        NSString *str = [Dic objectForKey:@"normal"];
        if (str.length) {
            
            self.brand_image_url = [str substringToIndex:[str length]-5];
        }
        self.title = [dic objectForKey:@"title"];
        self.logo_image = [dic objectForKey:@"logo_image"];

            }
    return self;
}






@end
