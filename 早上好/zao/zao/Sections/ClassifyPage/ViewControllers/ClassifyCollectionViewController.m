//
//  ClassifyCollectionViewController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/7/30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "ClassifyCollectionViewController.h"
#import "CustomCell.h"
#import "AllViewCell.h"
#import "AllModel.h"
#import "NetWorkRequset.h"
#import "UIImageView+WebCache.h"
#import "AllWebPageLoadController.h"
#import "SizeMacros.h"
#import "ClassifyScrollViewCell.h"
#import "ScrollModel.h"
#import "NoSingleNetWorkRequest.h"
#import "ClassifyOtherController.h"
#define KSScroll @"http://m.api.zhe800.com/tao800/bannerv2.json?url_name=wireless1004&platform=android&channelid=248c15&productkey=tao800&cityid=25&userType=1&userRole=1&unlock=1&image_model=webp"
//#define KSMenClothing @"http://m.api.zhe800.com/v5/deals?parent_tag=&url_name=wireless1004&order=&min_price=&max_price=&user_type=1&user_role=1&shop_type=&image_type=all&image_model=webp&page=1&per_page=20"
#define KSMenClothing @"http://m.api.zhe800.com/v5/deals?parent_tag=&url_name=wireless1004&order=&min_price=&max_price=&user_type=1&user_role=1&shop_type=&image_type=all&image_model=webp&page=1&per_page=20"
@interface ClassifyCollectionViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,netWorkRequsetDelegate,noSingleNetWorkRequestDelegate>
@property (nonatomic,retain)UISegmentedControl *segment;
@property (nonatomic,retain)UIScrollView *scrollView;
@property (nonatomic,retain)UIPageControl *pageControl;
@property (nonatomic,retain)UITableView *tableView;
@property (nonatomic,retain)NSMutableArray *dataArry;//数据源  用来存储AllModel对象
@property (nonatomic,retain)NSMutableArray *scrollArry;//用来存储ScrollModel对象

@end

@implementation ClassifyCollectionViewController
- (void)dealloc{
    [_scrollView release];
    [_tableView release];
    [_segment release];
    [_pageControl release];
    [super dealloc];
    
}
//懒加载
- (NSMutableArray *)dataArry{
    if (_dataArry == nil) {
        self.dataArry = [NSMutableArray array];
    }
    return _dataArry;
}

- (NSMutableArray *)scrollArry{
    if (_scrollArry == nil) {
        self.scrollArry = [NSMutableArray array];
    }
    return  _scrollArry;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"上衣";
    
    
    //布局UISegmentedControll
    [self LayoutOfUISegmentedControll];
    
    
    //设置UISCrollView和UIPagecontrol
   // [self setUpUIScrollViewAndPageControl];
    
    //创建表示图对象的私有方法
    [self CreateRepresentation];
    //设置代理对象
    [NetWorkRequset shareNetWorkRequset].delegate = self;
    //调用协议里的方法
    [NetWorkRequset getNetRequset:KSMenClothing];
    
    //滚动视图的网络请求
    NoSingleNetWorkRequest * nosilene = [[NoSingleNetWorkRequest alloc] init];
    //设置代理对象
    nosilene.delegate = self;
    //调用协议里的方法
    [nosilene getRequestInterNet:KSScroll];
    
    
    
    //刷新
    [self.tableView reloadData];
    
    
   
    // Do any additional setup after loading the view.
}

//实现协议里的方法
- (void)conllectionViewReload:(id)data{
    //获取字典对应的数组
    NSArray *Arry = [data objectForKey:@"objects"];
    //遍历数组得到对应的字典 然后封装成AllModel对象
    for (NSDictionary *tmpeDic in Arry) {
        //将遍历出来的对象封装对象
        AllModel *model = [[AllModel alloc] initWithDic:tmpeDic];
        //将封装的对象添加到数组中
        [self.dataArry addObject:model];
        [model release];
    }
    //刷新
    [self.tableView reloadData];
    
}


//实现协议里方法  滚动视图
- (void)configurationModelWithRequsetData:(id)data{
    //遍历数组得到字典
    for (NSDictionary *scrolldic in data) {
        //封装成对象
        ScrollModel *model = [[ScrollModel alloc] initWithDic:scrolldic];
        //添加到数组中
        [self.scrollArry addObject:model];
        [model release];
    }
    [self.tableView reloadData];
    
}

