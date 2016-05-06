//
//  homeViewController.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-3.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "homeViewController.h"
#import "SizeMacros.h"
#import "NetWorkRequset.h"
#import "brandSessionModel.h"
#import "BrandSessionTableViewCell.h"
#import "TopperTwoBrandView.h"
#import "TopScrollView.h"
#import "HotBrandTableViewController.h"
#import "ForeshowBrandTableViewController.h"
#import "BrandDetailViewController.h"
#import "MJRefresh.h"
#import "NoSingleNetWorkRequest.h"
#import "homeCollectionViewCell.h"
#import "TopperTwoBrandView.h"
@interface homeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,netWorkRequsetDelegate,homeControllerDelegate,UIScrollViewDelegate,topScrollViewDelegate,UITabBarControllerDelegate>
@property (nonatomic,retain)UICollectionView *collectionView;
@property (nonatomic,retain)NSMutableArray *dataArr;
@property (nonatomic,assign)NSInteger pageNumber;
@property (nonatomic,retain)TopperTwoBrandView *topperTwoBrandView;
@property (nonatomic,retain)TopScrollView *topScrollView;
@property (nonatomic,retain)NSString *URLString;
@property (nonatomic,retain)homeCollectionViewCell *collectionCell;
@property (nonatomic,retain)UILabel *cuspLabel;
@end

