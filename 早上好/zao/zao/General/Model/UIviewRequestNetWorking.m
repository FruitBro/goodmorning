//
//  UIviewRequestNetWorking.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-31.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "UIviewRequestNetWorking.h"
#import "AFNetworking.h"
@implementation UIviewRequestNetWorking
-(void)getUIViewRequestInterNet:(NSString *)string{
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    [manager GET:string parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(configurationUIViewModelWithRequsetData:)]) {
            [self.delegate configurationUIViewModelWithRequsetData:responseObject];
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
//    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
//    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"netWork"]integerValue]<1) {
//        [manager GET:string parameters:nil timeoutInterval:-1 cachePolicy:NSURLRequestUseProtocolCachePolicy success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            if (self.delegate && [self.delegate respondsToSelector:@selector(configurationUIViewModelWithRequsetData:)]) {
//                            [self.delegate configurationUIViewModelWithRequsetData:responseObject];
//                        }
//            
//            
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            
//        }];
//        
//    }else{
//        [manager GET:string parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            if (self.delegate && [self.delegate respondsToSelector:@selector(configurationUIViewModelWithRequsetData:)]) {
//                            [self.delegate configurationUIViewModelWithRequsetData:responseObject];
//                        }
//
//            
//            
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            
//        }];
//    }

    
}

@end
