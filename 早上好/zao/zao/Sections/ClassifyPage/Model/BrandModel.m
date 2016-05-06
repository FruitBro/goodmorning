//
//  BrandModel.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/3.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "BrandModel.h"

@implementation BrandModel
- (void)dealloc{
    [_brand_url_name release];
    [_logo_image release];
    [_name release];
    [super dealloc];

}
//自定义初始化
- (id)initWithDic:(NSDictionary *)dic{
 
    self = [super init];
    if (self) {
        self.logo_image = [dic objectForKey:@"logo_image"];
        self.brand_url_name = [dic objectForKey:@"brand_url_name"];
        self.name = [dic objectForKey:@"name"];
        self.idd = [dic objectForKey:@"id"];
    }
    return self;
}

@end
