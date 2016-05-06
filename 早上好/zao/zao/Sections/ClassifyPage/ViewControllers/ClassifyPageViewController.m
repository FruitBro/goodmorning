//
//  ClassifyPageViewController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-29.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "ClassifyPageViewController.h"
#import "ClassifyCollectionViewController.h"
#import "CustomCell.h"
#import "HeaderView.h"
#import "ClassifyAllController.h"
#import "ClassifyOtherController.h"
#import "NetWorkRequset.h"
#import "LeftModel.h"
#import "LeftViewCellTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "SizeMacros.h"
#import "ThemCollectionViewCell.h"
#import "ThemePavilionsViewCell.h"
#import "ThemeModel.h"
#import "NoSingleNetWorkRequest.h"
#import "BrandModel.h"
#import "BrandViewCell.h"
#import "UIviewRequestNetWorking.h"
#import "otherCell.h"
#import "BrandViewController.h"
#import "SearchTableViewController.h"
#import "AFNetworking.h"
#define KAALLWangZhi @"http://m.api.zhe800.com/v6/tags?user_type=1&user_role=1&image_model=webp"
#define KSThemePavilion @"http://m.api.zhe800.com/theme/hot?user_type=1&user_role=1&student=0&image_model=webp"
#define KSBarndWangZhi @"http://m.api.zhe800.com/v6/brand/wall?user_type=1&user_role=1&student=0"
@interface ClassifyPageViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,netWorkRequsetDelegate,noSingleNetWorkRequestDelegate,UIviewRequestNetWorkingDelegate,UISearchBarDelegate,SearchTableViewControllerDelegate>//遵守协议
@property (nonatomic,retain)UISearchBar *searchVC;//搜索框
@property (nonatomic,retain)UITableView *tableView;//表示图对象
@property (nonatomic,retain)UICollectionViewFlowLayout *layout;//布局对象
@property (nonatomic,retain)UICollectionView *collectionView;//集合视图对象
@property (nonatomic,retain)UITableView *rightTableView;//右边的表示图
@property (nonatomic,retain)NSMutableArray *dataArry;//数据源  用来存储LetfModel对象
@property (nonatomic,retain)NSMutableArray *parentArry;//用来存储解析下来的parent_url_name 字符串为12的字符串
@property (nonatomic,retain)NSMutableDictionary *dic;//用来存储遍历出来的键值对
@property (nonatomic,retain)NSMutableArray *SecondArry;//用来存储遍历字典封装的对象
@property (nonatomic,retain)NSMutableArray *arr1;
@property (nonatomic,retain)NSMutableArray *themeArray;//用来存储ThemeModel对象
@property (nonatomic,retain)NSMutableArray *brandArray;//用来存储BrandModel对象
@property (nonatomic,retain)NSMutableArray *arr;
@property (nonatomic,retain)NSMutableArray *newthemearr;//用来存储分类之后的ThemeModel对象
@property (nonatomic,retain)NSDictionary *themdic;//用来存储主题遍历出来的键值对
@property (nonatomic,retain)SearchTableViewController *searchView;//当点击所搜栏出来的视图
//@property (nonatomic,retain)NSMutableArray *brandArr;//用来存储BrandModel对象
@property (nonatomic,retain)NSDictionary *branddic;//
@property (nonatomic,retain)NSMutableString *searchString;



@end

@implementation ClassifyPageViewController

- (void)dealloc{
    [_searchVC release];
    [_tableView release];
    [_dataArry release];
    [_rightTableView release];
    [_parentArry release];
    [_dic release];
    [_arr1 release];
    [_themeArray release];
    [_SecondArry release];
    [_layout release];
    [_collectionView release];
    [_brandArray retain];
    [_newthemearr release];
    [_themdic release];
    //[_brandArr retain];
    [super dealloc];
}

- (NSMutableArray *)newthemearr{
    if (_newthemearr == nil) {
        self.newthemearr = [NSMutableArray array];
    }
    return _newthemearr;
}
- (NSMutableArray *)arr{
    if (_arr == nil) {
        self.arr = [NSMutableArray array];
    }
    return _arr;
}
//懒加载
- (NSMutableArray *)dataArry{
    if (_dataArry == nil) {
        self.dataArry = [NSMutableArray array];
        
    }
    return _dataArry;
}

