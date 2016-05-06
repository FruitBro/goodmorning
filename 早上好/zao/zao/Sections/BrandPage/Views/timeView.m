//
//  timeView.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-7.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "timeView.h"
#import "SizeMacros.h"
@implementation timeView
- (void)dealloc{
    
    [_dayLabel release];
    [_hourLabel release];
    [_minuteLabel release];
    [_secondLabel release];
   
    [_label1 release];
    [_label2 release];
    [_label3 release];
    [_label4 release];
    [_restLabel release];
    [_day1Label release];
    [_hour1Label release];
    [_minute1Label release];
    [_second1Label release];
    
    
    
    
    
    [super dealloc];
}
- (UILabel *)restLabel{
    if (_restLabel == nil) {
        self.restLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/4-kScreenWidth/18, kScreenWidth/375*5, kScreenWidth/375*20, kScreenWidth/375*20)]autorelease];
        //self.restLabel.backgroundColor = [UIColor redColor];
        self.restLabel.text = @"剩";
    }
    return [[_restLabel retain]autorelease];
}
- (UILabel *)day1Label{
    if (_day1Label == nil) {
        self.day1Label = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/3.15, kScreenWidth/375*5, kScreenWidth/375*20, kScreenWidth/375*20)]autorelease];
        //_day1Label.backgroundColor = [UIColor yellowColor];
        _day1Label.text = @"天";
    }
    return [[_day1Label retain]autorelease];
}
- (UILabel *)dayLabel{
    if (_dayLabel == nil) {
        self.dayLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/4, kScreenWidth/375*5, kScreenWidth/375*20, kScreenWidth/375*20)]autorelease];
        _dayLabel.backgroundColor = [UIColor blackColor];
        _dayLabel.textColor = [UIColor whiteColor];
        _dayLabel.adjustsFontSizeToFitWidth = YES;
        _dayLabel.textAlignment = NSTextAlignmentCenter;
    }
    return [[_dayLabel retain]autorelease];
}
- (UILabel *)hour1Label{
    if (_hour1Label == nil) {
        self.hour1Label = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2.24, kScreenWidth/375*5, kScreenWidth/375*30, kScreenWidth/375*20)]autorelease];
        //_hour1Label.backgroundColor = [UIColor orangeColor];
        _hour1Label.adjustsFontSizeToFitWidth = YES;
        _hour1Label.text = @"小时";
    }
    return [[_hour1Label retain]autorelease];
}
- (UILabel *)hourLabel{
    if (_hourLabel == nil) {
        self.hourLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/37.5*2+kScreenWidth/4+kScreenWidth/375*30, kScreenWidth/375*5, kScreenWidth/375*20 ,kScreenWidth/375*20)]autorelease];
        _hourLabel.backgroundColor = [UIColor blackColor];
        _hourLabel.textColor = [UIColor whiteColor];    }
    return [[_hourLabel retain]autorelease];
}
- (UILabel *)minute1Label{
    if (_minute1Label == nil) {
        self.minute1Label = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/1.65, kScreenWidth/375*5, kScreenWidth/375*20, kScreenWidth/375*20)]autorelease];
        //_minute1Label.backgroundColor = [UIColor purpleColor];
        _minute1Label.text =@"分";
    }
    return [[_minute1Label retain]autorelease];
}
- (UILabel *)minuteLabel{
    if (_minuteLabel == nil) {
        self.minuteLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/37.5*2+kScreenWidth/4+kScreenWidth/37.5*2+kScreenWidth/375*70,kScreenWidth/375*5 , kScreenWidth/375*20, kScreenWidth/375*20)]autorelease];
        _minuteLabel.backgroundColor = [UIColor blackColor];
        _minuteLabel.textColor = [UIColor whiteColor];
    }
    return [[_minuteLabel retain]autorelease];
}
- (UILabel *)second1Label{
    if (_second1Label == nil) {
        self.second1Label = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/1.35, kScreenWidth/375*5, kScreenWidth/375*20, kScreenWidth/375*20)]autorelease];
        //_second1Label.backgroundColor = [UIColor purpleColor];
        _second1Label.text = @"秒";
    }
    return [[_second1Label retain]autorelease];
}
- (UILabel *)secondLabel{
    if (_secondLabel == nil) {
        self.secondLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/37.5*2+kScreenWidth/4+kScreenWidth/37.5*4+kScreenWidth/375*100,kScreenWidth/375*5 ,kScreenWidth/375*20 , kScreenWidth/375*20)]autorelease];
        _secondLabel.backgroundColor = [UIColor blackColor];
        _secondLabel.textColor = [UIColor whiteColor];
    }
    return [[_secondLabel retain]autorelease];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.dayLabel];
        [self addSubview:self.hourLabel];
        [self addSubview:self.minuteLabel];
        [self addSubview:self.secondLabel];
        
        [self addSubview:self.restLabel];
        [self addSubview:self.day1Label];
        [self addSubview:self.hour1Label];
        [self addSubview:self.minute1Label];
        [self addSubview:self.second1Label];
    }
    return self;
}






@end
