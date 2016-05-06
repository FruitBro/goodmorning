//
//  GetDataFromNetWorkModel.h
//  LessonGETRequest——7.17
//
//  Created by lanouhn on 15/7/18.
//  Copyright (c) 2015年 袁琳. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 此类用来封装网络请求的
 
 */

//定义一个协议
@protocol GetDataFromNetWorkModelDelegate <NSObject>

//声明一个协议方法  用来将网络请求得到的数据NSData传回给想使用的类
- (void)getData:(NSData *)data;

@end



@interface GetDataFromNetWorkModel : NSObject
@property (nonatomic,assign)id<GetDataFromNetWorkModelDelegate>delegate;//设置代理属性






//进行网络请求的方法  （将传过来的字符串 进行异步GET请求）
- (void)asynchronizeRequestByGET:(NSString *)urlStr;
@end
