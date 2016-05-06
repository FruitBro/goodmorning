//
//  todayUpdateModel.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "todayUpdateModel.h"

@implementation todayUpdateModel
- (void)dealloc{
    [_image_big_ios_url release];
    [super dealloc];
}
- (id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        self.image_big_ios_url = [dic objectForKey:@"image_big_ios_url"];
    }
    return self;
}






@end