//
//  ValuetrivelModel.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-3.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ValuetrivelModel : NSObject
@property (nonatomic,retain)NSString *imageUrl;
@property (nonatomic,copy)NSString * pic_height;
@property (nonatomic,assign)NSInteger pic_width;
@property (nonatomic,retain)NSString *recommend_reason;
-(id)initWithDictionary:(NSDictionary *)dic;

@end
