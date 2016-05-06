//
//  NetWorkRequset.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-29.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol netWorkRequsetDelegate <NSObject>

-(void)conllectionViewReload:(id)data;
-(void)webViewRequest:(id)data;
@end

@interface NetWorkRequset : NSObject
@property (nonatomic,retain)NSMutableArray *MutArray;
@property (nonatomic,assign)id<netWorkRequsetDelegate>delegate;
//创建单例对象
+(NetWorkRequset *)shareNetWorkRequset;
//GET网络请求
+(void)getNetRequset:(NSString *)string;
//GET网络请求 不解析数据
+(void)getNetRequsetNotData:(NSString *)string;
- (void)getNetRequset:(NSString *)string;
@end
