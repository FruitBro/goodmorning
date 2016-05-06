//
//  MJReloadDate.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-4.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "MJRefresh.h"
#import "NetWorkRequset.h"
@interface MJReloadDate : NSObject<netWorkRequsetDelegate>
//下拉刷新的方法
-(void)theDropDownReload:(UITableViewController *)table
         dataSourceArray:(NSMutableArray *)data
                 wap_url:(NSString *)wap_url;

@end
