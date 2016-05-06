//
//  BrandSessionTableViewCell.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-7-30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "BrandSessionTableViewCell.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeinght [UIScreen mainScreen].bounds.size.height
#import "UIImageView+WebCache.h"
@implementation BrandSessionTableViewCell
- (void)dealloc{
    [_brand_image_urlView release];
    [_special_nameLabel release];
    [_low_priceLabel release];
    [_newOrRestTimeLable release];
    [_brand_image_url release];
    [super dealloc];
}
- (UIImageView *)brand_image_urlView{
    if (_brand_image_urlView == nil) {
        self.brand_image_urlView = [[[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/37.5, kScreenHeinght/66.7,kScreenWidth-kScreenWidth/37.5*2 , kScreenHeinght/4.5)]autorelease];
        //self.brand_image_urlView.backgroundColor = [UIColor blueColor];
    }
    return _brand_image_urlView;
}
- (UILabel *)special_nameLabel{
    if (_special_nameLabel == nil) {
        self.special_nameLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/37.5,kScreenHeinght/66.7+kScreenHeinght/4.5, kScreenWidth/1.9, kScreenHeinght/3.2 -kScreenHeinght/66.7-kScreenHeinght/4.5)]autorelease];
                //_special_nameLabel.backgroundColor = [UIColor yellowColor];
    }
    return [[_special_nameLabel retain]autorelease];
}
- (UILabel *)low_priceLabel{
    if (_low_priceLabel == nil) {
        self.low_priceLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth-kScreenWidth/5-kScreenWidth/36.5, kScreenHeinght/66.7+kScreenHeinght/4.5, kScreenWidth/4.7, kScreenHeinght/3.2 -kScreenHeinght/66.7-kScreenHeinght/4.5)]autorelease];
        _low_priceLabel.textColor = [UIColor redColor];
    }
    return [[_low_priceLabel retain]autorelease];
}
- (UILabel *)newOrRestTimeLable{
    if (_newOrRestTimeLable == nil) {
        self.newOrRestTimeLable = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/375*315, kScreenHeinght/66.7,kScreenWidth/375*50 , kScreenHeinght/33.5)]autorelease];
        self.newOrRestTimeLable.adjustsFontSizeToFitWidth = YES;
        self.newOrRestTimeLable.backgroundColor = [UIColor colorWithRed:.2 green:.5 blue:.6 alpha:.8];
        self.newOrRestTimeLable.textColor = [UIColor whiteColor];
    }
    return _newOrRestTimeLable;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.brand_image_urlView];
        [self.contentView addSubview:self.special_nameLabel];
        [self.contentView addSubview:self.low_priceLabel];
        [self.contentView addSubview:self.newOrRestTimeLable];
    }
    return self;
}
- (void)configureCellWithModel:(brandSessionModel *)model{
    //NSLog(@"%@", model.special_name);
    self.special_nameLabel.text = model.special_name;
    self.low_priceLabel.text = [NSString stringWithFormat:@"￥%.1f起", [model.low_price floatValue]/100];
    NSDate *datnow = [NSDate date];
    NSDateFormatter * dm = [[NSDateFormatter alloc]init];
    [dm setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate * newdate = [dm dateFromString:model.expire_time];
    long dd = (long)[newdate timeIntervalSince1970]-[datnow timeIntervalSince1970];
    NSString *timeString=nil;
    if (dd/3600<1)
    {
        timeString = [NSString stringWithFormat:@"%ld", dd/60];
        self.newOrRestTimeLable.text=[NSString stringWithFormat:@"剩%@分钟", timeString];
    }
    if (dd/3600>1&&dd/86400<1)
    {
        timeString = [NSString stringWithFormat:@"%ld", dd/3600];
        self.newOrRestTimeLable.text=[NSString stringWithFormat:@"剩%@小时", timeString];
    }
    if (dd/86400>1)
    {
        timeString = [NSString stringWithFormat:@"%ld", dd/86400];
        self.newOrRestTimeLable.text=[NSString stringWithFormat:@"剩%@天", timeString];
    }
    //NSLog(@"%@",self.newOrRestTimeLable.text);    //self.newOrRestTimeLable.text =
    NSURL *url = [NSURL URLWithString:model.brand_image_url];
    [self.brand_image_urlView sd_setImageWithURL:url placeholderImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bga" ofType:@"png"]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.brand_image_urlView.image = image;
    }];
}
- (void)configureHotBrandCellWithModel:(brandSessionModel *)model{
    self.special_nameLabel.text = model.special_name;
    self.low_priceLabel.text = [NSString stringWithFormat:@"￥%.1f起",[model.low_price floatValue]/100];
    
    NSURL *url = [NSURL URLWithString:model.brand_image_url];
    [self.brand_image_urlView sd_setImageWithURL:url placeholderImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bga" ofType:@"png"]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.brand_image_urlView.image = image;
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
