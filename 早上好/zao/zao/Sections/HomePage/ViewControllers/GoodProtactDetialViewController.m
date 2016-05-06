//
//  GoodProtactDetialViewController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "GoodProtactDetialViewController.h"
#import "SizeMacros.h"
#import "BrandDetailCollectionViewCell.h"
#import "NetWorkRequset.h"
#import "brandDetailListModel.h"
#import "goodsPredictViewController.h"
@interface GoodProtactDetialViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,netWorkRequsetDelegate>
@property (nonatomic,retain)UICollectionView *collectionView;
@property (nonatomic,retain)NSMutableArray *dataArray;
@end

@implementation GoodProtactDetialViewController
-(void)dealloc{
    [_receiveWapUrlString release];
    [_collectionView release];
    [_dataArray release];
    [super dealloc];
}
- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        self.dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self comfigureCollectionLayout];
    [self configureNet];
    [self.collectionView registerClass:[BrandDetailCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.navigationItem.title = @"精品预告";
     self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"%@",self.receiveWapUrlString);
    // Do any additional setup after loading the view.
}
- (void)configureNet{
    [NetWorkRequset shareNetWorkRequset].delegate = self;
    [NetWorkRequset getNetRequset:@"http://m.api.zhe800.com/v2/forecast/deals?image_type=all&image_model=webp&page=1&per_page=20"];
}
- (void)conllectionViewReload:(id)data{
    NSArray *arr = [data objectForKey:@"objects"];
    for (NSDictionary *dic in arr) {
        brandDetailListModel *model = [[brandDetailListModel alloc]initWithDic:dic];
        [self.dataArray addObject:model];
        [model release];
    }
    [self.collectionView reloadData];
}
- (void)comfigureCollectionLayout{
    UICollectionViewFlowLayout *_layout = [[UICollectionViewFlowLayout alloc]init];
    _layout.itemSize = CGSizeMake(kScreenWidth/2.13, kScreenHeight/2.1);
    _layout.minimumInteritemSpacing = kScreenWidth/37.5;
    _layout.minimumLineSpacing = kScreenHeight/37.5;
    _layout.sectionInset = UIEdgeInsetsMake(0, 5,5, 5);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) collectionViewLayout:_layout];
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
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    goodsPredictViewController *goodsPredictVC = [[goodsPredictViewController alloc]init];
    brandDetailListModel *model = [self.dataArray objectAtIndex:indexPath.row];
    goodsPredictVC.model = model;
    [self.navigationController pushViewController:goodsPredictVC animated:YES];
    [goodsPredictVC release];
    
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
