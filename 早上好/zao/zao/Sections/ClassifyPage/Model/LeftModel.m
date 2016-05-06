//
//  LeftModel.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "LeftModel.h"

@implementation LeftModel
- (void)dealloc{
    [_category_name release];
    [_url_name release];
    [_pic release];
    [_idd release];
    [super dealloc];
}
//自定义初始化
- (id)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        
        self.category_name = [dic objectForKey:@"category_name"];
        self.pic = [dic objectForKey:@"pic"];
        self.url_name  = [dic objectForKey:@"url_name"];
        self.parent_url_name = [dic objectForKey:@"parent_url_name"];
        self.idd = [dic objectForKey:@"id"];
        
        
        
        
    }
    return self;
}
@end
