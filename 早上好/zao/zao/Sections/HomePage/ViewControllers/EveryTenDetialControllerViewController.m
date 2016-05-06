//
//  EveryTenDetialControllerViewController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "EveryTenDetialControllerViewController.h"
#import "EveryTenTableViewCell.h"
#import "EveryTenTheModel.h"
#import "NetWorkRequset.h"
#import "UIImageView+WebCache.h"
#import "SizeMacros.h"
#import "EveryTenTapCell.h"
#import "EveryTenLast.h"
@interface EveryTenDetialControllerViewController ()<netWorkRequsetDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)UITableView *everyTenTableView;
@property (nonatomic,retain)NSMutableArray *everyDataArray;
@property (nonatomic,retain)NSString *tapDetialTitleString;
@property (nonatomic,retain)NSString *tapImageString;

@end

@implementation EveryTenDetialControllerViewController
-(void)dealloc{
    [_receiveWapUrlString release];
    [_everyTenTableView release];
    [_tapDetialTitleString release];
    [_tapImageString release];
    [super dealloc];
}

-(NSMutableArray *)everyDataArray{
    if (_everyDataArray == nil) {
        self.everyDataArray = [NSMutableArray array];
    }
    return [[_everyDataArray retain]autorelease];
}
-(UITableView *)everyTenTableView{
    if (_everyTenTableView == nil) {
        self.everyTenTableView = [[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain]autorelease];
        self.everyTenTableView.delegate = self;
        self.everyTenTableView.dataSource = self;
    }
    return _everyTenTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"每日十件";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.everyTenTableView registerClass:[EveryTenTableViewCell class] forCellReuseIdentifier:@"EVE"];
    [self.everyTenTableView registerClass:[EveryTenTapCell class] forCellReuseIdentifier:@"TEVE"];
    [NetWorkRequset shareNetWorkRequset].delegate = self;
    [NetWorkRequset getNetRequset:self.receiveWapUrlString];
    [self.view addSubview:self.everyTenTableView];
 
    // Do any additional setup after loading the view.
}
-(void)conllectionViewReload:(id)data{
    NSDictionary *dic = data;
    self.tapDetialTitleString = [[dic objectForKey:@"banner"]objectForKey:@"detail"];
    self.tapImageString = [[dic objectForKey:@"banner"]objectForKey:@"image_big_ios_url"];
    NSArray *arr = [dic objectForKey:@"objects"];
    for (id object in arr) {
        EveryTenTheModel *model = [[EveryTenTheModel alloc]initWithDictionary:object];
        [self.everyDataArray addObject:model];
        [model release];
    }
    [self.everyTenTableView reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return self.everyDataArray.count;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return kScreenHeight/8*3;
    }else{
    return kScreenHeight/3*2;
    }}
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        EveryTenTapCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TEVE" forIndexPath:indexPath];
        cell.tapTiLabel.text = self.tapDetialTitleString;
        [cell.tapImageViewShow sd_setImageWithURL:[NSURL URLWithString:[self.tapImageString substringToIndex:(self.tapImageString.length-5)]] placeholderImage:[UIImage imageNamed:@"1"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            cell.tapImageViewShow.image = image;
        }];
        return cell;
    }else{
        EveryTenTableViewCell *everyCell = [tableView dequeueReusableCellWithIdentifier:@"EVE" forIndexPath:indexPath];
         EveryTenTheModel *eveModel = [self.everyDataArray objectAtIndex:indexPath.row];
        everyCell.titleLabel.text = eveModel.short_tiele;
        everyCell.priceLabel.text = eveModel.price;
        everyCell.recommend_reasonLabel.text = eveModel.recommend_reason;
        everyCell.related_recommendLabel.text = eveModel.related_recommed;
        [everyCell.showImageView sd_setImageWithURL:[NSURL URLWithString:[eveModel.image_url substringToIndex:(eveModel.image_url.length-5)]] placeholderImage:[UIImage imageNamed:@"1"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            everyCell.showImageView.image = image;
        }];
         return everyCell;
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        EveryTenLast *last = [[EveryTenLast alloc]init];
        EveryTenTheModel *model = [self.everyDataArray objectAtIndex:indexPath.row];
        last.receiveWap_url = model.wap_url;
        [self.navigationController pushViewController:last animated:YES];
        [last release];
    }
    
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
