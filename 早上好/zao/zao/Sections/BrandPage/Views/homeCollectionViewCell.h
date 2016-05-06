//
//  homeCollectionViewCell.h
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-4.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "brandSessionModel.h"


@protocol homeControllerDelegate <NSObject>

- (void)pushToBrandDetailListViewController:(brandSessionModel *)model;

@end
@interface homeCollectionViewCell : UICollectionViewCell<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)UITableView *tableView;
@property (nonatomic,retain)NSString *receiveURLStr;
@property (nonatomic,retain)id <homeControllerDelegate>delegate;

- (void)getURLstring;

@end
