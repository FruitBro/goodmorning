//
//  tabScrollNetRequest.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-31.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol tabScrollNetRequestDelegate <NSObject>

-(void)configurationTabScrollModelWithRequsetData:(id)data;

@end
@interface tabScrollNetRequest : NSObject
@property (nonatomic,retain)id<tabScrollNetRequestDelegate>delegate;
-(void)getTabScrollRequestInterNet:(NSString *)string;
@end
