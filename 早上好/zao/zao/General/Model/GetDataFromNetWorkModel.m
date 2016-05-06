//
//  GetDataFromNetWorkModel.m
//  LessonGETRequest——7.17
//
//  Created by lanouhn on 15/7/18.
//  Copyright (c) 2015年 袁琳. All rights reserved.
//

#import "GetDataFromNetWorkModel.h"

@implementation GetDataFromNetWorkModel
//进行网络请求的方法  （将传过来的字符串 进行异步GET请求）
- (void)asynchronizeRequestByGET:(NSString *)urlStr{
    //1.创建NSURL对象
    NSURL *url = [NSURL URLWithString:urlStr];
    //2.创建NSURLRequest请求类对象
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    //3.进行网络请求链接
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //代理传值 将网络请求到的data数据  传给指定的代理对象
        if (self.delegate && [self.delegate respondsToSelector:@selector(getData:)]) {
            //传值
            [self.delegate getData:data];
        }
        
    }];
}
@end
