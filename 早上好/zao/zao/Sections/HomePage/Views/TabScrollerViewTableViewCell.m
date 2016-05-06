//
//  TabScrollerViewTableViewCell.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-29.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "TabScrollerViewTableViewCell.h"
#import "SizeMacros.h"

@implementation TabScrollerViewTableViewCell
-(void)dealloc{
    [_TabScroll release];
    [_pageCon release];
   
    [super dealloc];
}
-(UIScrollView *)TabScroll{
    if (_TabScroll == nil) {
        self.TabScroll = [[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,kScreenWidth, kScreenHeight/4)]autorelease];
        self.TabScroll.backgroundColor = [UIColor magentaColor];
//        for (int i = 0; i < self.tabScrollDataArray.count; i++) {
//            tabScrollerViewCell.TabScroll.pagingEnabled = YES;
//            TabScrollerModel *tabModel = [self.tabScrollDataArray objectAtIndex:i];
//            UIImageView *image1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/4)];
//            [image1 sd_setImageWithURL:[NSURL URLWithString:tabModel.image_big_ios_url] placeholderImage:[UIImage imageNamed:@"bga"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//                image1.image = image;
//            }];
//            UIButton *tabButton = [UIButton buttonWithType:UIButtonTypeCustom];
//            tabButton.frame = CGRectMake(i*kScreenWidth, 0, kScreenWidth, kScreenHeight/4);
//            [tabButton setImage:image1.image forState:UIControlStateNormal];
//            [tabButton addTarget:self action:@selector(handleClickTabButton:) forControlEvents:UIControlEventTouchUpInside];
//            [tabScrollerViewCell.TabScroll addSubview:tabButton];
//            [image1 release];
//        }

            }
    return _TabScroll;
}
-(UIPageControl *)pageCon{
    if (_pageCon == nil) {
        self.pageCon = [[[UIPageControl alloc]initWithFrame:CGRectMake(0,kScreenHeight/4-30, kScreenWidth, 30)] autorelease];
        self.pageCon.currentPageIndicatorTintColor = [UIColor blackColor];
    
    }
    return _pageCon;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
        [self.contentView addSubview:self.TabScroll];
        [self.contentView addSubview:self.pageCon];
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
