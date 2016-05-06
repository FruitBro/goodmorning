//
//  DetialSearchView.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-5.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "DetialSearchView.h"
#import "brandDetailListModel.h"
#import "TodayUpdateGoodsListTableViewCell.h"
#import "NetWorkRequset.h"
#import "SizeMacros.h"
#import "UIImageView+WebCache.h"
#import "TheSearchBuyViewController.h"
@interface DetialSearchView ()<netWorkRequsetDelegate>
@property (nonatomic,retain)NSMutableArray *DataArray;

@end

@implementation DetialSearchView
-(NSMutableArray *)DataArray{
    if (_DataArray == nil) {
        self.DataArray = [NSMutableArray array];
    }
    return _DataArray;
}
-(void)dealloc{
    [_receiveWap_url release];
    [_DataArray release];
     [NetWorkRequset shareNetWorkRequset].delegate = nil;
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.receiveWap_url);
    [NetWorkRequset shareNetWorkRequset].delegate = self;
    [NetWorkRequset getNetRequset:self.receiveWap_url];
    [self.tableView registerClass:[TodayUpdateGoodsListTableViewCell class] forCellReuseIdentifier:@"NB"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)conllectionViewReload:(id)data{
    NSDictionary *dic = data;
    NSArray *arr = [dic objectForKey:@"objects"];
    for (id object in arr) {
        brandDetailListModel *list = [[brandDetailListModel alloc]initWithDic:object];
        [self.DataArray addObject:list];
        [list release];
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
    return self.DataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kScreenHeight/5.7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodayUpdateGoodsListTableViewCell *lowerCell = [tableView dequeueReusableCellWithIdentifier:@"NB" forIndexPath:indexPath];
    brandDetailListModel *model = [self.DataArray objectAtIndex:indexPath.row];
    [lowerCell configureCellWithModel:model];
    return lowerCell;

  
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TheSearchBuyViewController *buy = [[TheSearchBuyViewController alloc]init];
    brandDetailListModel *model = [self.DataArray objectAtIndex:indexPath.row];
    buy.receiveWap = model.wap_url;
    [self.navigationController pushViewController:buy animated:YES];
    [buy release];
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
