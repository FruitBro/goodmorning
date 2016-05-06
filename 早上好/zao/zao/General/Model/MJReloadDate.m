//
//  MJReloadDate.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-4.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "MJReloadDate.h"

@implementation MJReloadDate
-(void)theDropDownReload:(UITableViewController *)table
dataSourceArray:(NSMutableArray *)data
wap_url:(NSString *)wap_url{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        //refresh data
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [NetWorkRequset shareNetWorkRequset].delegate = self;
            [NetWorkRequset getNetRequset:wap_url];
         
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [table.tableView reloadData];//重载table view.
                [table.tableView.header endRefreshing];         //关闭刷新效果
            });
            
        });
        
        
        /*
         header.lastUpdatedTimeLabel.hidden = YES;
         header.stateLabel.hidden = YES;
         [header setTitle:@"Pull down to refresh" forState:MJRefreshStateIdle];
         [header setTitle:@"Release to refresh" forState:MJRefreshStatePulling];
         [header setTitle:@"Loading ..." forState:MJRefreshStateRefreshing];
         
         // setup font
         header.stateLabel.font = [UIFont systemFontOfSize:15];
         header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:12];
         
         //setup color
         header.stateLabel.textColor = [UIColor redColor];
         header.lastUpdatedTimeLabel.textColor = [UIColor grayColor];
         
         */
    }];
    
    table.tableView.header = header;
    

}
@end
