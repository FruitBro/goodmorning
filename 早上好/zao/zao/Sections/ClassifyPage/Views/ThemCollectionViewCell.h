//
//  ThemCollectionViewCell.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/7/31.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemCollectionViewCell : UICollectionViewCell
@property (nonatomic,retain)UIImageView *image_urlView;//图片
@property (nonatomic,retain)UILabel *priceLabel;//现价
@property (nonatomic,retain)UILabel *list_priceLabel;//原价
@property (nonatomic,retain)UILabel *short_titleLabel;//标题
@property (nonatomic,retain)UILabel *sales_countLabel;//已售
@property (nonatomic,retain)UILabel *baoyuLabel;//包邮
@end
