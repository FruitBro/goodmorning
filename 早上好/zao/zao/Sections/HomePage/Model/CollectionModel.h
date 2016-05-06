//
//  CollectionModel.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkRequset.h"

@interface CollectionModel : NSObject
@property (nonatomic,retain)NSString *category_name;
@property (nonatomic,retain)NSString *url_name;
@property (nonatomic,retain)NSString *pic;
-(id)initWithDictionary:(NSDictionary *)dic;


@end
