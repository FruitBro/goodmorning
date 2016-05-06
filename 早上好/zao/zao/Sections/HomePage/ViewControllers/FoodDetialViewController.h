//
//  FoodDetialViewController.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodDetialViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)NSMutableString *receiveWapUrlString;
@property (nonatomic,retain)UITableView *tableView;
@property (nonatomic,retain)NSArray *receiveArray;

@end
