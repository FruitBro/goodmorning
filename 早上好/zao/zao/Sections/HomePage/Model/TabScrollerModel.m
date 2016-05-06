//
//  TabScrollerModel.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "TabScrollerModel.h"

@implementation TabScrollerModel
-(void)dealloc{
    [_wap_url release];
    [_image_big_ios_url release];
    [super dealloc];
}
-(id)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        self.wap_url = [dic objectForKey:@"wap_url"];
        self.image_big_ios_url = [dic objectForKey:@"image_big_ios_url"];
    }
    return self;
}

@end