#pragma mark ----------------布局UISegmentedControll
//布局UISegmentedControll
- (void)LayoutOfUISegmentedControll{
    self.segment = [[UISegmentedControl alloc] initWithItems:@[@"默认",@"销量",@"价格",@"最新"]];
    self.segment.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight/13.34);
    [self.segment addTarget:(self) action:@selector(handleClicksegmente:) forControlEvents:UIControlEventValueChanged];
    self.segment.selectedSegmentIndex = 0;
    [self.view addSubview:self.segment];
    NSLog(@"ashfrhfwfjsdfjsd");
    [self.segment release];
}
    
 //点击segment 的响应事件
- (void)handleClicksegmente:(UISegmentedControl *)sender{
    NSLog(@"jahsf");
}
    
    
////设置UISCrollView和UIPagecontrol
//- (void)setUpUIScrollViewAndPageControl{
//    //创建滑动视图对象
//    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 104, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 0.35)];
//    //设置内容区域范围
//    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, 120);
//    //设置整平滚动
//    self.scrollView.pagingEnabled = YES;
//    //去掉水平方向的滚动条
//    self.scrollView.showsHorizontalScrollIndicator = NO;
//    //往scrollView上添加图片
//    for (int i = 1; i < 3; i++) {
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"v6_guide_%d",i] ofType:@"png"]]];
//        //设置from
//        imageView.frame = CGRectMake(self.view.frame.size.width * (i-1), 0, self.view.frame.size.width, self.view.frame.size.height);
//        [self.scrollView addSubview:imageView];
//        [imageView release];
//    
//    }
//    //设置代理对象
//    self.scrollView.delegate = self;
//    
//    self.tableView.tableHeaderView = self.scrollView;
//    [self.view addSubview:self.scrollView];
//    [self.scrollView release];
//    
//    
//    ////创建UIPageControl
//    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 300, 355, 30)];
//    //设置分页数
//    self.pageControl.numberOfPages = 2;
//    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
//    self.pageControl.pageIndicatorTintColor = [UIColor orangeColor];
//    [self.pageControl addTarget:self action:@selector(handleClickPage:) forControlEvents:UIControlEventValueChanged];
//    [self.view  addSubview:self.pageControl];
//    [self.pageControl release];
//    
//    
//    
//}
#pragma mark----------创建表示图对象的私有方法
//创建表示图对象的私有方法
- (void)CreateRepresentation{
    //创建表示图对象
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kScreenHeight/13.34+64, kScreenWidth, kScreenHeight-kScreenHeight/13.34-64) style:UITableViewStylePlain];
    //设置分割线的样式
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    //设置分割线的颜色
    self.tableView.separatorColor = [UIColor orangeColor];
    //设置行高
    self.tableView.rowHeight = 120;
    
    //.为数据源DataSource设置代理对象
    self.tableView.dataSource = self;
    
    //为处理交互事件 Delegate设置代理对象
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    [self.tableView release];
}




#pragma mark------//点击分页响应的方法

//点击分页响应的方法
- (void)handleClickPage:(UIPageControl *)sender{
    //通过点击分页控制scrollView 的偏移量
    [self.scrollView setContentOffset:CGPointMake(self.view.frame.size.width * sender.currentPage, 0) animated:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if ([self.scrollView isMemberOfClass:[UITableView class]]) {
        NSLog(@"测试");
    }else{
    //先得到偏移量对应的分页下标
    NSInteger index = scrollView.contentOffset.x / self.view.frame.size.width;
    self.pageControl.currentPage = index;
    }
}


#pragma mark =================在tableView上显示的操作
//返回的分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
    
}


