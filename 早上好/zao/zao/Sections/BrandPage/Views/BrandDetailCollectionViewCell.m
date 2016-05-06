//
//  BrandDetailCollectionViewCell.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-7-31.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "BrandDetailCollectionViewCell.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#import "UIImageView+WebCache.h"
@implementation BrandDetailCollectionViewCell


- (void)dealloc{
    [_short_titleLabel release];
    [_baoyouLabel release];
    [_sales_countLabel release];
    [_list_priceLabel release];
    [_source_typeLabel release];
    [_bigView release];
    [_priceLabel release];
    [super dealloc];
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureCell];
    }
    return self;
}

- (UILabel *)short_titleLabel{
    if (_short_titleLabel == nil) {
        self.short_titleLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/37.5, self.frame.size.height-kScreenWidth/37.5-kScreenHeight/20+4, kScreenWidth/2.5, kScreenHeight/13.34)]autorelease];
       // self.short_titleLabel.backgroundColor = [UIColor redColor];
        self.short_titleLabel.font = [UIFont systemFontOfSize:15];
        //self.short_titleLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.short_titleLabel];
    }
    return [[_short_titleLabel retain]autorelease];
}
- (UIImageView *)bigView{
    if (_bigView == nil) {
        self.bigView = [[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, kScreenHeight/3.2)]autorelease];
        //self.bigView.backgroundColor = [UIColor blackColor];
    }
    return [[_bigView retain]autorelease];
}
- (UILabel *)baoyouLabel{
    if (_baoyouLabel == nil) {
        self.baoyouLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/37.5, self.frame.size.height-kScreenWidth/37.5-kScreenHeight/16.5-kScreenHeight/880, kScreenWidth/12, kScreenHeight/25)]autorelease];
        //self.baoyouLabel.adjustsFontSizeToFitWidth = YES;
        //self.baoyouLabel.backgroundColor = [UIColor yellowColor];
        self.baoyouLabel.font = [UIFont systemFontOfSize:12];
    }
    return [[_baoyouLabel retain]autorelease];
}
- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        self.priceLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/37.5, self.frame.size.height-kScreenWidth/37.5-kScreenHeight/16.5-kScreenHeight/880-kScreenHeight/16.675, kScreenWidth/8.9, kScreenHeight/16.675)]autorelease];
        self.priceLabel.textColor = [UIColor redColor];
        //_priceLabel.backgroundColor = [UIColor greenColor];
        self.priceLabel.adjustsFontSizeToFitWidth = YES;
    }
    return [[_priceLabel retain]autorelease];
}
- (UILabel *)list_priceLabel{
    if (_list_priceLabel == nil) {
        self.list_priceLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/37.5+kScreenWidth/8+5, self.frame.size.height-kScreenWidth/37.5-kScreenHeight/16.5-kScreenHeight/880-kScreenHeight/16.675+11, kScreenWidth/7, kScreenHeight/18)]autorelease];
        //self.list_priceLabel.backgroundColor = [UIColor grayColor];
        self.list_priceLabel.adjustsFontSizeToFitWidth = YES;
        self.list_priceLabel.textColor = [UIColor colorWithWhite:.2 alpha:.5];
    }
    return [[_list_priceLabel retain]autorelease];
}
- (UILabel *)sales_countLabel{
    if (_sales_countLabel == nil) {
        self.sales_countLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/37.5+40, self.frame.size.height-kScreenWidth/37.5-kScreenHeight/16.5-kScreenHeight/880, kScreenWidth/6.2, kScreenHeight/33.35)]autorelease];
        //self.sales_countLabel.backgroundColor = [UIColor blueColor];
        self.sales_countLabel.adjustsFontSizeToFitWidth = YES;
        self.sales_countLabel.textColor = [UIColor colorWithWhite:.2 alpha:.5];
    }
    return [[_sales_countLabel retain]autorelease];
}
- (UILabel *)source_typeLabel{
    if (_source_typeLabel == nil) {
        self.source_typeLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/3.2, self.frame.size.height-kScreenWidth/37.5-kScreenHeight/16.5-kScreenHeight/880, kScreenWidth/7, kScreenHeight/33.35)]autorelease];
        self.source_typeLabel.adjustsFontSizeToFitWidth = YES;
        
        self.source_typeLabel.textColor = [UIColor colorWithWhite:.01 alpha:.8];
        self.source_typeLabel.textAlignment = NSTextAlignmentRight;
    }
    return [[_source_typeLabel retain]autorelease];
}
- (void)configureCell{
    [self addSubview:self.short_titleLabel];
    [self addSubview:self.bigView];
    [self addSubview:self.baoyouLabel];
    [self addSubview:self.priceLabel];
    [self addSubview:self.list_priceLabel];
    [self addSubview:self.sales_countLabel];
    [self addSubview:self.source_typeLabel];
}
- (void)configureCollectionCellWithBrandDetailListModel:(brandDetailListModel *)model{
        self.short_titleLabel.text = model.short_title;
        self.priceLabel.text = [NSString stringWithFormat:@"￥%.1f",[model.price floatValue]/100];
    UILabel *listPristSymbol = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/37.5+kScreenWidth/8+7, self.frame.size.height-kScreenWidth/37.5-kScreenHeight/13-kScreenHeight/1100, kScreenWidth/7-3, 1)];
    listPristSymbol.backgroundColor = [UIColor colorWithWhite:.5 alpha:.5];
    [self addSubview:listPristSymbol];
    [listPristSymbol release];
    self.list_priceLabel.text = [NSString stringWithFormat:@"￥%.1f",[model.list_price floatValue]/100];
    self.sales_countLabel.text = [NSString stringWithFormat:@"已售%ld件",(long)[model.sales_count integerValue]];
    if (model.source_type == 0) {
        self.source_typeLabel.text = @"去天猫";
    }else{
        self.source_typeLabel.text = @"特卖商城";
    }
    //NSString *string = [NSString stringWithFormat:@"%ld",(long)model.baoyou];
    NSInteger baoyou = [model.baoyou integerValue];
    if (baoyou == 1) {
        self.baoyouLabel.text = @"包邮";
        self.baoyouLabel.textColor = [UIColor redColor];
    }
    //[model.big length]
    NSURL *url = [NSURL URLWithString:model.big];
    [self.bigView sd_setImageWithURL:url placeholderImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bgc" ofType:@"jpg"]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.bigView.image = image;
    }];
}



@end
