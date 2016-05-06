//
//  todayUpdateModel.h
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface todayUpdateModel : NSObject
@property (nonatomic,retain)NSString *image_big_ios_url;

- (id)initWithDic:(NSDictionary *)dic;
@end