//
//  SchollCellModel.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "SchollCellModel.h"

@implementation SchollCellModel
//-(void)dealloc{
//    [_list_price release];
//    [_price release];
//    [_wap_url release];
//    [_sales_count release];
//    [_short_title release];
//    [super dealloc];
//}
//-(id)initWithDictionary:(NSDictionary *)dic{
//    if (self = [super init]) {
//        self.short_title = [dic objectForKey:@"short_title"];
//        self.price = [dic objectForKey:@"price"];
//        self.list_price = [dic objectForKey:@"list_price"];
//        self.wap_url = [dic objectForKey:@"wap_url"];
//        self.sales_count = [dic objectForKey:@"sales_count"];
//
//    }
//    return self;
//    }
-(void)dealloc{
    [_list_price release];
    [_price release];
    [_short_title release];
    [_sale_count release];
    [_wap_url release];
    [_baoyou release];
    [_image_url release];
    [super dealloc];
}
-(id)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        self.list_price = [[dic objectForKey:@"list_price"]stringValue];
        self.price = [[dic objectForKey:@"price"]stringValue];
        self.short_title = [dic objectForKey:@"short_title"];
        self.wap_url = [dic objectForKey:@"wap_url"];
        self.sale_count = [[dic objectForKey:@"sales_count"] stringValue];
        self.baoyou = [[dic objectForKey:@"baoyou"]stringValue];
        self.image_url = [[dic objectForKey:@"image_url"]objectForKey:@"hd1"];
    }
    return self;
}

@end
