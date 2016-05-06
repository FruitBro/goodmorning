//
//  LowerView.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-6.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "LowerView.h"
#import "SizeMacros.h"
@implementation LowerView

- (void)dealloc{
    [_total_countLabel release];
    [_titleLabel release];
    [_origin_priceLabel release];
    [_lottery_noticeLabel release];
    [_join_countLabel release];
    [_priceLabel release];
    [_joinButton release];
    [super dealloc];
}
- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        self.titleLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/37.5, kScreenWidth/37.5*2, kScreenWidth/1.7, kScreenWidth/375*50)]autorelease];
        //_titleLabel.backgroundColor = [UIColor greenColor];

    }
    return [[_titleLabel retain]autorelease];
}
- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        self.priceLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/37.5, kScreenWidth/37.5*4+kScreenWidth/375*50, kScreenWidth/375*40, kScreenWidth/375*50)]autorelease];
        _priceLabel.font = [UIFont systemFontOfSize:25];
        //self.priceLabel.backgroundColor = [UIColor blackColor];
    }
    return [[_priceLabel retain]autorelease];
}
- (UILabel *)origin_priceLabel{
    if (_origin_priceLabel == nil) {
        self.origin_priceLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/37.5*2+kScreenWidth/375*40, kScreenWidth/37.5*4+kScreenWidth/375*50+kScreenWidth/37.5,kScreenWidth/375*40+kScreenWidth/37.5+kScreenWidth/37.5*2+kScreenWidth/37.5 , kScreenWidth/375*50)]autorelease];
        //self.origin_priceLabel.backgroundColor = [UIColor blueColor];
        self.origin_priceLabel.textColor = [UIColor colorWithWhite:.2 alpha:.5];
        
            }
    return [[_origin_priceLabel retain]autorelease];
}
- (UILabel *)total_countLabel{
    if (_total_countLabel == nil) {
        self.total_countLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth-kScreenWidth/37.5-kScreenWidth/375*60,kScreenWidth/37.5*4+kScreenWidth/375*50 , kScreenWidth/375*60, kScreenWidth/375*50)]autorelease];
        self.total_countLabel.textColor = [UIColor colorWithWhite:.2 alpha:.5];
        //self.total_countLabel.backgroundColor = [UIColor purpleColor];
    }
    return [[_total_countLabel retain]autorelease];
}
- (UILabel *)join_countLabel{
    if (_join_countLabel == nil) {
        self.join_countLabel = [[[UILabel alloc]initWithFrame:CGRectMake((kScreenWidth-kScreenWidth/375*150)/2+kScreenWidth/37.5, kScreenWidth/1.5,kScreenWidth/375*150 ,kScreenWidth/375*50 )]autorelease];
        //self.join_countLabel.backgroundColor = [UIColor redColor];
        self.join_countLabel.textColor = [UIColor colorWithWhite:.2 alpha:.8];
    }
    return [[_join_countLabel retain]autorelease];
}
- (UILabel *)lottery_noticeLabel{
    if (_lottery_noticeLabel == nil) {
        self.lottery_noticeLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/37.5, kScreenWidth/1.5+kScreenWidth/375*50,kScreenWidth-kScreenWidth/37.5*2 , kScreenHeight*1.4)]autorelease];
        self.lottery_noticeLabel.numberOfLines = 0;
        //self.lottery_noticeLabel.backgroundColor = [UIColor redColor];
    }
    return [[_lottery_noticeLabel retain]autorelease];
}
- (UIButton *)joinButton{
    if (_joinButton == nil) {
        self.joinButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.joinButton.frame = CGRectMake((kScreenWidth-kScreenWidth/375*150)/2,190 , kScreenWidth/375*130,kScreenWidth/375*50 ) ;
        self.joinButton.backgroundColor = [UIColor colorWithRed:200/255.0 green:2/255.0 blue:1/255.0 alpha:.8];
        [self.joinButton setTitle:@"我要参与" forState:UIControlStateNormal];
        self.joinButton.titleLabel.textColor = [UIColor whiteColor];
        self.joinButton.titleLabel.font = [UIFont systemFontOfSize:22];
    }
    return [[_joinButton retain]autorelease];
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.total_countLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.origin_priceLabel];
        [self addSubview:self.join_countLabel];
        [self addSubview:self.lottery_noticeLabel];
        [self addSubview:self.joinButton];
        UILabel *symbol = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/37.5*2+kScreenWidth/375*40, kScreenWidth/37.5*4+kScreenWidth/375*50+kScreenWidth/37.5+kScreenWidth/37.5*2+3, kScreenWidth/375*40+kScreenWidth/37.5+kScreenWidth/37.5, 1)];
        symbol.backgroundColor = [UIColor colorWithWhite:.2 alpha:.5];
        
        [self addSubview:symbol];
        [symbol release];
        [self.joinButton addTarget:self action:@selector(handleClickJoinButton:) forControlEvents:UIControlEventTouchUpInside];

    }
    return self;
}
- (void)handleClickJoinButton:(UIButton *)sender{
    UIAlertView *aletView = [[UIAlertView alloc]initWithTitle:@"恭喜！您已成功参与这次活动。" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
    [aletView show];
    [aletView release];
}
- (void)configureUIViewWithData:(id)data{
    self.total_countLabel.text = [NSString stringWithFormat:@"共%@件",[data objectForKey:@"total_count"]];
    self.titleLabel.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"title"]];
    NSString *str = [data objectForKey:@"origin_price"];
    NSInteger k = [str integerValue];
    self.origin_priceLabel.text = [NSString stringWithFormat:@"￥%ld",k/100];
    self.lottery_noticeLabel.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"lottery_notice"]];
    self.join_countLabel.text = [NSString stringWithFormat:@"%@人参与",[data objectForKey:@"join_count"]];
    self.priceLabel.text = @"￥0";
    self.priceLabel.textColor = [UIColor redColor];
    self.lottery_noticeLabel.text = [NSString stringWithFormat:@"抽奖须知：%@",[data objectForKey:@"lottery_notice"]];
}







@end
