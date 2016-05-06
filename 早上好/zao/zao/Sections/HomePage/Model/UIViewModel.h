//
//  UIViewModel.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIViewModel : NSObject
@property (nonatomic,retain)NSString *title;
@property (nonatomic,retain)NSString *content;
@property (nonatomic,retain)NSString *pic;
-(id)initWithDictionary:(NSDictionary *)dic;

@end
