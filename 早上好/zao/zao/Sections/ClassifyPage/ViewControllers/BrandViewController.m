//
//  BrandViewController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/4.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "BrandViewController.h"
#import "SizeMacros.h"


#import "brandCollectionViewCell.h"
#import "branddModel.h"
#import "NetWorkRequset.h"
#import "UIImageView+WebCache.h"
#import "headerCollectionReusableView.h"
#import "ClickWebBrandViewController.h"
#import "MJRefresh.h"
#import "GetDataFromNetWorkModel.h"
#define KSBrand @"http://m.api.zhe800.com/v6/brand/getdealsbyid?brand_id=14688&per_page=20&new=1&order=&page=1"
@interface BrandViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,netWorkRequsetDelegate,GetDataFromNetWorkModelDelegate>
@property (nonatomic,retain)UICollectionView *collectionView;
@property (nonatomic,retain)NSMutableArray *dataArray;
@end

@implementation BrandViewController

- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        self.dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)dealloc{
    [_collectionView release];
    [_dataArray release];
    [_receviebrandmodel release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //接受上个界面传过来的名字  
    self.navigationItem.title = self.namemodel;
    //self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
   // 创建集合视图的私有方法
    [self LayoutOfCollectionView];
    //上拉刷新
   // [self UpdateLoad];
//    //创建对象
//    GetDataFromNetWorkModel *getDataobject = [[GetDataFromNetWorkModel alloc] init];
//    //设置代理对象
//    getDataobject.delegate = self;
//    //调用方法  请求数据
//    [getDataobject asynchronizeRequestByGET:[NSString stringWithFormat:@"http://m.api.zhe800.com/v6/brand/getdealsbyid?brand_id=%@&per_page=20&new=1&order=&page=1",self.receviebrandmodel]];
    
    
    
    

    //设置代理对象
       [NetWorkRequset shareNetWorkRequset].delegate = self;
    [NetWorkRequset getNetRequset:[NSString stringWithFormat:@"http://m.api.zhe800.com/v6/brand/getdealsbyid?brand_id=%@&per_page=20&new=1&order=&page=1",self.receviebrandmodel]];
    
    [self.collectionView reloadData];
    // Do any additional setup after loading the view.
}

#pragma mark - 更新数据源的方法
//更新数据源的方法
//static NSInteger pag = 1;
//- (void)loadModel{
//    
//    //AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    
//    [NetWorkRequset shareNetWorkRequset].delegate = self;
//    
//    NSString *urlstr = [NSString stringWithFormat:@"http://m.api.zhe800.com/v6/brand/getdealsbyid?brand_id=%@&per_page=20&new=1&order=&page=%ld",self.receviebrandmodel,(long)++pag];
//    
//    [NetWorkRequset getNetRequset:urlstr];
//    
//    
//    // [manager GET:urlstr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//    
//    // NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//    
//    // [self conllectionViewReload:dic];
//    
//    //    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//    //
//    //    }];
//    //
//    // ++pag;
//    
//    [self.collectionView reloadData];
//    
//}

#pragma mark==-----------添加上拉加载的方法
//上拉加载
//- (void)UpdateLoad{
//    BrandViewController  *weakSelf = self;
//    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//        
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            [weakSelf.collectionView.footer noticeNoMoreData];
//            [weakSelf loadModel];
//            
//            
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [weakSelf.collectionView reloadData];
//
//            [weakSelf.collectionView.footer endRefreshing];
//            });
//            
//            
//        });
//        
//    }];
//    self.collectionView.footer = footer;
//    
//    
//}

//- (void)getData:(NSData *)data{
//    
//    NSDictionary *dicjson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//    NSArray *brandarr = [dicjson objectForKey:@"objects"];
//    for (NSDictionary *tempdic in brandarr) {
//       
//        branddModel *model = [[branddModel alloc] initWithDic:tempdic];
//        
//        NSLog(@"%@",self.dataArray);
//        [model release];
//    }
//    
//    [self.collectionView reloadData];
//
//    
//}



//实现协议里的方法
- (void)conllectionViewReload:(id)data{
    NSArray *brandarr = [data objectForKey:@"objects"];
    for (NSDictionary *tempdic in brandarr) {
        NSLog(@"89778945645613213216546546465");
        branddModel *model = [[branddModel alloc] initWithDic:tempdic];
        [self.dataArray addObject:model];
        NSLog(@"%@",self.dataArray);
        [model release];
    }
   
    [self.collectionView reloadData];
}
//创建集合视图的私有方法
- (void)LayoutOfCollectionView{
    //创建layout布局对象
    UICollectionViewFlowLayout *_layout = [[UICollectionViewFlowLayout alloc] init];
    //设置每个item的大小
    _layout.itemSize = CGSizeMake(kScreenWidth/2.1, kScreenHeight/2.5);
    
    //设置分局的缩进量 控制item的位置
    _layout.sectionInset = UIEdgeInsetsMake(5, 5, 10, 2);
    //设置最小行间距
    _layout.minimumLineSpacing = 5;
    //设置最小item间距
    _layout.minimumInteritemSpacing = 5;
    //设置页眉的大小
   // _layout.headerReferenceSize = CGSizeMake(0, 30);
    ///创建集合视图对象
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:_layout];
    //设置代理对象
    _collectionView.dataSource =self;
    _collectionView.delegate = self;
    //只是整平滚动
    _collectionView.pagingEnabled = YES;
    _collectionView.backgroundColor = [UIColor whiteColor];
    //_collectionView.backgroundColor = [UIColor colorWithWhite:.8 alpha:.5];

    
    
    //注册cell
    [_collectionView registerClass:[brandCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    //注册页眉
    [_collectionView registerClass:[headerCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    
    [self.view addSubview:_collectionView];
    [_collectionView release];
    [_layout release];
    
    
    
}

#pragma mark--------UICollectionViewDataSource
//设置多分区的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//设置分区的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

//为每个分区的item配置内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    branddModel *model = [self.dataArray objectAtIndex:indexPath.row];
    brandCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    //cell.backgroundColor = [UIColor whiteColor];
    
       
    //为cell赋值
    cell.short_titleLabel.text = model.title;
    cell.priceLabel.text = [NSString stringWithFormat:@"￥%d",[model.price intValue]/100];
    cell.list_priceLabel.text = [NSString stringWithFormat:@"￥%d",[model.list_price intValue]/100];
    cell.list_priceLabel.textColor = [UIColor grayColor];
    cell.list_priceLabel.font = [UIFont systemFontOfSize:10];
    cell.sales_countLabel.text = [NSString stringWithFormat:@"已售%d件",[model.sales_count intValue]];
    cell.sales_countLabel.textColor = [UIColor grayColor];
    cell.sales_countLabel.font = [UIFont systemFontOfSize:10];
    if ((cell.baoyuLabel.text = [NSString stringWithFormat:@"%d",[model.baoyou intValue]])) {
        cell.baoyuLabel.text = @"包邮";
        cell.baoyuLabel.textColor = [UIColor redColor];
    }else{
        cell.baoyuLabel.text = nil;
    }
    if ((cell.soure_typeLabel.text = [NSString stringWithFormat:@"%d",[model.soure_type intValue]])) {
        cell.soure_typeLabel.text = @"去天猫";
        cell.soure_typeLabel.textColor = [UIColor grayColor];
        cell.soure_typeLabel.adjustsFontSizeToFitWidth = YES;
        
    }else{
        cell.soure_typeLabel.text = @"特卖商城";
        cell.soure_typeLabel.textColor = [UIColor grayColor];
        cell.soure_typeLabel.adjustsFontSizeToFitWidth = YES;
    }
    NSString *string =  [model.normal substringToIndex:model.normal.length - 5];
    NSURL *url = [NSURL URLWithString:string];
    
    [cell.image_urlView sd_setImageWithURL:url placeholderImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bgc" ofType:@"jpg"]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        cell.image_urlView.image = image;
    }];
    return cell;
}


//设置每个分区的页眉
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    headerCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    //headerView.headerLabel.backgroundColor = [UIColor orangeColor];
    //branddModel *model = [self.dataArray objectAtIndex:indexPath.row];
    
//     headerView.headerLabel.text = [NSString stringWithFormat:@"%d",[(model.expire_time) intValue] -  [(model.begin_time) intValue]];
//    
    
    
    return headerView;
    
}


//点击cell的响应方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ClickWebBrandViewController *clickweb = [[ClickWebBrandViewController alloc] init];
    clickweb.model = [self.dataArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:clickweb animated:YES];
    [clickweb release];
    
    
    
    
}



//返回页眉的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(0, 30);
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
