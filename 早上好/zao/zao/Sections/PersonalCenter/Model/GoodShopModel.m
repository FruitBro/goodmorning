//
//  GoodShopModel.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/6.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "GoodShopModel.h"

@implementation GoodShopModel
- (void)dealloc{
    [_info release];
    [_date release];
    [_discount release];
    [_pic release];
    [_title release];
    [_logo release];
    [super dealloc];
}

//自定义初始化
- (id)initWithDic:(NSDictionary *)dic;{
    self = [super init];
    if (self) {
        self.info = [dic objectForKey:@"info"];
        self.discount = [dic objectForKey:@"discount"];
        self.date = [dic objectForKey:@"date"];
        self.logo = [dic objectForKey:@"logo"];
        self.pic = [dic objectForKey:@"pic"];
        self.title = [dic objectForKey:@"title"];
    }
    return self;
    
}
@end
