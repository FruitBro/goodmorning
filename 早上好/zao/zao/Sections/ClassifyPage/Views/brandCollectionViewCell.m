//
//  brandCollectionViewCell.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/4.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "brandCollectionViewCell.h"

@implementation brandCollectionViewCell
- (void)dealloc{
    [_short_titleLabel release];
    [_priceLabel release];
    [_list_priceLabel release];
    [_sales_countLabel release];
    [_image_urlView release];
    [_baoyuLabel release];
    [_soure_typeLabel release];
    [super dealloc];
}

//懒加载  图片
- (UIImageView *)image_urlView{
    if (_image_urlView == nil) {
        self.image_urlView = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/2.1, kScreenHeight/3.4)]autorelease];
       // self.image_urlView.backgroundColor = [UIColor orangeColor];
        
    }
    return _image_urlView;
}

//现价
- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        self.priceLabel = [[[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/75, kScreenHeight/3.335, kScreenWidth/5.357, kScreenHeight/33.35)]autorelease];
        //self.priceLabel.backgroundColor = [UIColor redColor];
        self.priceLabel.textColor = [UIColor redColor];
    }
    return _priceLabel;
}

//原价
- (UILabel *)list_priceLabel{
    if (_list_priceLabel == nil) {
        self.list_priceLabel = [[[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/4.68, kScreenHeight/3.335, kScreenWidth/9.375, kScreenHeight/33.35)]autorelease];
       // self.list_priceLabel.backgroundColor = [UIColor greenColor];
        self.list_priceLabel.textColor = [UIColor grayColor];
        self.list_priceLabel.font = [UIFont systemFontOfSize:10];
        
    }
    return _list_priceLabel;
}


//包邮
- (UILabel *)baoyuLabel{
    if (_baoyuLabel == nil) {
        self.baoyuLabel = [[[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/75, kScreenHeight/2.96, kScreenWidth/9.375, kScreenHeight/33.35)]autorelease];
        //self.baoyuLabel.backgroundColor = [UIColor orangeColor];
        // self.baoyuLabel.textColor = [UIColor blackColor];
    }
    return _baoyuLabel;
}

//已售
- (UILabel *)sales_countLabel{
    if (_sales_countLabel == nil) {
        self.sales_countLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/5.769, kScreenHeight/2.96, kScreenWidth/6.25, kScreenHeight/33.35)];
        
        self.sales_countLabel.adjustsFontSizeToFitWidth = YES;
        self.sales_countLabel.textColor = [UIColor grayColor];
        //self.sales_countLabel.backgroundColor = [UIColor blueColor];
    }
    return _sales_countLabel;
}

//标题
- (UILabel *)short_titleLabel{
    if (_short_titleLabel == nil) {
        self.short_titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/75, kScreenHeight/2.66, kScreenWidth/2.5, kScreenHeight/33.35)]autorelease];
       // self.short_titleLabel.backgroundColor = [UIColor orangeColor];
        //self.short_titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _short_titleLabel;
}
//创建天猫
- (UILabel *)soure_typeLabel{
    if (_soure_typeLabel == nil) {
        self.soure_typeLabel = [[[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/2.88, kScreenHeight/2.96, kScreenWidth/9.375, kScreenHeight/33.35)]autorelease];
        //self.soure_typeLabel.backgroundColor = [UIColor blueColor];
    }
    return  _soure_typeLabel;
}

//重写初始化


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.short_titleLabel];
        [self.contentView addSubview:self.baoyuLabel];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.sales_countLabel];
        [self.contentView addSubview:self.list_priceLabel];
        [self.contentView addSubview:self.image_urlView];
        [self.contentView addSubview:self.soure_typeLabel];
    }
    return self;
}

@end
