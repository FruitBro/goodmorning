//
//  TodayUpdateGoodsListTableViewCell.h
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-2.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "brandDetailListModel.h"
@interface TodayUpdateGoodsListTableViewCell : UITableViewCell
@property (nonatomic,retain)UILabel *baoyouLabel;
@property (nonatomic,retain)UILabel *priceLabel;
@property (nonatomic,retain)UILabel *sales_countLabel;
@property (nonatomic,retain)UILabel *list_priceLabel;
@property (nonatomic,retain)UILabel *source_typeLabel;
@property (nonatomic,retain)UILabel *short_titleLabel;
@property (nonatomic,retain)UIImageView *bigView;
- (void)configureCellWithModel:(brandDetailListModel *)model;
@end
