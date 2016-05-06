//
//  FoodCollectionViewCell.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-2.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "FoodCollectionViewCell.h"
#import "SizeMacros.h"
@implementation FoodCollectionViewCell
-(void)dealloc{
    [_upImageView release];
    [_titleLabel release];
    [_priceLabel release];
    [_saledCountLabel release];
    [_goodVoiceLabel release];
    [super dealloc];
}
-(UIImageView *)upImageView{
    if (_upImageView == nil) {
        self.upImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth/2, kScreenHeight/2/4*3)]autorelease];
        
    }
    return _upImageView;
}
-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        self.titleLabel = [[[UILabel alloc]initWithFrame:CGRectMake(0, kScreenHeight/2/4*3, kScreenWidth/2, kScreenHeight/2/4/3)]autorelease];
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.numberOfLines = 0;

    }
    return _titleLabel;
}
-(UILabel *)priceLabel{
    if (_priceLabel == nil) {
        self.priceLabel = [[[UILabel alloc]initWithFrame:CGRectMake(0, kScreenHeight/2/4*3+kScreenHeight/2/4/3, kScreenWidth/2, kScreenHeight/2/4/3)]autorelease];
        self.priceLabel.adjustsFontSizeToFitWidth = YES;
        self.priceLabel.textAlignment = NSTextAlignmentCenter;
        self.priceLabel.numberOfLines = 0;
      
    }
    return _priceLabel;
}
-(UILabel *)saledCountLabel{
    if (_saledCountLabel == nil) {
        self.saledCountLabel = [[[UILabel alloc]initWithFrame:CGRectMake(0, kScreenHeight/2-kScreenHeight/2/4/3, kScreenWidth/2/2, kScreenHeight/2/4/3)]autorelease];
          }
    return _saledCountLabel;
}
-(UILabel *)goodVoiceLabel{
    if (_goodVoiceLabel == nil) {
        self.goodVoiceLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2/2, kScreenHeight/2-kScreenHeight/2/4/3, kScreenWidth/2/2, kScreenHeight/2/4/3)]autorelease];
       
    }
    return _goodVoiceLabel;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.upImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.saledCountLabel];
        [self.contentView addSubview:self.goodVoiceLabel];
    }
    return self;
}

@end