- (NSMutableArray *)parentArry{
    if (_parentArry == nil) {
        self.parentArry = [NSMutableArray array];
    }
    return _parentArry;
}
- (NSMutableArray *)SecondArry{
    if (_SecondArry == nil) {
        self.SecondArry = [NSMutableArray array];
    }
    return _SecondArry;
}
- (NSMutableArray *)arr1{
    if (_arr1 == nil) {
        self.arr1 = [NSMutableArray array];
    }
    return _arr1;
}

- (NSMutableArray *)themeArray{
    if (_themeArray == nil) {
        self.themeArray = [NSMutableArray array];
    }
    return _themeArray;
}

- (NSMutableArray *)brandArray{
    if (_brandArray == nil) {
        self.brandArray = [NSMutableArray array];
    }
    return _brandArray;
}

//重写初始化方法
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //自定义标签视图
        UITabBarItem *classifyItem = [[UITabBarItem alloc] initWithTitle:@"分类" image:[[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"home_tab_saunter_btn@2x.png" ofType:nil]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"home_tab_saunter_selected_btn@2x.png" ofType:nil]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        //添加标签视图
        self.tabBarItem = classifyItem;
        self.tabBarController.tabBar.tintColor = [UIColor redColor];
        //调整图标的位置
        classifyItem.imageInsets = UIEdgeInsetsMake(7, 0, -7, 0);
        
        //释放
        [classifyItem release];
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建导航条视图控制器上的搜索框
    //[self CreateSearchBox];
    
    //2.创建表示图对象的私有方法
    
    [self CreateRepresentation];
    
    //3.布局集合视图
    [self LayoutOfCollectionView];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:250/256.0 green:250/256.0 blue:250/256.0 alpha:1];
    self.navigationItem.title = @"商品分类";
    
//  //4.创建右边的表示图对象
//    [self CreateRightOfFigure];
    
    // Do any additional setup after loading the view.
    
    //设置代理对象
    [NetWorkRequset shareNetWorkRequset].delegate = self;
    
    //调用协议里的方法
    [NetWorkRequset getNetRequset:KAALLWangZhi];
    
    
    //主题馆
    //创建对对象
    NoSingleNetWorkRequest *nosingle = [[NoSingleNetWorkRequest alloc] init];
    nosingle.delegate = self;
    [nosingle getRequestInterNet:KSThemePavilion];
    //品牌团的数据请求
    //创建对象
    UIviewRequestNetWorking *uivierequest = [[UIviewRequestNetWorking alloc] init];
    uivierequest.delegate = self;
    [uivierequest getUIViewRequestInterNet:KSBarndWangZhi];
    
    //设置所搜栏的代理
    self.searchView.delegate = self;
    
    
    [self.tableView reloadData];
    
}

//实现协议里的方法
- (void)conllectionViewReload:(id)data{
  
    NSArray *arr = data;
    //遍历数组得到对应的字典 然后封装成对象
    for (NSDictionary *tmpeDic in arr) {
        //将遍历出来的对象封装对象
        LeftModel *model = [[LeftModel alloc] initWithDic:tmpeDic];
        //将封装的对象添加到数组中
        if (model.parent_url_name.length == 12) {
            [self.dataArry addObject:model];
        }else{
            if ([model.url_name containsString:@"wireless"]) {
                //containsString  包含的意思
                [self.parentArry addObject:model];
            }
            
            [model release];

            }
    }
    
    
    //先创建一个字典 最后在添加到这个字典里
    
    self.dic = [NSMutableDictionary dictionary];
   //在遍历数组得到再字典
    for (id object in data) {
        //判断这个字典里的key所对应的值
        if ([[object objectForKey:@"parent_url_name"]length] == 0) {
            //然后放到可变数组中
            self.arr1 =[NSMutableArray array];
            [self.dic setValue:self.arr1 forKey:[object objectForKey:@"url_name"]];
        }
    }
    
    
    for (id object in data) {
        
        if ([[object objectForKey:@"parent_url_name"]length] == 12) {
            NSString * string = [object objectForKey:@"parent_url_name"];
            [[self.dic objectForKey:string]addObject:object];
           
    
        }
        
}
//主题
    self.themdic = [NSMutableDictionary dictionary];
    //在遍历数组得到再字典
    for (id object in data) {
        //判断这个字典里的key所对应的值
        if ([[object objectForKey:@"parent_url_name"]length] == 0) {
            //然后放到可变数组中
           
            self.themeArray =[NSMutableArray array];
            [self.themdic setValue:self.themeArray forKey:[object objectForKey:@"url_name"]];
           
        }
        
    }
    //品牌
    self.branddic = [NSMutableDictionary dictionary];
       for (id object in data) {
        if ([[object objectForKey:@"parent_url_name"] length] == 0) {
            self.brandArray = [NSMutableArray array];
            [self.branddic setValue:self.brandArray forKey:[object objectForKey:@"url_name"]];
        }
    }
    LeftModel *letfmodel = [self.parentArry objectAtIndex:0];
    NSString *string = letfmodel.url_name;
    self.arr = [self.dic objectForKey:string];
    ThemeModel *model = [self.parentArry objectAtIndex:0];
    NSString *themestring = model.url_name;
    self.themeArray = [self.themdic objectForKey:themestring];
    //品牌
    
    NSString *banrnsting = letfmodel.url_name;
    self.brandArray = [self.branddic objectForKey:banrnsting];


          //刷新
    [self.tableView reloadData];
    [self.collectionView reloadData];
    
    
}
////实现协议里的方法
- (void)configurationModelWithRequsetData:(id)data{
  

    for (id object in data) {
        ThemeModel *model = [[[ThemeModel alloc] initWithDic:object]autorelease];
        for (id one in self.themdic) {
            if ([one isEqualToString:[object objectForKey:@"url_name"]]) {
                [[self.themdic objectForKey:one] addObject:model];
            }
           
        }
    }
    
        [self.collectionView reloadData];
    
   
    
}

