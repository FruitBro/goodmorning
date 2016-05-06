//
//  HomePageTableViewController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-29.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "HomePageTableViewController.h"
//#import "TabScrollerViewTableViewCell.h"
#import "CollectionTableViewCell.h"
#import "UIViewTableViewCell.h"
#import "TodayUpdateGoodsListTableViewCell.h"
#import "CollectionDetialTableViewController.h"
#import "brandDetailListModel.h"
#import "NetWorkRequset.h"
#import "NoSingleNetWorkRequest.h"
#import "TabScrollerModel.h"
#import "tabScrollNetRequest.h"
#import "SizeMacros.h"
#import "UIImageView+WebCache.h"
//#import "TabScrollViewController.h"
#import "EveryTenDetialControllerViewController.h"
#import "TodayUpdateDetialViewController.h"
#import "AndriolDetialViewController.h"
#import "GoodProtactDetialViewController.h"
#import "EmailDetialViewController.h"
#import "ValueTravleDetialViewController.h"
#import "ZeroMoneyDetialViewController.h"
#import "FoodDetialViewController.h"
#import "MJRefresh.h"
#import "DropDownTable.h"
#import "AFNetworking.h"
#import "DetialSearchView.h"
#import "LastBuyInterFaceViewController.h"
@interface HomePageTableViewController ()<collectionTableViewCellDelegate,netWorkRequsetDelegate,noSingleNetWorkRequestDelegate,tabScrollNetRequestDelegate,UIViewTableViewCellDelegate,UISearchBarDelegate,UITextFieldDelegate,dropDownTableDelegate,UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)NSMutableArray *listDataArray;
@property (nonatomic,retain)NSMutableArray *tabScrollDataArray;
@property (nonatomic,retain)DropDownTable *table;
@property (nonatomic,retain)UISearchBar *search;
@property (nonatomic,retain)NSMutableString *searchString;
@property (nonatomic,retain)UIImageView *image1;
@end

@implementation HomePageTableViewController
-(UIImageView *)image1{
    if (_image1 == nil) {
        self.image1 = [[[UIImageView alloc]init]autorelease];
    }
    return _image1;
}
//-(NSMutableString *)searchString{
//    if (_searchString == nil) {
//        self.searchString = [NSMutableString string];
//    }
//    return _searchString;
//}
-(UITableView *)tableView{
    if (_tableView == nil) {
        self.tableView = [[UITableView alloc]initWithFrame:self.view.frame];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return _tableView;
}
-(DropDownTable *)table{
    if (!_table ) {
        self.table = [[[DropDownTable alloc]init]autorelease];
    }
    return _table;
}
-(void)dealloc{
    [_listDataArray release];
    [_tabScrollDataArray release];
    [_searchString release];
    [_search release];
    [_table release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBar.translucent = NO;
    [self.view addSubview:self.tableView];
    self.navigationItem.title = @"首页";
//    [self.tableView registerClass:[TabScrollerViewTableViewCell class] forCellReuseIdentifier:@"TAB"];
    [self.tableView registerClass:[CollectionTableViewCell class] forCellReuseIdentifier:@"COLL"];
    [self.tableView registerClass:[UIViewTableViewCell class] forCellReuseIdentifier:@"UIV"];
    [self.tableView registerClass:[TodayUpdateGoodsListTableViewCell class] forCellReuseIdentifier:@"NBB"];
    self.tableView.rowHeight = 200;
    [self.tableView reloadData];
    NoSingleNetWorkRequest *nosing = [[NoSingleNetWorkRequest alloc]init];
    nosing.delegate = self;
    [nosing getRequestInterNet:@"http://m.api.zhe800.com/v5/deals?image_type=all&image_model=webp&user_type=0&user_role=1&student=1&url_name=&page=1&per_page=20"];
    [nosing release];
    tabScrollNetRequest *tabNosing = [[tabScrollNetRequest alloc]init];
    tabNosing.delegate = self;
    [tabNosing getTabScrollRequestInterNet:@"http://m.api.zhe800.com/tao800/bannerv2.json?platform=android&channelid=248c15&productkey=tao800&cityid=25&url_name=&userType=1&userRole=1&unlock=1&image_model=all"];
    [tabNosing release];
    self.table.delegate = self;

    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timingThePic) userInfo:nil repeats:YES];
    [self addHeader];
}
-(void)addHeader{
    
    HomePageTableViewController __weak *weakSelf = self;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        //refresh data
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NoSingleNetWorkRequest *nosing = [[NoSingleNetWorkRequest alloc]init];
            nosing.delegate = self;
            [nosing getRequestInterNet:@"http://m.api.zhe800.com/v5/deals?image_type=all&image_model=webp&user_type=0&user_role=1&student=1&url_name=&page=1&per_page=20"];
            [nosing release];
            tabScrollNetRequest *tabNosing = [[tabScrollNetRequest alloc]init];
            tabNosing.delegate = self;
            [tabNosing getTabScrollRequestInterNet:@"http://m.api.zhe800.com/tao800/bannerv2.json?platform=android&channelid=248c15&productkey=tao800&cityid=25&url_name=&userType=1&userRole=1&unlock=1&image_model=all"];
            [tabNosing release];
            self.table.delegate = self;
        

            [weakSelf.tableView reloadData];    //更新数据源
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [weakSelf.tableView reloadData];//重载table view.
                [weakSelf.tableView.header endRefreshing];         //关闭刷新效果
            });
            
        });
        
        
        /*
         header.lastUpdatedTimeLabel.hidden = YES;
         header.stateLabel.hidden = YES;
         [header setTitle:@"Pull down to refresh" forState:MJRefreshStateIdle];
         [header setTitle:@"Release to refresh" forState:MJRefreshStatePulling];
         [header setTitle:@"Loading ..." forState:MJRefreshStateRefreshing];
         
         // setup font
         header.stateLabel.font = [UIFont systemFontOfSize:15];
         header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:12];
         
         //setup color
         header.stateLabel.textColor = [UIColor redColor];
         header.lastUpdatedTimeLabel.textColor = [UIColor grayColor];
         
         */
    }];
    
    self.tableView.header = header;
    
}

