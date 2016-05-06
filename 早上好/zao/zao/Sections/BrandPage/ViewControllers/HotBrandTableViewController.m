//
//  HotBrandTableViewController.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "HotBrandTableViewController.h"
#import "NetWorkRequset.h"
#import "brandSessionModel.h"
#import "BrandSessionTableViewCell.h"
#import "HotListBrandViewController.h"
@interface HotBrandTableViewController ()<netWorkRequsetDelegate>
@property (nonatomic,retain)NSMutableArray *dataArr;
@end

@implementation HotBrandTableViewController
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
    self.navigationItem.title = @"热门品牌";
    [NetWorkRequset shareNetWorkRequset].delegate = self;
    [NetWorkRequset getNetRequset:@"http://m.api.zhe800.com/v6/brand/hot?page=1&per_page=20&counts=1&user_role=1&user_type=1"];
    //注册
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

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BrandSessionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    brandSessionModel *model = [self.dataArr objectAtIndex:indexPath.row];
    [cell configureCellWithModel:model];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HotListBrandViewController *hotListVC = [[HotListBrandViewController alloc]init];
    brandSessionModel *model = [self.dataArr objectAtIndex:indexPath.row];
    hotListVC.brandModel = model;
    [self.navigationController pushViewController:hotListVC animated:YES];
    hotListVC.tabBarController.tabBar.hidden = YES;
    hotListVC.navigationController.navigationBar.hidden = YES;
    [hotListVC release];
}
//- (void)viewWillDisappear:(BOOL)animated{
//    self.navigationController.navigationBar.hidden = NO;
//}
//- (void)viewWillAppear:(BOOL)animated{
//    self.navigationController.navigationBar.hidden = NO;
//}
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
