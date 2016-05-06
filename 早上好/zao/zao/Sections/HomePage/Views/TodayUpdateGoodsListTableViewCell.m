//
//  TodayUpdateGoodsListTableViewCell.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-2.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "TodayUpdateGoodsListTableViewCell.h"
#import "SizeMacros.h"
#import "UIImageView+WebCache.h"
@implementation TodayUpdateGoodsListTableViewCell
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
- (UIImageView *)bigView{
    if (_bigView == nil) {
        self.bigView = [[[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/75, kScreenWidth/75, kScreenWidth/3.2, kScreenHeight/6.28)]autorelease];
        _bigView.backgroundColor = [UIColor redColor];
    }
    return [[_bigView retain]autorelease];
}
- (UILabel *)short_titleLabel{
    if (_short_titleLabel == nil) {
        self.short_titleLabel = [[[UILabel alloc]initWithFrame:CGRectMake(self.bigView.frame.size.width+kScreenWidth/75*2, kScreenWidth/75, kScreenWidth-self.bigView.frame.size.width-kScreenWidth/75*5, kScreenHeight/6.28/3)]autorelease];
       self.short_titleLabel.font = [UIFont systemFontOfSize:15];
        self.short_titleLabel.adjustsFontSizeToFitWidth = YES;
        self.short_titleLabel.numberOfLines = 2;
        //_short_titleLabel.backgroundColor = [UIColor greenColor];
    }
    return [[_short_titleLabel retain]autorelease];
}
-(UILabel *)priceLabel{
    if (_priceLabel == nil) {
        self.priceLabel = [[[UILabel alloc]initWithFrame:CGRectMake(self.short_titleLabel.frame.origin.x, kScreenWidth/75+kScreenHeight/6.28/3, kScreenWidth/4.687, kScreenHeight/6.28/3)]autorelease];
        self.priceLabel.textColor = [UIColor redColor];
//        self.priceLabel.font = [UIFont systemFontOfSize:20];
        //_priceLabel.backgroundColor = [UIColor blueColor];
    }
    return [[_priceLabel retain]autorelease];
}
- (UILabel *)list_priceLabel{
    if (_list_priceLabel == nil) {
        self.list_priceLabel = [[[UILabel alloc]initWithFrame:CGRectMake(self.short_titleLabel.frame.origin.x+kScreenWidth/4.687,kScreenWidth/75+kScreenHeight/6.28/3, kScreenWidth/4.687, kScreenHeight/6.28/3)]autorelease];
        //self.list_priceLabel.backgroundColor = [UIColor blackColor];
        self.list_priceLabel.textColor = [UIColor colorWithWhite:.2 alpha:.5];
        self.list_priceLabel.font = [UIFont systemFontOfSize:15];
    }
    return [[_list_priceLabel retain]autorelease];
}
- (UILabel *)baoyouLabel{
    if (_baoyouLabel == nil) {
        self.baoyouLabel = [[[UILabel alloc]initWithFrame:CGRectMake(self.short_titleLabel.frame.origin.x,kScreenWidth/75+kScreenHeight/6.28/3*2, kScreenWidth/7.5, kScreenHeight/6.28/3)]autorelease];
        //self.baoyouLabel.backgroundColor = [UIColor blueColor];
                self.baoyouLabel.font = [UIFont systemFontOfSize:15];
    }
    return [[_baoyouLabel retain]autorelease];
}
- (UILabel *)sales_countLabel{
    if (_sales_countLabel == nil) {
        self.sales_countLabel = [[[UILabel alloc]initWithFrame:CGRectMake(self.baoyouLabel.frame.origin.x+kScreenWidth/4, kScreenWidth/75+kScreenHeight/6.28/3*2, kScreenWidth/5, kScreenHeight/6.28/3)]autorelease];
        self.sales_countLabel.adjustsFontSizeToFitWidth = YES;
        self.sales_countLabel.textColor = [UIColor colorWithWhite:.2 alpha:.5];
        //self.sales_countLabel.backgroundColor = [UIColor purpleColor];
    }
    return [[_sales_countLabel retain]autorelease];
}
- (UILabel *)source_typeLabel{
    if (_source_typeLabel == nil) {
        self.source_typeLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth-kScreenWidth/75-kScreenWidth/6.5,kScreenWidth/75+kScreenHeight/6.28/3*2 , kScreenWidth/6.5, kScreenHeight/6.28/3)]autorelease];
        _source_typeLabel.adjustsFontSizeToFitWidth = YES;
        self.source_typeLabel.textColor = [UIColor colorWithWhite:.01 alpha:.4];
        //self.source_typeLabel.backgroundColor = [UIColor orangeColor];
    }
    return [[_source_typeLabel retain]autorelease];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.bigView];
        [self.contentView addSubview:self.short_titleLabel];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.list_priceLabel];
        [self.contentView addSubview:self.baoyouLabel];
        [self.contentView addSubview:self.sales_countLabel];
        [self.contentView addSubview:self.source_typeLabel];
    }
    return self;
}
- (void)configureCellWithModel:(brandDetailListModel *)model{
    self.short_titleLabel.text = model.short_title;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%.1f",[model.price floatValue]/100];
    self.list_priceLabel.text = [NSString stringWithFormat:@"￥%.1f",[model.list_price floatValue]/100];
    UILabel *listPristSymbol = [[UILabel alloc]initWithFrame:CGRectMake(self.short_titleLabel.frame.origin.x+kScreenWidth/4.687+kScreenWidth/4.687/3/2, kScreenWidth/37.5*5.7, kScreenWidth/4.687/3*2, 1)];
    listPristSymbol.backgroundColor = [UIColor colorWithWhite:.5 alpha:.5];
    [self addSubview:listPristSymbol];
    [listPristSymbol release];
    self.sales_countLabel.text = [NSString stringWithFormat:@"已售%@件",model.sales_count];
    if ([model.baoyou integerValue]== 1) {
        self.baoyouLabel.text = @"包邮";
        self.baoyouLabel.textColor = [UIColor redColor];
    }
    if ([model.source_type integerValue] == 0) {
        self.source_typeLabel.text = @"去天猫";
    }
    else{
        self.source_typeLabel.text = @"特卖商城";
    }
    NSURL *url = [NSURL URLWithString:model.big];
    [self.bigView sd_setImageWithURL:url placeholderImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bgc" ofType:@"jpg"]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.bigView.image = image;
    }];
    
    
    
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