-(void)timingThePic{
   UIPageControl *scr = (UIPageControl *)[self.tableView viewWithTag:1000];
    static int a = 0;
    scr.currentPage = a++;
    UIScrollView *scr1 = (UIScrollView *)[self.tableView viewWithTag:1001];
    scr1.contentOffset = CGPointMake(scr.currentPage*kScreenWidth, 0);
    if (a == self.tabScrollDataArray.count) {
        a = 0;
    }
    self.tableView.layer.borderWidth = 1;
//    self.tableView.layer.borderColor = [[UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:0.5]CGColor];
//    self.tableView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
}

-(void)pushToDetialSearchView:(id)data{
    DetialSearchView *de = [[DetialSearchView alloc]init];
    de.receiveWap_url = [NSString stringWithFormat:@"http://m.api.zhe800.com/v4/search?q=%@&image_type=all&page=1&per_page=20",[data stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [self.navigationController pushViewController:de animated:YES];
    [de release];
}
-(void)viewWillAppear:(BOOL)animated{
    [self setSearch];
    self.tableView.frame = self.view.frame;
    self.navigationItem.titleView = self.search;
}
-(void)viewDidAppear:(BOOL)animated{
    
}
-(void)viewWillDisappear:(BOOL)animated{
     self.table.tableView.frame = CGRectMake(0, 0, 0, 0);
    [self.search removeFromSuperview];
}
-(void)setSearch{
    self.search = [[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)]autorelease];
    self.search.delegate = self;
    self.search.placeholder = @"亲,点击这里搜索更多商品";
    [self.search setShowsCancelButton:NO animated:YES];
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{

   [self.view addSubview:self.table.tableView];
    self.search.showsCancelButton = YES;
    self.table.tableView.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight);
    self.tableView.frame = CGRectMake(0, 0, 0, 0);
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"点击了搜索结果");
    [searchBar resignFirstResponder];
    DetialSearchView *de = [[DetialSearchView alloc]init];
    de.receiveWap_url = [NSString stringWithFormat:@"http://m.api.zhe800.com/v4/search?q=%@&image_type=all&page=1&per_page=20",[searchBar.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [self.navigationController pushViewController:de animated:YES];
    [de release];
//http://m.api.zhe800.com/v4/search?q=%@&image_type=all&page=1&per_page=20
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    self.searchString = (NSMutableString *)[NSString stringWithFormat:@"http://m.api.zhe800.com/v2/suggestion?q=%@&page=1&per_page_count=20",[searchText stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    AFHTTPRequestOperationManager *manage =[[AFHTTPRequestOperationManager alloc]init];
    [manage GET:self.searchString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.table.receiveArr =responseObject;
        NSLog(@"responseObject = %@",responseObject);
        [self.table.tableView reloadData];
       
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
   
    
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self.search resignFirstResponder];
    self.table.tableView.frame = CGRectMake(0, 0, 0, 0);
    self.search.showsCancelButton =NO;
    self.tableView.frame = self.view.frame;
    searchBar.text = nil;
}
-(NSMutableArray *)tabScrollDataArray{
    if (_tabScrollDataArray == nil) {
        self.tabScrollDataArray = [NSMutableArray array];
    }
    return [[_tabScrollDataArray retain]autorelease];
}
-(void)reloadTableUIView:(id)value{
    [self.tableView reloadData];
}
-(void)configurationTabScrollModelWithRequsetData:(id)data{
    NSArray *arr = data;
   [self.tabScrollDataArray removeAllObjects];
    for (id object in arr) {
        TabScrollerModel *model = [[TabScrollerModel alloc]initWithDictionary:object];

        [self.tabScrollDataArray addObject:model];
        [model release];
    }
    [self.tableView reloadData];
   

}

-(NSMutableArray *)listDataArray{
    if (_listDataArray == nil) {
        self.listDataArray = [NSMutableArray array];
    }
    return [[_listDataArray retain]autorelease];
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"home_tab_home_btn@2x.png" ofType:nil]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"home_tab_home_selected_btn@2x.png" ofType:nil]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        self.tabBarItem = tabBarItem;
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(7, 0, -7, 0);
        self.tabBarController.tabBar.tintColor = [UIColor redColor];
        //tabBarItem.imageInsets = UIEdgeInsetsMake(7, 0, -7, 0);
        [tabBarItem release];
    }
    return self;
}
-(void)configurationModelWithRequsetData:(id)data{
 
    NSDictionary *dic = data;
    NSArray *arr = [dic objectForKey:@"objects"];
    for (id object in arr) {
        brandDetailListModel *model = [[brandDetailListModel alloc]initWithDic:object];
        [self.listDataArray addObject:model];
        [model release];
        
    }
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
//    if (section == 0) {
//        if(self.tabScrollDataArray.count==0){
//            return 0;
//        }else{
//        
//            return 1;}
//   
//    }else
    if(section == 0){
        return 1;
    }else if(section == 1){
        return 1;
    }else {
        return self.listDataArray.count;
    }
        }

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return kScreenHeight/3+kScreenHeight/4*2;
    }else if(indexPath.section == 2){
        return kScreenHeight/5.5;
    }
    return kScreenHeight/4;
    
   }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
