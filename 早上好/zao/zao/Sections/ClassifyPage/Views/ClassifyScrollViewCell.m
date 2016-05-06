//
//  ClassifyScrollViewCell.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/2.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "ClassifyScrollViewCell.h"
#import "SizeMacros.h"

@interface ClassifyScrollViewCell()<UIScrollViewDelegate>

@end
@implementation ClassifyScrollViewCell
- (void)dealloc{
    [_scrollView release];
    [_pageControl release];
    [_titleLabel release];
    [_picImageView release];
    [_baoyouLabel release];
    [_originalprice release];
    [_saledLabel release];
    [_priceLabel release];
    [_soure_typeLabel release];
    [super dealloc];
}

- (UIScrollView *)scrollView{
    if (_scrollView == nil) {
        //创建滑动视图对象
        self.scrollView = [[[UIScrollView alloc] initWithFrame:CGRectMake(0,kScreenHeight/280, kScreenWidth, kScreenHeight/4.2)]autorelease];
        //设置内容区域范围
        self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, 120);
        //设置整平滚动
        self.scrollView.pagingEnabled = YES;
        //去掉水平方向的滚动条
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.delegate = self;
    }
    return _scrollView;
}

- (UIPageControl *)pageControl{
    if (_pageControl == nil) {
        ////创建UIPageControl
        self.pageControl = [[[UIPageControl alloc] initWithFrame:CGRectMake(0, kScreenHeight/5-30, kScreenWidth, 30)]autorelease];
        //设置分页数
        //self.pageControl.numberOfPages = 2;
        self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        self.pageControl.pageIndicatorTintColor = [UIColor orangeColor];
        [self.pageControl addTarget:self action:@selector(handleClickPage:) forControlEvents:UIControlEventValueChanged];
        

    }
    return _pageControl;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.scrollView];
        [self.contentView addSubview:self.pageControl];
    }
    return self;
}









#pragma mark------//点击分页响应的方法



//点击分页响应的方法
- (void)handleClickPage:(UIPageControl *)sender{
    //通过点击分页控制scrollView 的偏移量
    [self.scrollView setContentOffset:CGPointMake(kScreenWidth * sender.currentPage, 0) animated:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if ([self.scrollView isMemberOfClass:[UITableView class]]) {
        NSLog(@"测试");
    }else{
        //先得到偏移量对应的分页下标
        NSInteger index = scrollView.contentOffset.x / kScreenWidth;
        self.pageControl.currentPage = index;
    }
}








- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
