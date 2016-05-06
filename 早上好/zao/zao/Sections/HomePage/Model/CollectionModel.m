//
//  CollectionModel.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "CollectionModel.h"

@implementation CollectionModel
-(void)dealloc{
    [_category_name release];
    [_url_name release];
    [_pic release];
    [super dealloc];
}
-(id)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
      self.category_name = [dic objectForKey:@"category_name"];
        self.url_name = [dic objectForKey:@"url_name"];
        self.pic = [dic objectForKey:@"pic"];
       
    }
    return self;
}
@end