//实现协议里的方法  品牌
-(void)configurationUIViewModelWithRequsetData:(id)data{
    NSArray *brandarr = [data objectForKey:@"objects"];
    for (id object in brandarr) {
        BrandModel *model = [[BrandModel alloc] initWithDic:object];
//        BrandModel *model1 = [[BrandModel alloc] initWithDic:object];
//        [self.idarry addObject:model1];
        
        //在遍历这个字典
        for (id brand in self.branddic) {
            if ([ brand  isEqualToString:[object objectForKey:@"brand_url_name"]]) {
                [[self.branddic objectForKey:brand] addObject:model];
            }
        }
        
    [model release];
    }
    
    [self.collectionView reloadData];
}


#pragma mark-----UITableView 创建表示图对象
//创建左边的表示图对象的私有方法
- (void)CreateRepresentation{
    //创建表示图对象
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth-(kScreenWidth-kScreenWidth/3.7), kScreenHeight) style:UITableViewStylePlain];
    //设置分割线的样式
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //设置分割线的颜色
    self.tableView.separatorColor = [UIColor orangeColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    //设置行高
    //self.tableView.rowHeight = 60;
    
    //.为数据源DataSource设置代理对象
    self.tableView.dataSource = self;
    
    //为处理交互事件 Delegate设置代理对象
    self.tableView.delegate = self;

    [self.view addSubview:self.tableView];
    [self.tableView release];
}


#pragma mark-------------创建搜索框的私有方法
//创建搜索框的私有方法
- (void)CreateSearchBox{
    self.searchVC = [[UISearchBar alloc] initWithFrame:CGRectMake(5, 5, kScreenWidth, 44)];
    //空件的样式
    [self.searchVC setBarStyle:UIBarStyleDefault];
    //半透明文字  搜索内容时消失
    self.searchVC.placeholder = @"在20670件商品中搜索";
    //是否在控件的右端显示一个书的按钮（在没有文字的时候）
    //self.searchVC.showsBookmarkButton = YES;
    //是否显示cancel按钮
    //self.searchVC.showsCancelButton = YES;
    //是否在控件的右端显示搜索结果的按钮
    self.searchVC.searchResultsButtonSelected = YES;
    
    
    
    //点击搜索时出来的那个竖杠的颜色
    self.searchVC.tintColor = [UIColor redColor];
    //搜索框的颜色
    self.searchVC.barTintColor = [UIColor whiteColor];
    
    //设置代理对象
    self.searchVC.delegate = self;
    
    
    
    //放在导航条上
    self.navigationItem.titleView = self.searchVC;
    [self.searchVC release];
    
}

#pragma makr----------------------UISearchBarDelegate  搜索框的方法

//搜索栏将要开始编辑的时候  执行的方法
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    [self.searchVC setShowsCancelButton:YES animated:YES];
    
    return YES;
    
}
//搜索栏右边的cance被点击是时执行的方法
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self.searchVC resignFirstResponder];//放弃第一响应者  （也就是让键盘收回）
    

    self.searchView.tableView.frame = CGRectMake(0, 0, 0, 0);

}

