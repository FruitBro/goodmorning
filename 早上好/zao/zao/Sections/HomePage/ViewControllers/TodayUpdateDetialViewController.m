//
//  TodayUpdateDetialViewController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "TodayUpdateDetialViewController.h"
#import "SizeMacros.h"
#import "todayUpdateModel.h"
#import "TodayUpdateTableViewCell.h"
#import "NetWorkRequset.h"
#import "UIImageView+WebCache.h"
#import "NoSingleNetWorkRequest.h"
#import "brandDetailListModel.h"
#import "TodayUpdateGoodsListTableViewCell.h"
#import "todayUpdateViewController.h"
@interface TodayUpdateDetialViewController ()<UITableViewDataSource,UITableViewDelegate,netWorkRequsetDelegate,noSingleNetWorkRequestDelegate>
@property (nonatomic,retain)UITableView *tableView;
@property (nonatomic,retain)NSMutableArray *topScrollImageDataArr;
@property (nonatomic,retain)NSMutableArray *lowerPartDataArr;

@property (nonatomic,assign)NSInteger timerK;

@end

@implementation TodayUpdateDetialViewController
-(void)dealloc{
    [_receiveWapUrlString release];
    [_tableView release];
    [_topScrollImageDataArr release];
   
    [_lowerPartDataArr release];
    
    [super dealloc];
}
- (NSMutableArray *)lowerPartDataArr{
    if (_lowerPartDataArr == nil) {
        self.lowerPartDataArr = [NSMutableArray array];
    }
    return _lowerPartDataArr;
}
-(NSMutableArray *)topScrollImageDataArr{
    if (_topScrollImageDataArr == nil) {
        self.topScrollImageDataArr = [NSMutableArray array];
    }
    return _topScrollImageDataArr;
}
- (UITableView *)tableView{
    if (_tableView == nil) {

        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kScreenHeight/13.34-64) style:UITableViewStylePlain];

          }
        return _tableView;
    }
- (void)viewDidLoad {
        [super viewDidLoad];
        [self configureNetRequest];
    [self configureLowerPartCellNet];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView registerClass:[TodayUpdateTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[TodayUpdateGoodsListTableViewCell class] forCellReuseIdentifier:@"lowerCell"];
        self.tableView.rowHeight = kScreenHeight/4.2;
        self.navigationItem.title = @"今日更新";
        self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]};
        self.navigationController.navigationBar.barTintColor = [UIColor redColor];
        self.view.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:self.tableView];
        // Do any additional setup after loading the view.
    }

- (void)configureNetRequest{
    [NetWorkRequset shareNetWorkRequset].delegate = self;
    [NetWorkRequset getNetRequset:@"http://m.api.zhe800.com/tao800/bannerv2.json?url_name=today&platform=android&channelid=qnk51a&productkey=tao800&cityid=25&userType=1&userRole=1&unlock=1&image_model=webp&student=1"];
}
- (void)conllectionViewReload:(id)data{
    
    for (NSDictionary *dic in data) {
        
        todayUpdateModel *model = [[todayUpdateModel alloc]initWithDic:dic];
        if (self.topScrollImageDataArr) {
            [self.topScrollImageDataArr addObject:model.image_big_ios_url];
        }
        
    }
    [self.tableView reloadData];

    
}

- (void)configureLowerPartCellNet{
    NoSingleNetWorkRequest *netLinking = [[NoSingleNetWorkRequest alloc]init];
    netLinking.delegate = self;
    [netLinking getRequestInterNet:@"http://m.api.zhe800.com/v3/deals/today?tag_url=all&per_page=20&image_type=all&image_model=webp&page=1"];
    [netLinking release];
}
-(void)configurationModelWithRequsetData:(id)data{
    NSDictionary *Dic = data;
    NSArray *array = [Dic objectForKey:@"objects"];
    for (NSDictionary *dic in array) {
        brandDetailListModel *model = [[brandDetailListModel alloc]initWithDic:dic];
        
        [self.lowerPartDataArr addObject:model];
        [model release];
    }
    
    
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1+self.lowerPartDataArr.count;
    
    }
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        
        return 1;
        
    }else{
        return self.lowerPartDataArr.count;
    }
    
    }
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return kScreenHeight/4.1;
    }else{
        return kScreenHeight/5.8;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        TodayUpdateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.scrollImageArr = self.topScrollImageDataArr;
        NSLog(@"........");
        [cell configuresCcrollImagesView];
    return cell;
    
    }else{
        TodayUpdateGoodsListTableViewCell *lowerCell = [tableView dequeueReusableCellWithIdentifier:@"lowerCell" forIndexPath:indexPath];
        brandDetailListModel *model = [self.lowerPartDataArr objectAtIndex:indexPath.row];
        [lowerCell configureCellWithModel:model];
        return lowerCell;
    }

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    todayUpdateViewController *todayUpdateVC = [[todayUpdateViewController alloc]init];
    brandDetailListModel *model = [self.lowerPartDataArr objectAtIndex:indexPath.row];
    todayUpdateVC.model = model;
    [self.navigationController pushViewController:todayUpdateVC animated:YES];
    [todayUpdateVC release];
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