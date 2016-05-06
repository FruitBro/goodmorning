//
//  LowerView.h
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-6.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LowerView : UIView

@property (nonatomic,retain)UILabel *total_countLabel;
@property (nonatomic,retain)UILabel *titleLabel;
@property (nonatomic,retain)UILabel *origin_priceLabel;
@property (nonatomic,retain)UILabel *lottery_noticeLabel;
@property (nonatomic,retain)UILabel *join_countLabel;
@property (nonatomic,retain)UILabel *priceLabel;
@property (nonatomic,retain)UIButton *joinButton;
- (void)configureUIViewWithData:(id)data;
@end
