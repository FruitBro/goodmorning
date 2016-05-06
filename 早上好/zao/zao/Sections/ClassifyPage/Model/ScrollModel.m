//
//  ScrollModel.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/2.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "ScrollModel.h"

@implementation ScrollModel
- (void)dealloc{
    [_image_big_ios_url release];
    [_wap_url release];
    [super dealloc];
}

//自定义初始化
- (id)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.image_big_ios_url = [dic objectForKey:@"image_big_ios_url"];
        self.wap_url = [dic objectForKey:@"wap_url"];
    }
    return self;
}







@end
