//
//  ScrollModel.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/2.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScrollModel : NSObject
@property (nonatomic,retain)NSString *wap_url;
@property (nonatomic,retain)NSString *image_big_ios_url;


//自定义初始化
- (id)initWithDic:(NSDictionary *)dic;


@end
