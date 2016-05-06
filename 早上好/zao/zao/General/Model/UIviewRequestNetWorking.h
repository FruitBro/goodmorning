//
//  UIviewRequestNetWorking.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-31.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIviewRequestNetWorkingDelegate <NSObject>

-(void)configurationUIViewModelWithRequsetData:(id)data;

@end

@interface UIviewRequestNetWorking : NSObject
@property (nonatomic,assign)id<UIviewRequestNetWorkingDelegate>delegate;
-(void)getUIViewRequestInterNet:(NSString *)string;
@end
