//
//  ForeshowBrandTableViewController.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "ForeshowBrandTableViewController.h"
#import "NetWorkRequset.h"
#import "BrandSessionTableViewCell.h"
#import "ForeshowListViewController.h"
#import "brandSessionModel.h"
@interface ForeshowBrandTableViewController ()<netWorkRequsetDelegate>
@property (nonatomic,retain)NSMutableArray *dataArr;
@end

@implementation ForeshowBrandTableViewController
- (void)dealloc{
    [_dataArr release];
    [super dealloc];
}
- (NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        self.dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"品牌预告";
    [NetWorkRequset shareNetWorkRequset].delegate = self;
    [NetWorkRequset getNetRequset:@"http://m.api.zhe800.com/v6/brand/forecast?page=1&per_page=20&counts=1&user_role=1&user_type=1"];
    
    [self.tableView registerClass:[BrandSessionTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.rowHeight = [UIScreen mainScreen].bounds.size.height/3.2;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)conllectionViewReload:(id)data{
    NSArray *arr = [data objectForKey:@"objects"];
    for (NSDictionary *dic in arr) {
        brandSessionModel *model = [[brandSessionModel alloc]initWithDic:dic];
        [self.dataArr addObject:model];
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BrandSessionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    brandSessionModel *model = [self.dataArr objectAtIndex:indexPath.row];
    [cell configureCellWithModel:model];
    cell.newOrRestTimeLable.text = @"未开始";
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ForeshowListViewController *listGoodsVC = [[ForeshowListViewController alloc]init];
    brandSessionModel *model = [self.dataArr objectAtIndex:indexPath.row];
    listGoodsVC.brandModel = model;
    [self.navigationController pushViewController:listGoodsVC animated:YES];
    listGoodsVC.tabBarController.tabBar.hidden = YES;
    [listGoodsVC release];
}
- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
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
