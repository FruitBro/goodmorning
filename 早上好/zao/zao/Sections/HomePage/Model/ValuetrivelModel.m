//
//  ValuetrivelModel.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-3.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "ValuetrivelModel.h"

@implementation ValuetrivelModel
-(void)dealloc{
    [_imageUrl release];
    [_recommend_reason release];
    [super dealloc];
}
-(id)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        self.imageUrl = [[dic objectForKey:@"image_url"]objectForKey:@"big"];
        self.pic_height = [dic objectForKey:@"share_url"];
        self.pic_width = (NSInteger)[dic objectForKey:@"pic_width"];
        self.recommend_reason = [dic objectForKey:@"short_title"];
    }
    return self;
}
@end
