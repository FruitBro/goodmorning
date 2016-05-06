//
//  UIViewModel.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "UIViewModel.h"

@implementation UIViewModel
-(void)dealloc{
    [_title release];
    [_content release];
    [_pic release];
    [super dealloc];
}
-(id)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        self.title = [dic objectForKey:@"title"];
        self.content = [dic objectForKey:@"content"];
        self.pic = [dic objectForKey:@"pic"];
    }
    return self;
}
@end
