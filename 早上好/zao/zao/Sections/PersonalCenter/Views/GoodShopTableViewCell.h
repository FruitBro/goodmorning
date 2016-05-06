//
//  GoodShopTableViewCell.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/6.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodShopTableViewCell : UITableViewCell
@property (nonatomic,retain)UIImageView *brandView;//品牌折扣
@property (nonatomic,retain)UILabel *discountLabel;//最低折扣
@property (nonatomic,retain)UIImageView *logoView;//小图片 在品牌折扣前面放着的
@property (nonatomic,retain)UIImageView *picView;//图片放在infoOfpicLabel上
@property (nonatomic,retain)UILabel *infoOfpicLabel;//标题和图片
@property (nonatomic,retain)UILabel *dateLabel;//日期
@property (nonatomic,retain)UILabel *titleLabel;//标题
@property (nonatomic,retain)UILabel *infoLabel;//
@end
