//
//  SearchTableViewController.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/5.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchTableViewControllerDelegate <NSObject>



-(void)pushToDetialSearchView:(id)data;



@end



@interface SearchTableViewController : UITableViewController
@property (nonatomic,retain)id<SearchTableViewControllerDelegate>delegate;
@property (nonatomic,retain)NSMutableArray *recevieArray;
@end
