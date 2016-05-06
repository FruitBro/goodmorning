//
//  AllViewCell.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/7/31.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "AllViewCell.h"
#import "SizeMacros.h"
@implementation AllViewCell

- (void)dealloc{
    [_titleLabel release];
    [_picImageView release];
    [_baoyouLabel release];
    [_originalprice release];
    [_saledLabel release];
    [_priceLabel release];
    [_soure_typeLabel release];
    [_scrollView release];
    [_pageControl release];
    [super dealloc];
    
}

//懒加载 创建图片
- (UIImageView *)picImageView{
    if (_picImageView == nil) {
        self.picImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/75, kScreenHeight/133.4, kScreenWidth/2.88, kScreenHeight/6.063)]autorelease];
       // self.picImageView.backgroundColor = [UIColor orangeColor];
        
        
    }
    return _picImageView;
}

//创建标题
- (UILabel *)titleLabel{
    if (_titleLabel ==nil) {
        self.titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/2.586, kScreenHeight/66.7, kScreenWidth/1.785, kScreenHeight/16.67)]autorelease];
        //self.titleLabel.backgroundColor = [UIColor grayColor];
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        self.titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

//创建现价格
- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        self.priceLabel = [[[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/2.586, kScreenHeight/11.11, kScreenWidth/6.818, kScreenHeight/33.35)]autorelease];
        //self.priceLabel.backgroundColor = [UIColor redColor];
        
        
    }
    return _priceLabel;
}

//创建原价格
- (UILabel *)originalprice{
    if (_originalprice == nil) {
        self.originalprice = [[[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/1.704, kScreenHeight/11.11, kScreenWidth/6.818, kScreenHeight/33.35)]autorelease];
        //self.originalprice.backgroundColor = [UIColor blackColor];
        
        
    }
    return _originalprice;
    
}


//创建包邮
- (UILabel *)baoyouLabel{
    if (_baoyouLabel ==nil) {
        self.baoyouLabel = [[[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/2.586, kScreenHeight/7.41, kScreenWidth/6.818, kScreenHeight/33.35)]autorelease];
        //self.baoyouLabel.backgroundColor = [UIColor greenColor];
    }
    return _baoyouLabel;
    
}


//创建已售
- (UILabel *)saledLabel{
    if (_saledLabel == nil) {
        self.saledLabel = [[[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/1.704, kScreenHeight/7.41, kScreenWidth/5.35, kScreenHeight/33.35)]autorelease];
       // self.saledLabel.backgroundColor = [UIColor yellowColor];
    }
    return _saledLabel;
}

//创建天猫
- (UILabel *)soure_typeLabel{
    if (_soure_typeLabel == nil) {
        self.soure_typeLabel = [[[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/1.17, kScreenHeight/7.41, kScreenWidth/9.375, kScreenHeight/33.35)]autorelease];
        //self.soure_typeLabel.backgroundColor = [UIColor blueColor];
    }
    return  _soure_typeLabel;
}








//重写初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.picImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.originalprice];
        [self.contentView addSubview:self.saledLabel];
        [self.contentView addSubview:self.baoyouLabel];
        [self.contentView addSubview: self.soure_typeLabel];
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
