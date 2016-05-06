//
//  BrandSessionTableViewCell.h
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-7-30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "brandSessionModel.h"
@interface BrandSessionTableViewCell : UITableViewCell
@property (nonatomic,retain)UIImageView *brand_image_urlView;
@property (nonatomic,retain)UILabel *special_nameLabel;
@property (nonatomic,retain)UILabel *low_priceLabel;
@property (nonatomic,retain)UILabel *newOrRestTimeLable;
@property (nonatomic,retain)UIImageView * brand_image_url;
- (void)configureCellWithModel:(brandSessionModel *)model;
- (void)configureHotBrandCellWithModel:(brandSessionModel *)model;
@end
