//
//  FoodCollectionViewCell.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-2.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodCollectionViewCell : UICollectionViewCell
@property (nonatomic,retain)UIImageView *upImageView;
@property (nonatomic,retain)UILabel *titleLabel;
@property (nonatomic,retain)UILabel *priceLabel;
@property (nonatomic,retain)UILabel *saledCountLabel;
@property (nonatomic,retain)UILabel *goodVoiceLabel;

@end
