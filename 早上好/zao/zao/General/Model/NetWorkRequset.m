//
//  NetWorkRequset.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-29.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "NetWorkRequset.h"
#import "AFNetworking.h"

static NetWorkRequset *netRequset = nil;
@implementation NetWorkRequset
-(void)dealloc{
    [_MutArray release];

    [super dealloc];
}
+(NetWorkRequset *)shareNetWorkRequset{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netRequset = [[NetWorkRequset alloc]init];
    });
    return netRequset;
}
+(void)getNetRequset:(NSString *)string{
    
//    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
//    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"network"]integerValue]<1) {
//        [manager GET:string parameters:nil timeoutInterval:-1 cachePolicy:NSURLRequestUseProtocolCachePolicy success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            
//            if (netRequset.delegate &&[netRequset.delegate respondsToSelector:@selector(conllectionViewReload:)]) {
//                [netRequset.delegate conllectionViewReload:responseObject];
//            }
//            
//            
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            
//        }];
//        
//    }else{
//        [manager GET:string parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            if (netRequset.delegate &&[netRequset.delegate respondsToSelector:@selector(conllectionViewReload:)]) {
//                [netRequset.delegate conllectionViewReload:responseObject];
//            }
//
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            
//        }];
//    }
    AFHTTPRequestOperationManager *manger = [[AFHTTPRequestOperationManager alloc] init];
   
    
   [manger GET:string parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
       if (netRequset.delegate &&[netRequset.delegate respondsToSelector:@selector(conllectionViewReload:)]) {
                           [netRequset.delegate conllectionViewReload:responseObject];
                       }
       
       
       
       
       
   } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    
   }];
    
    
  
    
}



- (void)getNetRequset:(NSString *)string
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    [manager GET:string parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.MutArray = responseObject;
        
        
        
        if (self.delegate &&[self.delegate respondsToSelector:@selector(conllectionViewReload:)]) {
            [self.delegate conllectionViewReload:responseObject];
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}






+(void)getNetRequsetNotData:(NSString *)string{
    AFHTTPRequestOperationManager *manger = [[AFHTTPRequestOperationManager alloc]init];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manger GET:string parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (netRequset.delegate && [netRequset.delegate respondsToSelector:@selector(webViewRequest:)]) {
            [netRequset.delegate webViewRequest:responseObject];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
@end