//当在所搜栏里输入内容是 执行的方法
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [self.view addSubview:self.searchView.tableView];
    self.searchView.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    
    self.searchView = [[SearchTableViewController alloc] init];
    
    
    self.searchString = (NSMutableString *)[NSString stringWithFormat:@"http://m.api.zhe800.com/v2/suggestion?q=%@&page=1&per_page_count=20",[searchText stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    AFHTTPRequestOperationManager *manage =[[AFHTTPRequestOperationManager alloc]init];
    [manage GET:self.searchString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.searchView.recevieArray =responseObject;
        [self.searchView.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    [self.searchView release];
}



#pragma mark-------------------SearchTableViewControllerDelegate  
//- (void)pushToDetialSearchView:(id)data{
//    SearchTableViewController *searchtable = [[SearchTableViewController alloc] init];
//    [self.navigationController pushViewController:searchtable animated:YES];
//    [searchtable release];
//    
//}


#pragma mark-----------布局集合视图

//布局集合视图
- (void)LayoutOfCollectionView{
    //创建layout布局对象
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    //设置每个item的大小
    //self.layout.itemSize = CGSizeMake(80, 100);
    
    //设置分区的缩进量  控制item的位置
    self.layout.sectionInset = UIEdgeInsetsMake(kScreenWidth/75, kScreenWidth/75, kScreenHeight/35.7, kScreenWidth/75);
    //设置最小行间距
    self.layout.minimumLineSpacing = 10;
    //设置小item的间距
    self.layout.minimumInteritemSpacing = kScreenWidth/37.5;
    //设置页脚的大小
    //self.layout.footerReferenceSize = CGSizeMake(0, 40);
    //设置页眉的大小
    //self.layout.headerReferenceSize = CGSizeMake(0, 30);
    
    //创建集合视图对象
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(kScreenWidth/3.7, 64, kScreenWidth-kScreenWidth/3.7, kScreenHeight) collectionViewLayout:_layout];
    //设置代理对象   数据源代理
    self.collectionView.dataSource = self;
    //设置显示控件代理
    self.collectionView.delegate = self;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    //注册cell
    [self.collectionView registerClass:[CustomCell class] forCellWithReuseIdentifier:@"cell"];
    //注册cell 主题
    [self.collectionView registerClass:[ThemePavilionsViewCell class] forCellWithReuseIdentifier:@"cell1"];
    //注册cell 品牌
    [self.collectionView registerClass:[BrandViewCell class] forCellWithReuseIdentifier:@"cell2"];
    
    [self.collectionView registerClass:[otherCell class] forCellWithReuseIdentifier:@"cell3"];
    //注册页眉
    [self.collectionView registerClass:[HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    [self.view addSubview:self.collectionView];
    
    [self.collectionView release];
    [self.layout release];
    
    
}


#pragma mark---UITableVIewDataSource--

//返回的分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}


//不同分区返回不同行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.parentArry.count;
}


//配置cell  也就是cell上显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    LeftModel *model = [self.parentArry objectAtIndex:indexPath.row];
    
    
    static NSString *cellind = @"cell";
    
    LeftViewCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellind];
    if (cell == nil) {
        cell = [[[LeftViewCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellind]autorelease];
        
    }
    
    //UIColor *colo = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:1];
    
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor whiteColor];
    
    cell.backgroundColor = [UIColor colorWithRed:250/256.0 green:250/256.0 blue:250/256.0 alpha:1];
    
        //为cell赋值
        cell.leftLabel.text = model.category_name;
        
        return cell;
}
//点击cell的响应事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //3.布局集合视图
    [self LayoutOfCollectionView];
    LeftModel *letfmodel = [self.parentArry objectAtIndex:indexPath.row];
    NSString *string = letfmodel.url_name;
    self.arr = [self.dic objectForKey:string];
    //主题
    ThemeModel *model = [self.parentArry objectAtIndex:indexPath.row];
    NSString *themestring = model.url_name;
    self.themeArray = [self.themdic objectForKey:themestring];
    //品牌
    NSString *banrnsting = letfmodel.url_name;
    self.brandArray = [self.branddic objectForKey:banrnsting];
    
    
    
    LeftViewCellTableViewCell *cell = (LeftViewCellTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.leftLabel.textColor = [UIColor redColor];
    cell.lineLabel.backgroundColor = [UIColor redColor];
    NSLog(@"点击");
    
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    LeftViewCellTableViewCell *cell = (LeftViewCellTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.leftLabel.textColor = [UIColor blackColor];
    NSLog(@"松开");
   
    
}
#pragma mark -------------集合视图UICollectionViewDataSource-------
//设置多个分区个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
    
}
//设置分区的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
   if (section == 0) {
    return self.arr.count;
    }else if (section == 1){
        return self.themeArray.count;

    }else if (section == 2){
       
        return self.brandArray.count;
        
    }else{
        return 2;
    }
   
    
}

