//
//  ClassifyOtherController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/7/31.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "ClassifyOtherController.h"
#import "CustomCell.h"
#import "ClassifyModel.h"
#import "NetWorkRequset.h"
#import "SizeMacros.h"
//#import "ThemeViewCell.h"
#import "ThemCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "WebpageLodController.h"
#import "MJRefresh.h"
#import "AFNetworkReachabilityManager.h"
#define KAAFNRequestURl @"http://th5.m.zhe800.com/theme/deals?theme_pavilion_id=6&image_type=hd5&image_model=jpg&url_name=all&per_page=20&page=1"
#define kAAtheme @"http://m.api.zhe800.com/theme/hot?user_type=1&user_role=1&student=0&image_model=webp"

@interface ClassifyOtherController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,netWorkRequsetDelegate>//1.遵守协议
@property (nonatomic,retain)UICollectionViewFlowLayout *layout;//布局对象
@property (nonatomic,retain)UICollectionView *collectionView;//集合视图对象
@property (nonatomic,retain)NSMutableArray *dataArry;//数据源  用来存储ClassifyModel对象
@end

@implementation ClassifyOtherController
- (void)dealloc{
    [_layout release];
    [_collectionView release];
    [_dataArry release];
    [_Thememodel release];
    [_recevicethemmodel release];
    [super dealloc];
}
- (NSMutableArray *)dataArry{
    if (_dataArry == nil) {
        self.dataArry = [NSMutableArray array];
    }
    return _dataArry;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.Thememodel;
    //self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:20]};
    //主题馆的集合视图
    [self ThemePavilionsCollectionView];
    
    
    //设置代理对象
    [NetWorkRequset shareNetWorkRequset].delegate = self;
    
  
    //调用方法   请求数据
    [NetWorkRequset getNetRequset:[NSString stringWithFormat:@"http://th5.m.zhe800.com/theme/deals?theme_pavilion_id=%@&image_type=hd5&image_model=jpg&url_name=all&per_page=20&page=1",self.recevicethemmodel]];
    
    //上拉刷新
    [self UpdateLoad];
    [self.collectionView reloadData];
    // Do any additional setup after loading the view.
}
//上拉刷新
static NSInteger thempag = 1;
- (void)loadThemeModel{
    [NetWorkRequset shareNetWorkRequset].delegate = self;
    NSString *themeurl = [NSString stringWithFormat:@"http://th5.m.zhe800.com/theme/deals?theme_pavilion_id=%@&image_type=hd5&image_model=jpg&url_name=all&per_page=20&page=%ld",self.recevicethemmodel,(long)++thempag];
    [NetWorkRequset getNetRequset:themeurl];
    [self.collectionView reloadData];
    
}

#pragma mark==-----------添加上拉加载的方法
//上拉加载
- (void)UpdateLoad{
    ClassifyOtherController  *weakSelf = self;
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [weakSelf.collectionView.footer noticeNoMoreData];
            [weakSelf loadThemeModel];
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.collectionView reloadData];
                
                [weakSelf.collectionView.footer endRefreshing];
            });
            
            
        });
        
    }];
    self.collectionView.footer = footer;
    
    
}


//实现协议里的方法
- (void)conllectionViewReload:(id)data{
    //获取字典所对应的数组
    NSArray *Arry = [data objectForKey:@"objects"];
    
    //遍历数组得到字典   然后封装成ClassifyModel.h
    for (NSDictionary *tempDic in Arry) {
        //将遍历出来的字典封装成对象
        ClassifyModel *model = [[ClassifyModel alloc] initWithDic:tempDic];
        //将对象添加到数据数组中
        [self.dataArry addObject:model];
        [model release];
    }
    //刷新collectionView
    [self.collectionView reloadData];
    
    
}



//主题馆的集合视图
- (void)ThemePavilionsCollectionView{
    
    //创建layout布局对象
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    //设置每个item的大小
    self.layout.itemSize = CGSizeMake(kScreenWidth/2.1, kScreenHeight/2.5);
    
    //设置分区的缩进量  控制item的位置
    self.layout.sectionInset = UIEdgeInsetsMake(5, 5, 10, 2);
    //设置最小行间距
    self.layout.minimumLineSpacing = 5;
    //设置小item的间距
    self.layout.minimumInteritemSpacing = 5;
    //设置页脚的大小
    //self.layout.footerReferenceSize = CGSizeMake(0, 40);
    //设置页眉的大小
    //self.layout.headerReferenceSize = CGSizeMake(0, 30);
    
    //创建集合视图对象
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:_layout];
    //设置代理对象   数据源代理
    self.collectionView.dataSource = self;
    //设置显示控件代理
    self.collectionView.delegate = self;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    
    
//    //注册cell
    [self.collectionView registerClass:[ThemCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
//    //注册页眉
//    [self.collectionView registerClass:[HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
//    
    
    [self.view addSubview:self.collectionView];
    
    [self.collectionView release];
    [self.layout release];

    
    
}


#pragma mark -------------集合视图UICollectionViewDataSource-------
//设置多个分区个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
    
}
//设置分区的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
        
    
 return self.dataArry.count;
    
    
    
}


//为每个分区的item配置内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //取出该item所对用的model
    
     ClassifyModel *model = [self.dataArry objectAtIndex:indexPath.row];
         ThemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        //为cell赋值
        cell.short_titleLabel.text = model.short_title;
        cell.priceLabel.text = [NSString stringWithFormat:@"￥%d",[model.price intValue]/100];
        ;
        
        if ((cell.baoyuLabel.text = [NSString stringWithFormat:@"%d",[model.baoyou intValue]])) {
            cell.baoyuLabel.text = @"包邮";
            cell.baoyuLabel.textColor = [UIColor redColor];
        }
    
       cell.list_priceLabel.text = [NSString stringWithFormat:@"￥%d",[model.list_price intValue]/100];
        cell.sales_countLabel.text = [NSString stringWithFormat:@"已售%d件",[model.sales_count intValue]];
        NSURL *url = [NSURL URLWithString:model.image_url];
        [cell.image_urlView sd_setImageWithURL:url placeholderImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bgc" ofType:@"jpg"]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            cell.image_urlView.image = image;
        }];
        
        
        return cell;
    
    
}


#pragma mark------  UICollectionViewDelegateFlowLayout 这个代理里面的方法
////为UICollectionView每个item设置大小
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//   
//    return CGSizeMake([UIScreen mainScreen].bounds.size.width / 2.2, 250);
//    
//    
//}


////返回页眉的高度
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    if (section == 1) {
//        return CGSizeMake(0, 30);
//        
//    }else{
//        return CGSizeMake(0, 0);
//    }
//}
//


//点击cell（item）的响应方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    WebpageLodController *webpage = [[WebpageLodController alloc] init];
    webpage.model = [self.dataArry objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:webpage animated:YES];
    
    [webpage release];
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
