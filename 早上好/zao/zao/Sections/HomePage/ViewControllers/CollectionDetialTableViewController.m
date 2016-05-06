//
//  CollectionDetialTableViewController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "CollectionDetialTableViewController.h"
#import "brandDetailListModel.h"
#import "TodayUpdateGoodsListTableViewCell.h"
#import "NetWorkRequset.h"

#import "LastBuyInterFaceViewController.h"
#import "SizeMacros.h"
#import "UIImageView+WebCache.h"
@interface CollectionDetialTableViewController ()<netWorkRequsetDelegate>
@property (nonatomic,retain)NSMutableArray *dataArray;
@end

@implementation CollectionDetialTableViewController
-(void)dealloc{
    [_dataArray release];
    [_receiveModel release];
    [super dealloc];
}

-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        self.dataArray = [NSMutableArray array];
    }
    return [[_dataArray retain]autorelease];
}
-(void)conllectionViewReload:(id)data{
    NSDictionary *dic = data;
    NSArray *arr = [dic objectForKey:@"objects"];
    for (id object in arr) {
        brandDetailListModel *cellModel = [[brandDetailListModel alloc]initWithDic:object];
        [self.dataArray addObject:cellModel];
        [cellModel release];
    }
    [self.tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[TodayUpdateGoodsListTableViewCell class] forCellReuseIdentifier:@"SCH"];
 
    [NetWorkRequset shareNetWorkRequset].delegate = self;

    if (![self.receiveModel.category_name isEqualToString:@"校园专区"]) {
        NSString *lastString  = [NSString stringWithFormat:@"http://m.api.zhe800.com/v5/deals?parent_tag=&url_name=%@&order=&min_price=&max_price=&user_type=0&user_role=1&shop_type=&image_type=all&image_model=webp&page=1&per_page=20",self.receiveModel.url_name];
        [NetWorkRequset getNetRequset:lastString];

    }else{
        [NetWorkRequset getNetRequset:@"http://m.api.zhe800.com/v3/deals/taocampus?image_type=all&image_model=webp&page=1&per_page=20"];}
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kScreenHeight/5.7;
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
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodayUpdateGoodsListTableViewCell *lowerCell = [tableView dequeueReusableCellWithIdentifier:@"SCH" forIndexPath:indexPath];
    brandDetailListModel *model = [self.dataArray objectAtIndex:indexPath.row];
    [lowerCell configureCellWithModel:model];
    return lowerCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LastBuyInterFaceViewController *lastBuy = [[LastBuyInterFaceViewController alloc]init];
    lastBuy.receiveScholl = [self.dataArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:lastBuy animated:YES];
    [lastBuy release];
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
