//
//  HotListBrandViewController.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "HotListBrandViewController.h"
#import "NetWorkRequset.h"
#import "BrandDetailCollectionViewCell.h"
#import "SizeMacros.h"
#import "brandDetailListModel.h"
#import "BrandDetailView.h"
#import "UIImageView+WebCache.h"
#import "hotGoodsViewController.h"
#import "refreshView.h"
#import "timeView.h"
#import "MJRefresh.h"
#import "GoodsDetailsViewController.h"
@interface HotListBrandViewController ()<netWorkRequsetDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,retain)NSMutableArray *dataArray;
@property (nonatomic,retain)UICollectionView *collectionView;
@property (nonatomic,retain)BrandDetailView *upperView;
@property (nonatomic,retain)refreshView *refreshView;
@property (nonatomic,retain)UILabel *bottomLabel;
@property (nonatomic,retain)UIButton *backButton;
@property (nonatomic,assign)NSInteger k;
@property (nonatomic,retain)timeView *timeView;
@end

@implementation HotListBrandViewController
- (void)dealloc{
    [_dataArray release];
    [_collectionView release];
    [_brandModel release];
    [_refreshView release];
    [_bottomLabel release];
    [_backButton release];
    [_timeView release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.k = 0;
    [self configureRefreshView];
    [self configureNavigation];
    [self configureUpperView];
    [self comfigureCollectionLayout];
    [self requestURLData];
    [self configureTimeView];
    [self addHeader];
    [self configureBackButtonTo];
    //[self configureTimeView];
    // Do any additional setup after loading the view.
}
- (void)configureTimeView{
    self.timeView = [[[timeView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth/375*30)]autorelease];
    self.timeView.backgroundColor = [UIColor colorWithWhite:.88 alpha:.5];
    [self.collectionView addSubview:self.timeView];
    NSDate *datnow = [NSDate date];
    NSDateFormatter * dm = [[NSDateFormatter alloc]init];
    [dm setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate * newdate = [dm dateFromString:self.brandModel.expire_time];
    
    long dd = (long)[newdate timeIntervalSince1970]-[datnow timeIntervalSince1970];
    NSString *timeString=nil;
    
    if (dd/60<1) {
        
        self.timeView.dayLabel.text = [NSString stringWithFormat:@"0"];
        self.timeView.hourLabel.text = [NSString stringWithFormat:@"00"];
        self.timeView.minuteLabel.text = [NSString stringWithFormat:@"00"];
        self.timeView.secondLabel.text = [NSString stringWithFormat:@"%ld",dd];
        
    }
    if (dd/3600<1)
    {
        self.timeView.dayLabel.text = [NSString stringWithFormat:@"0"];
        self.timeView.hourLabel.text = [NSString stringWithFormat:@"00"];
        timeString = [NSString stringWithFormat:@"%ld", dd/60];
        self.timeView.minuteLabel.text=[NSString stringWithFormat:@"%@", timeString];
        self.timeView.secondLabel.text = [NSString stringWithFormat:@"%ld", dd%60];
        
    }
    if (dd/3600>1&&dd/86400<1)
    {
        self.timeView.dayLabel.text = [NSString stringWithFormat:@"0"];
        self.timeView.hourLabel.text = [NSString stringWithFormat:@"%ld",dd/3600];
        timeString = [NSString stringWithFormat:@"%ld", dd%3600];
        self.timeView.minuteLabel.text=[NSString stringWithFormat:@"%ld", [timeString integerValue]/60];
        
        self.timeView.secondLabel.text = [NSString stringWithFormat:@"%ld",[timeString integerValue]%60];
        
    }
    if (dd/86400>1)
    {
        self.timeView.dayLabel.text = [NSString stringWithFormat:@"%ld",dd/86400];
        if (dd%86400/3600<10) {
            self.timeView.hourLabel.text = [NSString stringWithFormat:@"0%ld",dd%86400/3600];
        }else{
            self.timeView.hourLabel.text = [NSString stringWithFormat:@"%ld",dd%86400/3600];
        }
        if (dd%86400%3600/60<10) {
            self.timeView.minuteLabel.text = [NSString stringWithFormat:@"0%ld",dd%86400%3600/60];
        }else{
            self.timeView.minuteLabel.text = [NSString stringWithFormat:@"%ld",dd%86400%3600/60];
        }
        if (dd%86400%3600%60<10) {
            self.timeView.secondLabel.text = [NSString stringWithFormat:@"0%ld",dd%86400%3600%60];
        }else{
            self.timeView.secondLabel.text = [NSString stringWithFormat:@"%ld",dd%86400%3600%60];
        }
        
        
    }
    
}
- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        self.dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)configureRefreshView{
    self.refreshView = [[[refreshView alloc]initWithFrame:CGRectMake(0, kScreenHeight/4.2+kScreenWidth/37.5, kScreenWidth, kScreenWidth/375*30)]autorelease];
    [self.view addSubview:self.refreshView];
    for (int i = 0; i < 3; i++) {
        UIButton *button = (UIButton *)[self.refreshView viewWithTag:100+i];
        [button addTarget:self action:@selector(handleClikButton1:) forControlEvents:UIControlEventTouchUpInside];
    }
}
- (void)handleClikButton1:(UIButton *)sender{
    if ([sender.currentTitle isEqualToString:@"销量"]) {
        NSString *str = [NSString stringWithFormat:@"http://m.api.zhe800.com/v6/brand/getdealsbyid?new=1&per_page=20&brand_id=%@&image_model=webp&order=saled&page=1",self.brandModel._id];
        [NetWorkRequset getNetRequset:str];
    }else if ([sender.currentTitle isEqualToString:@"价格"]){
        [NetWorkRequset getNetRequset:[NSString stringWithFormat:@"http://m.api.zhe800.com/v6/brand/getdealsbyid?new=1&per_page=20&brand_id=%@&image_model=webp&order=price&page=1",self.brandModel._id]];
    }else{
        [self requestURLData];
    }
}

- (void)conllectionViewReload:(id)data{
    [self.dataArray removeAllObjects];
    NSArray *dataArr = [data objectForKey:@"objects"];
    for (NSDictionary *dic in dataArr) {
        [self.collectionView reloadData];
        brandDetailListModel *model = [[brandDetailListModel alloc]initWithDic:dic];
        [self.dataArray addObject:model];
        
    }
    
    [self.collectionView reloadData];
}

- (void)configureBackButtonTo{
    self.bottomLabel = [UIButton buttonWithType:UIButtonTypeCustom];
    _bottomLabel.backgroundColor = [UIColor whiteColor];
    _bottomLabel.frame = CGRectMake(0, kScreenHeight-40, kScreenWidth, 40);
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton.frame = CGRectMake(0, 0, 40, 40);
    //self.backButton.backgroundColor = [UIColor greenColor];
    [self.backButton addTarget:self action:@selector(handleBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.backButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"common_goback_btn@2x" ofType:@"png"]] forState:UIControlStateNormal];
    [self.bottomLabel addSubview:self.backButton];
    [self.view addSubview:_bottomLabel];
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [UIView animateWithDuration:.5 animations:^{
        if (self.collectionView.contentOffset.y>50) {
            self.upperView.frame = CGRectMake(0, -kScreenHeight/4.2-kScreenWidth/37.5*2, kScreenWidth, kScreenHeight/4.2);
            self.collectionView.frame = CGRectMake(0, kScreenHeight/3.9+kScreenHeight/18-kScreenWidth/10.9-kScreenHeight/4.2+64, kScreenWidth, kScreenHeight-kScreenHeight/5.5+kScreenWidth/375*50);
            self.upperView.special_nameLabel.frame = CGRectMake(0, 20, kScreenWidth, 20);
            self.upperView.special_nameLabel.textColor = [UIColor colorWithWhite:.1 alpha:.9];
            self.upperView.special_nameLabel.font = [UIFont systemFontOfSize:18];
            [self.view addSubview:self.upperView.special_nameLabel];
            self.refreshView.frame = CGRectMake(0, 42, kScreenWidth, 40);
            self.refreshView.backgroundColor = [UIColor colorWithRed:.6 green:1 blue:.8 alpha:.2];
            
            // CGRectMake(0, kScreenHeight/4.2+kScreenWidth/37.5, kScreenWidth, kScreenWidth/375*30)
        }else if (self.collectionView.contentOffset.y>=10){
            self.upperView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight/4.2);
            self.collectionView.frame = CGRectMake(0, kScreenHeight/3.9+kScreenHeight/18-kScreenWidth/10.9+kScreenWidth/375*30, kScreenWidth, kScreenHeight-kScreenHeight/3.9);
            self.upperView.special_nameLabel.frame = CGRectMake(kScreenWidth/2-kScreenWidth/3.92, kScreenHeight/16.9+kScreenHeight/12+kScreenHeight/16.67/5.2, kScreenWidth/2, 40);
            self.upperView.special_nameLabel.font = [UIFont systemFontOfSize:15];
            self.upperView.special_nameLabel.textColor = [UIColor whiteColor];
            self.refreshView.frame = CGRectMake(0, kScreenHeight/4.2+kScreenWidth/37.5, kScreenWidth, kScreenWidth/375*30);
            self.refreshView.backgroundColor = [UIColor whiteColor];
            
        }
    }];
    
    
    
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    [UIView animateWithDuration:.5 animations:^{
        if (self.k ==0) {
            
            
            self.bottomLabel.frame = CGRectMake(0, kScreenHeight-40, kScreenWidth, 40);
            
            self.k = 1;
        }else{
            self.bottomLabel.frame = CGRectMake(0, kScreenHeight+40, kScreenWidth, 40);
            
            self.k = 0;
        }
    }];
}



