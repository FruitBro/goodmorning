//
//  TodayUpdateTableViewCell.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//




#import "TodayUpdateTableViewCell.h"
#import "SizeMacros.h"
#import "UIImageView+WebCache.h"
@interface TodayUpdateTableViewCell()<UIScrollViewDelegate>
@property (nonatomic,assign)NSInteger k;
@end
@implementation TodayUpdateTableViewCell
- (void)dealloc{
    
    [_scrollView release];
    [_pageController release];
    [_scrollImageArr release];
    [super dealloc];
}

- (NSArray *)scrollImageArr{
    if (_scrollImageArr == nil) {
        self.scrollImageArr = [NSMutableArray array];
    }
    return _scrollImageArr;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configureScrollImages];
        [self configurePageScroll];
        [self.contentView addSubview:self.pageController];
        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(autoScoll) userInfo:nil repeats:YES];
        self.k = 0;
       
    }
    return self;
}
- (void)configurePageScroll{
    self.pageController = [[[UIPageControl alloc]initWithFrame:CGRectMake(kScreenWidth-kScreenWidth/2.8, kScreenHeight/6, kScreenWidth/4.6, kScreenHeight/13.34)]autorelease];
    [self.pageController addTarget:self action:@selector(handleClickPageControllerAction:) forControlEvents:UIControlEventValueChanged];
    _pageController.currentPageIndicatorTintColor = [UIColor redColor];
    _pageController.pageIndicatorTintColor = [UIColor whiteColor];
    [self.contentView addSubview:self.pageController];
}
- (void)configureScrollImages{
    self.scrollView = [[[UIScrollView alloc]initWithFrame:CGRectMake(0,0, kScreenWidth, kScreenHeight/4.2)]autorelease];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:_scrollView];
    
}
- (void)configuresCcrollImagesView{
   _scrollView.contentSize = CGSizeMake(kScreenWidth*self.scrollImageArr.count,kScreenHeight/4.2);
    for (int i = 0; i < self.scrollImageArr.count; i++) {
        UIImageView *scrollImage = [[[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth*i,kScreenHeight/280, kScreenWidth, kScreenHeight/4.2)]autorelease];
        [_scrollView addSubview:scrollImage];
         NSMutableString *newStr = (NSMutableString *)[self.scrollImageArr[i] substringToIndex:[self.scrollImageArr[i] length]-5];
        NSURL *url = [NSURL URLWithString:newStr];
        [scrollImage sd_setImageWithURL:url placeholderImage:nil];
    }
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/kScreenWidth;
    self.pageController.currentPage = index;
}
- (void)handleClickPageControllerAction:(UIPageControl *)sender{
    [self.scrollView setContentOffset:CGPointMake(kScreenWidth*sender.currentPage, 0)];
}
- (void)autoScoll{
    
    self.k++;
    if (self.k == self.scrollImageArr.count) {
        self.k = 0;
    }
    self.pageController.currentPage = self.k;
    _scrollView.contentOffset = CGPointMake(kScreenWidth*self.k, 0);
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end