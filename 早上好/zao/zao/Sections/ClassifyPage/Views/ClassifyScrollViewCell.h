//
//  ClassifyScrollViewCell.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/2.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassifyScrollViewCell : UITableViewCell
@property (nonatomic,retain)UIScrollView *scrollView;
@property (nonatomic,retain)UIPageControl *pageControl;

@property (nonatomic,retain)UIImageView *picImageView;//图片
@property (nonatomic,retain)UILabel *titleLabel;//标题
@property (nonatomic,retain)UILabel *priceLabel;//价格
@property (nonatomic,retain)UILabel *baoyouLabel;//包邮
@property (nonatomic,retain)UILabel *saledLabel;//已售
@property (nonatomic,retain)UILabel *originalprice;//原价
@property (nonatomic,retain)UILabel *soure_typeLabel;//天猫



@end