- (void)requestURLData{
    if (self.dataArray) {
        [self.dataArray removeAllObjects];
    }
    [NetWorkRequset shareNetWorkRequset].delegate = self;
    NSString *completedURLStr = [NSString stringWithFormat:@"http://m.api.zhe800.com/v6/brand/getdealsbyid?new=1&per_page=20&brand_id=%@&image_model=webp&page=1",self.brandModel._id];
    //NSLog(@"%@",self.brandModel._id);
    [NetWorkRequset getNetRequset:completedURLStr];
}

- (void)addHeader{
    HotListBrandViewController *weakSelf = self;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [weakSelf updateDataSource];//更新数据
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.collectionView reloadData];//重新加载tableView；
                [weakSelf.collectionView.header endRefreshing];//关闭刷新效果
            });
        });
    }];
    self.collectionView.header = header;
}
- (void)updateDataSource{
    [self requestURLData];
}

- (void)comfigureCollectionLayout{
    UICollectionViewFlowLayout *_layout = [[UICollectionViewFlowLayout alloc]init];
    _layout.itemSize = CGSizeMake(kScreenWidth/2.1, kScreenHeight/2.1);
    _layout.minimumInteritemSpacing = kScreenWidth/375*5;
    _layout.minimumLineSpacing = kScreenHeight/375*5;
    _layout.sectionInset = UIEdgeInsetsMake(30, 5,5, 5);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, kScreenHeight/3.9+kScreenHeight/18-kScreenWidth/10.9+kScreenWidth/375*30, kScreenWidth, kScreenHeight-kScreenHeight/3.9) collectionViewLayout:_layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerClass:[BrandDetailCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    _collectionView.backgroundColor = [UIColor colorWithWhite:.8 alpha:.5];
    [self.view addSubview:_collectionView];
    [_layout release];
    [_collectionView release];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BrandDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    brandDetailListModel *model = [self.dataArray objectAtIndex:indexPath.row];
    [cell configureCollectionCellWithBrandDetailListModel:model];
    
    return cell;
    
}
- (void)configureUpperView{
    
    
    self.upperView = [[BrandDetailView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/4.2)];
    _upperView.special_nameLabel.text = self.brandModel.special_name;
    _upperView.titleLabel.text = self.brandModel.title;
    
    [self.view addSubview:_upperView];
    [_upperView release];
    NSURL *url = [NSURL URLWithString:self.brandModel.logo_image];
    [_upperView.logo_imageView sd_setImageWithURL:url placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        _upperView.logo_imageView.image = image;
    }];
    
    
}
- (void)handleBack:(UIButton *)sender{
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    GoodsDetailsViewController *hotVC = [[GoodsDetailsViewController alloc]init];
    brandDetailListModel *model = [self.dataArray objectAtIndex:indexPath.row];
    hotVC.model = model;
    [self.navigationController pushViewController:hotVC animated:YES];
}
- (void)configureNavigation{
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;
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
