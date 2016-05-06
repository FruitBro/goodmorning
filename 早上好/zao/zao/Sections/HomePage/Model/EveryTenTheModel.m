//
//  EveryTenTheModel.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "EveryTenTheModel.h"

@implementation EveryTenTheModel
-(void)dealloc{
    [_short_tiele release];
    [_image_url release];
    [_price release];
    [_recommend_reason release];
    [_related_recommed release];
    [_wap_url release];
    [super dealloc];
}
-(id)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        self.short_tiele = [dic objectForKey:@"short_title"];
        self.image_url = [dic objectForKey:@"image_url"];
        self.price = [[dic objectForKey:@"price"]stringValue];
        self.recommend_reason = [dic objectForKey:@"recommend_reason"];
        self.related_recommed = [[[dic objectForKey:@"related_recommend"] firstObject]objectForKey:@"value"];
        self.wap_url = [dic objectForKey:@"wap_url"];
    }
    return self;
}
@end
