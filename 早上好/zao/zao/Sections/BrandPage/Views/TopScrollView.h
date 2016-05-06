//
//  TopScrollView.h
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-7-30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol topScrollViewDelegate <NSObject>

-(void)handleClickThebutton:(UIButton *)sender;

@end

@interface TopScrollView : UIView
@property (nonatomic,retain)UIScrollView * scrollView;
@property (nonatomic, retain)NSMutableArray *itemsArr;
@property (nonatomic,assign)id<topScrollViewDelegate>delegate;
@property (nonatomic,retain)UIButton *topScrollButton;
@property (nonatomic,retain)NSArray *buttonArr;
@end
