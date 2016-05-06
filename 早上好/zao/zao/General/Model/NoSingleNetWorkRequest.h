//
//  NoSingleNetWorkRequest.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-31.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol noSingleNetWorkRequestDelegate <NSObject>

-(void)configurationModelWithRequsetData:(id)data;


@end

@interface NoSingleNetWorkRequest : NSObject
-(void)getRequestInterNet:(NSString *)string;
@property (nonatomic,assign)id<noSingleNetWorkRequestDelegate>delegate;

@end
