//
//  EmailDetialViewController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "EmailDetialViewController.h"
#import "brandDetailListModel.h"
#import "TodayUpdateGoodsListTableViewCell.h"
#import "NetWorkRequset.h"
#import "UIImageView+WebCache.h"
#import "SizeMacros.h"
#import "EmailShowViewController.h"
@interface EmailDetialViewController ()<netWorkRequsetDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)NSMutableArray *EmailDataArray;
@property (nonatomic,retain)UITableView *tableView;
@end

@implementation EmailDetialViewController
-(void)dealloc{
    [_receiveWapUrlString release];
    [_tableView release];
    [super dealloc];
}
-(UITableView *)tableView{
    if (_tableView == nil) {
        self.tableView = [[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain]autorelease];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return _tableView;
}
-(NSMutableArray *)EmailDataArray{
    if (_EmailDataArray == nil) {
        self.EmailDataArray = [NSMutableArray array];
    }
    return _EmailDataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"8块8包邮";
     self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[TodayUpdateGoodsListTableViewCell class] forCellReuseIdentifier:@"NB"];
    NSLog(@"%@",self.receiveWapUrlString);
    [NetWorkRequset shareNetWorkRequset].delegate = self;
    [NetWorkRequset getNetRequset:self.receiveWapUrlString];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}
-(void)conllectionViewReload:(id)data{
    NSDictionary *dic = data;
    NSArray *arr = [dic
                    objectForKey:@"objects"];
    for (id object in arr) {
        brandDetailListModel *model = [[brandDetailListModel alloc]initWithDic:object];
        [self.EmailDataArray addObject:model];
        [model release];
    }
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.EmailDataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kScreenHeight/5.7;
}
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TodayUpdateGoodsListTableViewCell *lowerCell = [tableView dequeueReusableCellWithIdentifier:@"NB" forIndexPath:indexPath];
    brandDetailListModel *model = [self.EmailDataArray objectAtIndex:indexPath.row];
    [lowerCell configureCellWithModel:model];
    return lowerCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EmailShowViewController *show = [[EmailShowViewController alloc]init];
    brandDetailListModel *model = [self.EmailDataArray objectAtIndex:indexPath.row];
    show.receiveWap_url = model.wap_url;
    [self.navigationController pushViewController:show animated:YES];
    
    [show release];
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