//    if (indexPath.section == 0) {
//        TabScrollerViewTableViewCell *tabScrollerViewCell = [tableView dequeueReusableCellWithIdentifier:@"TAB" forIndexPath:indexPath];
//        tabScrollerViewCell.TabScroll.contentSize = CGSizeMake(kScreenWidth*self.tabScrollDataArray.count, kScreenWidth/4);
//       // NSLog(@"self.tabScrollDataArray %@",self.tabScrollDataArray);
//        TabScrollerModel *tabModel;
//                        for (int i = 0; i < self.tabScrollDataArray.count; i++) {
//                            tabScrollerViewCell.TabScroll.pagingEnabled = YES;
//                    tabModel = [self.tabScrollDataArray objectAtIndex:i];
//        self.image1.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight/4);
//                    [self.image1 sd_setImageWithURL:[NSURL URLWithString:tabModel.image_big_ios_url] placeholderImage:[UIImage imageNamed:@"bga"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//                        self.image1.image = image;
//                    }];
//                            UIButton *tabButton = [UIButton buttonWithType:UIButtonTypeCustom];
//                            tabButton.frame = CGRectMake(i*kScreenWidth, 0, kScreenWidth, kScreenHeight/4);
//                            [tabButton setImage:self.image1.image forState:UIControlStateNormal];
//                            [tabButton addTarget:self action:@selector(handleClickTabButton:) forControlEvents:UIControlEventTouchUpInside];
//            [tabScrollerViewCell.TabScroll addSubview:tabButton];
//           
//                   }
//        
//        tabScrollerViewCell.pageCon.numberOfPages = self.tabScrollDataArray.count;
//        tabScrollerViewCell.TabScroll.delegate = self;
//        tabScrollerViewCell.TabScroll.tag = 1001;
//        tabScrollerViewCell.pageCon.tag = 1000;
//        [tabScrollerViewCell.pageCon addTarget:self action:@selector(moveContenPage:) forControlEvents:UIControlEventValueChanged];
//       
//        return tabScrollerViewCell;
//
//    }else
    if(indexPath.section == 0){
   
        CollectionTableViewCell *collectionCell = [tableView dequeueReusableCellWithIdentifier:@"COLL" forIndexPath:indexPath];
        collectionCell.delegate = self;
        return collectionCell;
    }else if(indexPath.section == 1){
        UIViewTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:@"UIV" forIndexPath:indexPath];
        viewCell.delegate = self;
          
        return viewCell;
    }else{
        TodayUpdateGoodsListTableViewCell *lowerCell = [tableView dequeueReusableCellWithIdentifier:@"NBB" forIndexPath:indexPath];
        brandDetailListModel *model = [self.listDataArray objectAtIndex:indexPath.row];
        [lowerCell configureCellWithModel:model];
        return lowerCell;

        
    }
    }

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    
   
        UIPageControl *page = (UIPageControl *)[self.tableView viewWithTag:1000];
        page.currentPage =  (NSInteger)scrollView.contentOffset.x/kScreenWidth;
   

    
}

