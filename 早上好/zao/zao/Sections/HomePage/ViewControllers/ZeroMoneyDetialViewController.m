//
//  ZeroMoneyDetialViewController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "ZeroMoneyDetialViewController.h"
#import "NetWorkRequset.h"
#import "SizeMacros.h"

#import "ZeroMoneyLotteryModel.h"
#import "UIImageView+WebCache.h"
#import "LowerView.h"
@interface ZeroMoneyDetialViewController ()<netWorkRequsetDelegate,UIScrollViewDelegate>

@property (nonatomic,retain)NSMutableArray *dataArr;
@property (nonatomic,retain)NSMutableArray *picturesArr;
@property (nonatomic,retain)UIScrollView *topperScrollView;
@property (nonatomic,retain)UIScrollView *wholeScrollView;
@property(nonatomic,retain)UIPageControl *pageController;
@property (nonatomic,assign)NSInteger timerK;
@property (nonatomic,retain)LowerView *lowerView;
@end

@implementation ZeroMoneyDetialViewController
-(void)dealloc{
    [_receiveWapUrlString release];
    [_topperScrollView release];
    [_dataArr release];
    [_picturesArr release];
    [_wholeScrollView release];
    [_lowerView release];
    [super dealloc];
}
- (UIScrollView *)topperScrollView{
    if (_topperScrollView == nil) {
        self.topperScrollView = [[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0 ,kScreenWidth ,kScreenHeight/3.2 )]autorelease];
    }
    return [[_topperScrollView retain]autorelease];
}
- (UIPageControl *)pageController{
    if (_pageController == nil) {
        self.pageController = [[[UIPageControl alloc]initWithFrame:CGRectMake((kScreenWidth-kScreenWidth/3.2)/2, kScreenWidth/375*170, kScreenWidth/3.2, kScreenWidth/375*40)]autorelease];
        
    }
    return [[_pageController retain]autorelease];
}
- (UIScrollView *)wholeScrollView{
    if (_wholeScrollView == nil) {
        self.wholeScrollView = [[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)]autorelease];
        self.wholeScrollView.contentSize = CGSizeMake(0, kScreenHeight*2.3);
    }
    return [[_wholeScrollView retain]autorelease];
}
- (NSMutableArray *)picturesArr{
    if (_picturesArr == nil) {
        self.picturesArr = [NSMutableArray array];
    }
    return _picturesArr;
}
- (NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        self.dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
- (LowerView *)lowerView{
    if (_lowerView == nil) {
        self.lowerView = [[[LowerView alloc]initWithFrame:CGRectMake(0, kScreenHeight/3.2+kScreenWidth/375, kScreenWidth, kScreenHeight)]autorelease];
        //self.lowerView.backgroundColor = [UIColor grayColor];
    }
    return [[_lowerView retain]autorelease];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"0元抽奖";
    self.topperScrollView.delegate = self;
    [self.wholeScrollView addSubview:self.topperScrollView];
    [self.wholeScrollView addSubview:self.pageController];
    [self.wholeScrollView addSubview:self.lowerView];
    [self.view addSubview:self.wholeScrollView];
    [self configureTimer];

    //self.navigationController.navigationBar.translucent = NO;

//    self.navigationController.navigationBar.translucent = NO;

    [NetWorkRequset shareNetWorkRequset].delegate = self;
    [NetWorkRequset getNetRequset:@"http://zapi.zhe800.com/cn/inner/lottery/processing"];
}
- (void)configureTimer{
    self.timerK = 0;
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(handleMovePictures) userInfo:nil repeats:YES];
}
- (void)handleMovePictures{
    ++self.timerK;
    if (self.timerK == self.picturesArr.count) {
        self.timerK = 0;
    }
    self.pageController.currentPage = self.timerK;
    self.topperScrollView.contentOffset = CGPointMake(self.timerK*kScreenWidth, 0);
}
- (void)conllectionViewReload:(id)data{
    NSLog(@"data = %@",data);
    NSArray *arr = [data objectForKey:@"image"];
    for (int i = 0; i < arr.count; i++) {
        [self.picturesArr addObject:arr[i]];
        
    }
    NSLog(@"%@",self.picturesArr);
    for (int i = 0; i < self.picturesArr.count; i++) {
        UIImageView *ImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth*i,0 ,kScreenWidth ,kScreenHeight/3.2 )]autorelease];
        ImageView.backgroundColor = [UIColor yellowColor];
        [self.topperScrollView addSubview:ImageView];
        
        [ImageView sd_setImageWithURL:[NSURL URLWithString:self.picturesArr[i]] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            ImageView.image = image;
        }];
        [self.lowerView configureUIViewWithData:data];
        
    }
    self.topperScrollView.contentSize = CGSizeMake(kScreenWidth*self.picturesArr.count, 0);
    _pageController.currentPageIndicatorTintColor = [UIColor redColor];
    _pageController.pageIndicatorTintColor = [UIColor whiteColor];
    //self.pageController.numberOfPages = self.picturesArr.count;
        self.topperScrollView.pagingEnabled = YES;
    self.topperScrollView.showsHorizontalScrollIndicator = NO;
    [self.pageController addTarget:self action:@selector(handleClickPage:) forControlEvents:UIControlEventValueChanged];
}
- (void)handleClickPage:(UIPageControl *)sender{
    self.topperScrollView.contentOffset = CGPointMake(kScreenWidth*sender.currentPage, 0);
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    float k = scrollView.contentOffset.x;
    NSInteger a = k/kScreenWidth;
    self.pageController.currentPage = a;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
