//
//  ThemeModel.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/2.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "ThemeModel.h"

@implementation ThemeModel
- (void)dealloc{
    [_pictupian release];
    [_wap_url release];
    [_url_name release];
    [_title release];
    [super dealloc];
}
//自定义初始化
- (id)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.pictupian = [dic objectForKey:@"pic"];
        self.wap_url = [dic objectForKey:@"wap_url"];
        self.url_name = [dic objectForKey:@"url_name"];
        self.title = [dic objectForKey:@"title"];
        self.idd = [dic objectForKey:@"id"];
    }
    return self;
}
@end
