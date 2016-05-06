//
//  AndriolDetialViewController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "AndriolDetialViewController.h"
#import "brandDetailListModel.h"
#import "TodayUpdateGoodsListTableViewCell.h"
#import "NetWorkRequset.h"
#import "SizeMacros.h"
#import "UIImageView+WebCache.h"
#import "LastBuyInterFaceViewController.h"
@interface AndriolDetialViewController ()<netWorkRequsetDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)NSMutableArray *andriolDataArray;

@end

@implementation AndriolDetialViewController
-(void)dealloc{
    [_receiveWapUrlString release];
    [_tableView release];
    [super dealloc];
}
-(UITableView *)tableView{
    if (_tableView == nil) {
        self.tableView = [[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain]autorelease];
    
    }
    return _tableView;
}
-(NSMutableArray *)andriolDataArray{
    if (_andriolDataArray == nil) {
        self.andriolDataArray = [NSMutableArray array];
    }
    return _andriolDataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"安卓周边";
     self.view.backgroundColor = [UIColor whiteColor];
    [NetWorkRequset shareNetWorkRequset].delegate = self;
    [NetWorkRequset getNetRequset:self.receiveWapUrlString];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[TodayUpdateGoodsListTableViewCell class] forCellReuseIdentifier:@"NNN"];
    // Do any additional setup after loading the view.
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kScreenHeight/5.7;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LastBuyInterFaceViewController *last = [[LastBuyInterFaceViewController alloc]init];
    last.receiveScholl = [self.andriolDataArray objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:last animated:YES];
    [last release];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.andriolDataArray.count;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TodayUpdateGoodsListTableViewCell *lowerCell = [tableView dequeueReusableCellWithIdentifier:@"NNN" forIndexPath:indexPath];
    brandDetailListModel *model = [self.andriolDataArray objectAtIndex:indexPath.row];
    [lowerCell configureCellWithModel:model];
    return lowerCell;

    
}
-(void)conllectionViewReload:(id)data{
    NSDictionary *dic = data;
    NSArray *arr = [dic objectForKey:@"objects"];
    for (id object in arr) {
        brandDetailListModel *androlModel = [[brandDetailListModel alloc]initWithDic:object];
        [self.andriolDataArray addObject:androlModel];
        [androlModel release];
    }
    [self.tableView reloadData];

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