//为每个分区的item配置内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
   
   if (indexPath.section == 0) {
    
    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
      
    NSInteger av = [[[self.arr objectAtIndex:indexPath.row] objectForKey:@"pic"] length]-5;
    
   [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[[[self.arr objectAtIndex:indexPath.row]objectForKey:@"pic"] substringToIndex:av]] placeholderImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bgc" ofType:@"jpg"]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       cell.imageView.image = image;
        
    }];
 NSDictionary *tabledic =   [self.arr objectAtIndex:indexPath.row];
    cell.titleLabel.text = [tabledic objectForKey:@"category_name"];
        
    return cell;
    
   }else if (indexPath.section == 1){
       
    ThemePavilionsViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
      ThemeModel *model = [self.themeArray objectAtIndex:indexPath.row];
       [cell.themeView sd_setImageWithURL:[NSURL URLWithString:[model.pictupian substringToIndex:(model.pictupian.length - 5)]] placeholderImage:nil];
       
           return cell;
       
   }else if(indexPath.section == 2){
       BrandViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell2" forIndexPath:indexPath];
       
               BrandModel *brandmodel = [self.brandArray objectAtIndex:indexPath.row];
               NSURL *brandurl = [NSURL URLWithString:brandmodel.logo_image];
               [cell.brandView sd_setImageWithURL:brandurl placeholderImage:[UIImage imageNamed:@"bgc"]];

       return cell;
       
   }else{
       
       
       otherCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell3" forIndexPath:indexPath];
       return cell;
       
   }

}

#pragma mark------  UICollectionViewDelegateFlowLayout 这个代理里面的方法
//为UICollectionView每个item设置大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        return CGSizeMake(kScreenWidth/4.6875, kScreenHeight/6.67);
        
    }else if (indexPath.section ==1){
        return CGSizeMake(kScreenWidth/1.5625, kScreenHeight/6.67);
    }else if (indexPath.section ==2){
        return CGSizeMake(kScreenWidth/4.6875, kScreenHeight/6.67);
    }else{
        return CGSizeMake(kScreenWidth/4.6875, kScreenHeight/6.67);
    }
    
    
    
}

//设置每个分区的页眉 （区头）和页脚（区尾） 返回对应的视图对象  需要重用 以及自定义页眉页脚视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        HeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
     
        return header;
    }
    else if (indexPath.section == 1){
        HeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        return header;
    }else if(indexPath.section ==2){
        HeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        //为页眉上的控件赋值
        //header.headerLabel.text = @"热门品牌";
        
        return header;
    }else{
        HeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        return header;
        
    }

}

//点击cell（item）的响应方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"来了");
    if (indexPath.section == 0) {
        
        ClassifyAllController *firstcollection = [[ClassifyAllController alloc] init];
        // 拼接字符串用的 （传值）传网址
  firstcollection.receiveModel =  [[self.arr objectAtIndex:indexPath.row] objectForKey:@"url_name"];
      //传值  名字 也就是在导航条上显示内容
        firstcollection.model = [[self.arr objectAtIndex:indexPath.row] objectForKey:@"category_name"];
        NSLog(@"----------%@",firstcollection.model);

               [self.navigationController pushViewController:firstcollection animated:YES];
        [firstcollection release];
               //self.navigationItem.title = model.category_name;
        
    }else if (indexPath.section == 1){
        
        ClassifyOtherController *othercontroller = [[ClassifyOtherController alloc] init];
        
        
        //主题拼接网址
        ThemeModel *model = [self.themeArray objectAtIndex:indexPath.row];
        othercontroller.recevicethemmodel = model.idd;
        //主题传值  导航条的名字
        othercontroller.Thememodel = model.title;
        
        
        
        [self.navigationController pushViewController:othercontroller animated:YES];
        [othercontroller release];
   
    

    }else{
        BrandViewController *brand = [[BrandViewController alloc] init];
        //拼接网址
        BrandModel *model = [self.brandArray objectAtIndex:indexPath.row];
        brand.receviebrandmodel = model.idd;
        //传值  名字  也就是在导航条上显示内容

        brand.namemodel = model.name;
        [self.navigationController pushViewController:brand animated:YES];
        [brand release];

        
    }
}


//返回页眉的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(0, 0);
        
    }else if (section == 1){
        return CGSizeMake(0, 0);
    }else {
        return CGSizeMake(0, 30);
    }
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