-(void)moveContenPage:(UIPageControl *)sender{
  UIScrollView *sc =  (UIScrollView *)[self.tableView viewWithTag:1001];
    sc.contentOffset = CGPointMake(sender.currentPage*kScreenWidth, 0);
}
//-(void)handleClickTabButton:(UIButton *)sender{
//    TabScrollViewController *tabscroller = [[TabScrollViewController alloc]init];
//    NSInteger a =sender.frame.origin.x/kScreenWidth;
//    tabscroller.receiveModel = [self.tabScrollDataArray objectAtIndex:a];
//    [self.navigationController pushViewController:tabscroller animated:YES];
//    [tabscroller release];
//} 
-(void)pushToNextInterFace:(NSMutableString *)string :(NSIndexPath *)indexPath{
    NSInteger chooseView = indexPath.row;
    switch (chooseView) {
        case 0:
        {
            TodayUpdateDetialViewController *todayDetail = [[TodayUpdateDetialViewController alloc]init];
            [self.navigationController pushViewController:todayDetail animated:YES];
            todayDetail.receiveWapUrlString = string;
            [todayDetail release];
            
        }
            break;
        case 1:
        {
            EveryTenDetialControllerViewController *everyDetial = [[EveryTenDetialControllerViewController alloc]init];
            everyDetial.receiveWapUrlString = string;
            [self.navigationController pushViewController:everyDetial animated:YES];
            [everyDetial release];
        }
            break;
        case 2:
        {
            GoodProtactDetialViewController *good = [[GoodProtactDetialViewController alloc]init];
            [self.navigationController pushViewController:good animated:YES];
            good.receiveWapUrlString = string;
            [good release];
            
        }
            break;
        case 3:
        {
            AndriolDetialViewController *andriol = [[AndriolDetialViewController alloc]init];
            [self.navigationController pushViewController:andriol animated:YES];
            andriol.receiveWapUrlString = string;
            [andriol release];
        }
            break;
        case 4:
        {
            EmailDetialViewController *email = [[EmailDetialViewController alloc]init];
            [self.navigationController pushViewController:email animated:YES];
            email.receiveWapUrlString = string;
            [email release];
        }
            break;
        case 5:
        {
            ValueTravleDetialViewController *value = [[ValueTravleDetialViewController alloc]init];
            [self.navigationController pushViewController:value animated:YES];
            value.receiveWapUrlString = string;
            [value release];
            
        }
            break;
        case 6:
        {
            ZeroMoneyDetialViewController *zero = [[ZeroMoneyDetialViewController alloc]init];
            [self.navigationController pushViewController:zero animated:YES];
            zero.receiveWapUrlString = string;
            [zero release];
            
        }
            break;
        case 7:
        {
            FoodDetialViewController *food = [[FoodDetialViewController alloc]init];
            [self.navigationController pushViewController:food animated:YES];
            food.receiveWapUrlString = string;
            [food release];
        }
            break;

            
        default:
            break;
    }
   
}
-(void)pushtoCollectionDetialControll:(CollectionModel *)model{
    if (model != nil) {
        CollectionDetialTableViewController *detialController = [[CollectionDetialTableViewController alloc]init];
        
        detialController.receiveModel = model;
        
        
        [self.navigationController pushViewController:detialController animated:YES];
        [detialController release];

    }else{
        self.tabBarController.selectedIndex = 1;
    }
    
    }
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==3) {
        LastBuyInterFaceViewController *listDetial = [[LastBuyInterFaceViewController alloc]init];
        listDetial.receiveScholl = [self.listDataArray objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:listDetial animated:YES];
        [listDetial release];
    }
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
