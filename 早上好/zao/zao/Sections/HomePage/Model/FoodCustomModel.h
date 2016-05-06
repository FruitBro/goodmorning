//
//  FoodCustomModel.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-2.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodCustomModel : NSObject
@property (nonatomic,retain)NSString *price;
@property (nonatomic,retain)NSString *shortTitle;
@property (nonatomic,retain)NSString *image_url;
@property (nonatomic,retain)NSString *wap_url;
@property (nonatomic,retain)NSString *standard;
@property (nonatomic,retain)NSString *salesCount;
@property (nonatomic,retain)NSString *good_comment_rate;
-(id)initWithDictionary:(NSDictionary *)dic;
@end
