//
//  TabScrollerViewTableViewCell.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-29.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabScrollerViewTableViewCell : UITableViewCell<UIScrollViewDelegate>
@property (nonatomic,retain)UIScrollView *TabScroll;
@property (nonatomic,retain)UIPageControl *pageCon;


@end
