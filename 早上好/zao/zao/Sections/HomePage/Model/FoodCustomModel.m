//
//  FoodCustomModel.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-2.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "FoodCustomModel.h"

@implementation FoodCustomModel
-(void)dealloc{
    [_price release];
    [_shortTitle release];
    [_image_url release];
    [_wap_url release];
    [_standard release];
    [_salesCount release];
    [_good_comment_rate release];
    [super dealloc];
}
-(id)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        self.price = [[dic objectForKey:@"price"]stringValue];
        self.shortTitle = [dic objectForKey:@"short_title"];
        self.image_url = [[dic objectForKey:@"image_url"]objectForKey:@"normal"];
        self.wap_url = [dic objectForKey:@"wap_url"];
        self.standard = [dic objectForKey:@"standard"];
        self.salesCount = [[dic objectForKey:@"sales_count"]stringValue];
        self.good_comment_rate = [[dic objectForKey:@"good_comment_rate"]stringValue];
    }
    return self;
}
@end
