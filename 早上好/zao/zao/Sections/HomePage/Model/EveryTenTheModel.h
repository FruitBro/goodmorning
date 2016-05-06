//
//  EveryTenTheModel.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EveryTenTheModel : NSObject
@property (nonatomic,retain)NSString *short_tiele;
@property (nonatomic,retain)NSString *price;
@property (nonatomic,retain)NSString *image_url;
@property (nonatomic,retain)NSString *recommend_reason;
@property (nonatomic,retain)NSString *related_recommed;
@property (nonatomic,retain)NSString *wap_url;
-(id)initWithDictionary:(NSDictionary *)dic;
@end
