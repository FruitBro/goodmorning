//
//  TabScrollerModel.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TabScrollerModel : NSObject
@property (nonatomic,retain)NSString *wap_url;
@property (nonatomic,retain)NSString *image_big_ios_url;
-(id)initWithDictionary:(NSDictionary *)dic;
@end
