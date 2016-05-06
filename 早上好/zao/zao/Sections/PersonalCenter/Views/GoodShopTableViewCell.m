//
//  GoodShopTableViewCell.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/6.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "GoodShopTableViewCell.h"

@implementation GoodShopTableViewCell

- (void)dealloc{
    [_picView release];
    [_brandView release];
    [_infoOfpicLabel release];
    [_dateLabel release];
    [_discountLabel release];
    [_titleLabel release];
    [_logoView release];
    [_infoLabel release];
    [super dealloc];
}

//懒加载
- (UIImageView *)logoView{
    if (_logoView == nil) {
        self.logoView = [[[UIImageView alloc] initWithFrame:CGRectMake(5, 12, 20, 6)]autorelease];
        self.logoView.backgroundColor = [UIColor orangeColor];
        
    }
    return _logoView;
}

- (UIImageView *)brandView{
    if (_brandView == nil) {
        self.brandView = [[[UIImageView alloc] initWithFrame:CGRectMake(30, 5, 70, 20)]autorelease];;
        self.brandView.backgroundColor = [UIColor redColor];
        
    }
    return _brandView;
}

- (UILabel *)discountLabel{
    if (_discountLabel == nil) {
        self.discountLabel = [[[UILabel alloc] initWithFrame:CGRectMake(110, 5, 70, 20)]autorelease];
        self.discountLabel.backgroundColor = [UIColor redColor];
    }
    return _discountLabel;
}

- (UILabel *)infoOfpicLabel{
    if (_infoOfpicLabel == nil) {
        self.infoOfpicLabel = [[[UILabel alloc] initWithFrame:CGRectMake(30,35, 320, 120)]autorelease];
       // self.infoOfpicLabel.backgroundColor = [UIColor grayColor];//
    }
    return _infoOfpicLabel;
}

- (UILabel *)infoLabel{
    if (_infoLabel == nil) {
        self.infoLabel = [[[UILabel alloc] initWithFrame:CGRectMake(25, 40, 200, 50)]autorelease];
        self.infoLabel.backgroundColor = [UIColor blackColor];
    }
    return _infoLabel;
}




-(UIImageView *)picView{
    if (_picView == nil) {
        self.picView = [[[UIImageView alloc] initWithFrame:CGRectMake(240, 20, 80, 90)]autorelease];
        self.picView.backgroundColor = [UIColor greenColor];
    }
    return _picView;
}

-  (UILabel *)dateLabel{
    if (_dateLabel == nil) {
        self.dateLabel = [[[UILabel alloc] initWithFrame:CGRectMake(18, 160, 85, 20)]autorelease];
        self.dateLabel.backgroundColor = [UIColor blueColor];
    }
    return _dateLabel;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        self.titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(270, 160, 90, 20)]autorelease];
        self.titleLabel.backgroundColor = [UIColor brownColor];
    }
    return _titleLabel;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.logoView];
        [self.contentView addSubview:self.brandView];
        [self.contentView addSubview:self.discountLabel];
        [self.contentView addSubview:self.infoOfpicLabel];
        [self.infoOfpicLabel addSubview:self.infoLabel];
        [self.infoOfpicLabel addSubview:self.picView];
        [self.contentView addSubview:self.dateLabel];
        [self.contentView addSubview:self.titleLabel];
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
