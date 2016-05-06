//
//  EveryTenTableViewCell.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "EveryTenTableViewCell.h"
#import "SizeMacros.h"
@implementation EveryTenTableViewCell
-(void)dealloc{
    [_showImageView release];
    [_titleLabel release];
    [_recommend_reasonLabel release];
    [_priceLabel release];
    [_related_recommendLabel release];
    [super dealloc];
}
-(UILabel *)related_recommendLabel{
    if (_related_recommendLabel == nil) {
        self.related_recommendLabel = [[[UILabel alloc]initWithFrame:CGRectMake(0, kScreenHeight/3*2/5*2/2+kScreenHeight/3*2/5*3+kScreenHeight/3*2/5*2/5, kScreenWidth, kScreenHeight/3*2/5*2/5)]autorelease];
    }
    return _related_recommendLabel;
}
-(UILabel *)priceLabel{
    if (_priceLabel == nil) {
        self.priceLabel = [[[UILabel alloc]initWithFrame:CGRectMake(self.showImageView.frame.size.width-40, self.showImageView.frame.size.height-20, 40, 20)]autorelease];
        self.priceLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _priceLabel;
}
-(UILabel *)recommend_reasonLabel{
    if (_recommend_reasonLabel == nil) {
        self.recommend_reasonLabel = [[[UILabel alloc]initWithFrame:CGRectMake(0, kScreenHeight/3*2/5*3+kScreenHeight/3*2/5*2/5, kScreenWidth, kScreenHeight/3*2/5*2/2)]autorelease];
        self.recommend_reasonLabel.adjustsFontSizeToFitWidth = YES;
        self.recommend_reasonLabel.numberOfLines = 0;
    }
    return _recommend_reasonLabel;
}
-(UIImageView *)showImageView{
    if (_showImageView == nil) {
        self.showImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/3*2/5*3)]autorelease];
        [self.showImageView addSubview:self.priceLabel];
    }
    return _showImageView;
}
-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        self.titleLabel = [[[UILabel alloc]initWithFrame:CGRectMake(0, kScreenHeight/3*2/5*3, kScreenWidth, kScreenHeight/3*2/5*2/5)]autorelease];
    }
    return _titleLabel;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.showImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.recommend_reasonLabel];
        [self.contentView addSubview:self.related_recommendLabel];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
