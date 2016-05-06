//
//  TodayUpdateTableViewCell.h
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "todayUpdateModel.h"
@interface TodayUpdateTableViewCell : UITableViewCell

@property (nonatomic,retain)UIScrollView *scrollView;
@property (nonatomic,retain)UIPageControl *pageController;
@property (nonatomic,retain)NSArray *scrollImageArr;
- (void)configuresCcrollImagesView;

@end