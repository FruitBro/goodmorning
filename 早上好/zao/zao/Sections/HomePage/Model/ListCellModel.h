//
//  ListCellModel.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListCellModel : NSObject
@property (nonatomic,retain)NSString *short_title;
@property (nonatomic,retain)NSString *price;
@property (nonatomic,retain)NSString *list_price;
@property (nonatomic,retain)NSString *sale_count;
@property (nonatomic,retain)NSString *wap_url;
@property (nonatomic,retain)NSString *baoyou;
@property (nonatomic,retain)NSString *image_url;
-(id)initWithDictionary:(NSDictionary *)dic;
@end