@implementation homeViewController
- (void)dealloc{
    [_collectionView release];
    [_dataArr release];
    [_topperTwoBrandView release];
    [_topScrollView release];
    [_URLString release];
    [_collectionCell release];
    [_cuspLabel release];
    [super dealloc];
}
- (NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        self.dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (UILabel *)cuspLabel{
    if (_cuspLabel == nil) {
        self.cuspLabel = [[[UILabel alloc]initWithFrame:CGRectMake(0, 38, kScreenWidth/5, 10)]autorelease];
        _cuspLabel.text = @"^";
        _cuspLabel.textAlignment = NSTextAlignmentCenter;
        //_cuspLabel.backgroundColor = [UIColor redColor];
        _cuspLabel.textColor = [UIColor grayColor];
    }
    return [[_cuspLabel retain]autorelease];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.topScrollView.scrollView.delegate =self;
    self.collectionView.delegate = self;
    [self configureCollectionView];
    [self configureTopScrollView];
    self.topScrollView.delegate = self;
    self.tabBarController.delegate = self;
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    //注册
    [self.collectionView registerClass:[homeCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    UIButton *button = (UIButton *)[self.topScrollView.scrollView viewWithTag:100];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.topScrollView.scrollView addSubview:self.cuspLabel];
    self.navigationController.navigationBar.translucent = YES;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        
                UITabBarItem *brandTeamBarButton = [[UITabBarItem alloc]initWithTitle:@"品牌团" image:[[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"home_tab_branc_btn@2x" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"home_tab_branc_selected_btn@2x" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                self.tabBarController.tabBar.tintColor = [UIColor redColor];
                self.tabBarItem = brandTeamBarButton;
        brandTeamBarButton.imageInsets = UIEdgeInsetsMake(7, 0, -7, 0);
        
    }
    
        return self;
}
//用代理传值的方法 得到上面的滑动视图的index
-(void)handleClickThebutton:(UIButton *)sender{
       [UIView animateWithDuration:.2 animations:^{
           NSInteger contentSizeX =  (NSInteger)kScreenWidth*(sender.tag-100);
           self.collectionView.contentOffset = CGPointMake(contentSizeX,-kScreenWidth/5.769);
           if (sender.tag==101||sender.tag == 102) {
               self.topScrollView.scrollView.contentOffset = CGPointMake(0, 0);
           }
           if (sender.tag-100>2 && sender.tag-100<15) {
               float k =  kScreenWidth/5;
               self.topScrollView.scrollView.contentOffset = CGPointMake(k*(sender.tag-102), 0);
           }
            self.cuspLabel.frame = CGRectMake(kScreenWidth/5*(sender.tag-100), 38, kScreenWidth/5, 10);
       
    }];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGFloat a = self.collectionView.contentOffset.x;
    NSInteger b = (NSInteger)a/kScreenWidth;
       UIButton *button = (UIButton *)[self.topScrollView.scrollView viewWithTag:(100+b)];
    [UIView animateWithDuration:.5 animations:^{
    int i  = 0;
        
    for (NSString *tittle in self.topScrollView.itemsArr) {
        if ([button.titleLabel.text isEqualToString:tittle]) {
            button.titleLabel.font = [UIFont systemFontOfSize:16];
           [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            self.cuspLabel.frame = CGRectMake(kScreenWidth/5*i, 38, kScreenWidth/5, 10);
        }else{
            
            UIButton *button = (UIButton *)[self.topScrollView.scrollView viewWithTag:(100+i)];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:13];
        }
        
        i ++;
    }
        if (b == 0) {
            self.topScrollView.scrollView.contentOffset = CGPointMake(0, 0);
        }
        
    if (button.tag>102&&button.tag<115) {
        self.topScrollView.scrollView.contentOffset = CGPointMake(kScreenWidth/5*(b-2), 0);
    }
//        for (int i = 0; i<self.topScrollView.itemsArr.count; i++) {
//            
//        }
        
        
        
    }];
}
- (void)configureTopScrollView{
    self.topScrollView = [[[TopScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth/7.5)]autorelease];
    [self.navigationController.navigationBar addSubview:self.topScrollView];
}
- (void)configureCollectionView{
    UICollectionViewFlowLayout *_layout = [[UICollectionViewFlowLayout alloc]init];
    _layout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight);
    _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);

    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight) collectionViewLayout:_layout];
    _layout.minimumInteritemSpacing = 0;
    _layout.minimumLineSpacing = 0;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.pagingEnabled = YES;
    _collectionCell.backgroundColor = [UIColor whiteColor];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:self.collectionView];
    [_layout release];
    [_collectionView release];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 17;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    homeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.delegate = self;
    NSArray *urlArr = @[@"http://m.api.zhe800.com/v6/brand/branddeals/today?page=%ld&per_page=20&counts=1&user_role=6&user_type=1",@"http://m.api.zhe800.com/v6/brand/branddeals/yesterday?page=%ld&per_page=20&counts=1&user_role=6&user_type=1",@"http://m.api.zhe800.com/v6/brand/branddeals/last?page=%ld&per_page=20&counts=1&user_role=1&user_type=1",@"http://m.api.zhe800.com/v6/brand/branddeals?page=%ld&per_page=20&counts=1&url_name=brands1",@"http://m.api.zhe800.com/v6/brand/branddeals?page=%ld&per_page=20&counts=1&url_name=brands5",@"http://m.api.zhe800.com/v6/brand/branddeals?page=%ld&per_page=20&counts=1&url_name=brands13",@"http://m.api.zhe800.com/v6/brand/branddeals?page=%ld&per_page=20&counts=1&url_name=brands4",@"http://m.api.zhe800.com/v6/brand/branddeals?page=%ld&per_page=20&counts=1&url_name=brands2",@"http://m.api.zhe800.com/v6/brand/branddeals?page=%ld&per_page=20&counts=1&url_name=brands12",@"http://m.api.zhe800.com/v6/brand/branddeals?page=%ld&per_page=20&counts=1&url_name=brands6",@"http://m.api.zhe800.com/v6/brand/branddeals?page=%ld&per_page=20&counts=1&url_name=brands7",@"http://m.api.zhe800.com/v6/brand/branddeals?page=%ld&per_page=20&counts=1&url_name=brands3",@"http://m.api.zhe800.com/v6/brand/branddeals?page=%ld&per_page=20&counts=1&url_name=brands9",@"http://m.api.zhe800.com/v6/brand/branddeals?page=%ld&per_page=20&counts=1&url_name=brands15",@"http://m.api.zhe800.com/v6/brand/branddeals?page=%ld&per_page=20&counts=1&url_name=brands8",@"http://m.api.zhe800.com/v6/brand/branddeals?page=%ld&per_page=20&counts=1&url_name=brands14",@"http://m.api.zhe800.com/v6/brand/branddeals?page=%ld&per_page=20&counts=1&url_name=brands11"];

   
    
    cell.receiveURLStr = urlArr[indexPath.section];
        if (indexPath.section == 0) {
            self.topperTwoBrandView = [[[TopperTwoBrandView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/6.5)]autorelease];
        cell.tableView.tableHeaderView = self.topperTwoBrandView;
        [self.topperTwoBrandView.leftButton addTarget:self action:@selector(handleClickLeftButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.topperTwoBrandView.rightButton addTarget:self action:@selector(handleClickRightButton:) forControlEvents:UIControlEventTouchUpInside];
        }else if (indexPath.section != 0){
            if (self.collectionView.contentOffset.x>kScreenWidth) {
                cell.tableView.tableHeaderView = nil;
                [self.topperTwoBrandView removeFromSuperview];
            }
        }

    [cell getURLstring];//在cell创建后 传网址给collectionCell  不然的话  收不到这边的传值
//    if (self.tabBarController.selectedIndex!=2) {
//        cell.toTopButton.frame = CGRectMake(0, 0, 0, 0);
//    }
           return cell;
}
- (void)pushToBrandDetailListViewController:(brandSessionModel *)model{
    BrandDetailViewController *brandDetailVC = [[BrandDetailViewController alloc]init];
    
    brandDetailVC.brandModel = model;
    [self.navigationController pushViewController:brandDetailVC animated:NO];
    brandDetailVC.tabBarController.tabBar.hidden = YES;
    [brandDetailVC release];
}
- (void)passPageNumber:(NSInteger)pageNumber{
    self.pageNumber = pageNumber;
}
- (void)viewWillDisappear:(BOOL)animated{
    [self.topScrollView removeFromSuperview];
    //self.navigationController.navigationBar.hidden = YES;
    //self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar addSubview:self.topScrollView];
    self.navigationController.navigationBar.hidden = NO;
    //self.tabBarController.tabBar.hidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//点击热门品牌按钮后的事件
- (void)handleClickLeftButton:(UIButton *)sender{
   
    HotBrandTableViewController *hotBrandTVC = [[HotBrandTableViewController alloc]init];
    
    [self.navigationController pushViewController:hotBrandTVC animated:YES];
    hotBrandTVC.tabBarController.tabBar.hidden = YES;
    [hotBrandTVC release];
}
//点击品牌预告按钮后的事件
- (void)handleClickRightButton:(UIButton *)sender{
    
    ForeshowBrandTableViewController *foreshowBrandTVC = [[ForeshowBrandTableViewController alloc]init];
    [self.navigationController pushViewController:foreshowBrandTVC animated:YES];
    [foreshowBrandTVC release];
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