//不同分区返回不同行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        BOOL a = self.scrollArry.count;
        return a;
    }else{
    return self.dataArry.count;
    }
}
//不同分区返回不同的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return kScreenHeight/5;
    }else{
        return 120;
    }
}
//配置cell  也就是cell上显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        static NSString *cellind = @"cell";
        ClassifyScrollViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellind];
        if (cell == nil) {
            cell = [[[ClassifyScrollViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellind]autorelease];
        }
        for (int i = 0; i < self.scrollArry.count; i++) {
            
                   cell.pageControl.numberOfPages = self.scrollArry.count;
                   cell.scrollView.contentSize = CGSizeMake(kScreenWidth * self.scrollArry.count, 0);
             ScrollModel *model1 = [self.scrollArry objectAtIndex:i];
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth* i, 0, kScreenWidth, kScreenHeight/5)];
           NSString *scrollstring = [model1.image_big_ios_url substringToIndex:model1.image_big_ios_url.length-5];
           NSURL *url1 = [NSURL URLWithString:scrollstring];
            
            [imageView sd_setImageWithURL:url1 placeholderImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"placeHolderImage" ofType:@"jpg"]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
               imageView.image = image;
            }];
            UIButton *scrollButton = [UIButton buttonWithType:UIButtonTypeCustom];
            scrollButton.frame = CGRectMake(kScreenWidth*i, 0, kScreenWidth, kScreenHeight/5);
            [scrollButton setImage:imageView.image forState:UIControlStateNormal];
            [scrollButton addTarget:self action:@selector(handleClickscroll:) forControlEvents:UIControlEventTouchUpInside];
            [cell.scrollView addSubview:scrollButton];
            
           //[cell.scrollView addSubview:imageView];
            [imageView release];
            
           
        }
        return cell;
        
        
    }else{
        
       
        static NSString *cellindd = @"cell1";
        AllViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellindd];
        if (cell == nil) {
            cell = [[[AllViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellindd]autorelease];
        }
        
        
         AllModel *model = [self.dataArry objectAtIndex:indexPath.row];
        
        //为cell赋值
        cell.titleLabel.text = model.title;
        cell.priceLabel.text = [NSString stringWithFormat:@"￥%d",[model.price intValue]/100];
        cell.originalprice.text = [NSString stringWithFormat:@"￥%d",[model.list_price intValue]/100];
        cell.originalprice.textColor = [UIColor grayColor];
        cell.originalprice.font = [UIFont systemFontOfSize:10];
        cell.saledLabel.text = [NSString stringWithFormat:@"已售%d件",[model.sales_count intValue]];
        cell.saledLabel.textColor = [UIColor grayColor];
        cell.saledLabel.font = [UIFont systemFontOfSize:10];
        if ((cell.baoyouLabel.text = [NSString stringWithFormat:@"%d",[model.baoyou intValue]])) {
            cell.baoyouLabel.text = @"包邮";
            cell.baoyouLabel.textColor = [UIColor redColor];
        }else{
            cell.baoyouLabel.text = nil;
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
        
        [cell.picImageView sd_setImageWithURL:url placeholderImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"placeHolderImage" ofType:@"jpg"]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            cell.picImageView.image = image;
        }];
        return cell;
    }

}
//点击cell的响应事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AllWebPageLoadController *allwebLoad = [[AllWebPageLoadController alloc] init];
    
        allwebLoad.model = [self.dataArry objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:allwebLoad animated:YES];
        [allwebLoad release];
    
    
    
    
    
}

//点击滚动视图的响应方法
- (void)handleClickscroll:(UIButton *)sender{
    ClassifyOtherController *othercontroller = [[ClassifyOtherController alloc] init];
    [self.navigationController pushViewController:othercontroller animated:YES];
    [othercontroller release];
    
}














//
////设置每个分区的页眉title
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    
//}
//
////设置页眉的高度 为不同分区的设置不同高度
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return [UIScreen mainScreen].bounds.size.height/0.35;
//}
//
////为页眉设置自定义视图
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//    //创建滑动视图对象
//    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 104, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 0.35)];
//    //设置内容区域范围
//    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, 120);
//    //设置整平滚动
//    self.scrollView.pagingEnabled = YES;
//    //去掉水平方向的滚动条
//    self.scrollView.showsHorizontalScrollIndicator = NO;
//    //往scrollView上添加图片
//    for (int i = 1; i < 3; i++) {
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"v6_guide_%d",i] ofType:@"png"]]];
//        //设置from
//        imageView.frame = CGRectMake(self.view.frame.size.width * (i-1), 0, self.view.frame.size.width, self.view.frame.size.height);
//        [self.scrollView addSubview:imageView];
//        [imageView release];
//        
//    }
//    //设置代理对象
//    self.scrollView.delegate = self;
//    
//    self.tableView.tableHeaderView = self.scrollView;
//    [self.view addSubview:self.scrollView];
//    [self.scrollView release];
//    
//    
//    ////创建UIPageControl
//    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 300, 355, 30)];
//    //设置分页数
//    self.pageControl.numberOfPages = 2;
//    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
//    self.pageControl.pageIndicatorTintColor = [UIColor orangeColor];
//    [self.pageControl addTarget:self action:@selector(handleClickPage:) forControlEvents:UIControlEventValueChanged];
//    [self.view  addSubview:self.pageControl];
//    [self.pageControl release];
//
//    
//    
//    
//}




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
