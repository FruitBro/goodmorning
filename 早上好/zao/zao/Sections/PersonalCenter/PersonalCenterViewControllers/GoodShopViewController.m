//
//  GoodShopViewController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/6.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "GoodShopViewController.h"
#import "SizeMacros.h"
#import "GoodShopModel.h"
#import "GoodShopTableViewCell.h"
#import "NetWorkRequset.h"
#import "AFNetworking.h"
#import "NoSingleNetWorkRequest.h"
#import "UIImageView+WebCache.h"
#define KSHAODIAN @"http://app.api.yijia.com/newapps/gsc/api/mshop.php?model=index"
@interface GoodShopViewController ()<UITableViewDataSource,UITableViewDelegate,netWorkRequsetDelegate,noSingleNetWorkRequestDelegate>
@property (nonatomic,retain)UITableView *tableView;
@property (nonatomic,retain)NSMutableArray *dataArray;//数据源
@end

@implementation GoodShopViewController
- (void)dealloc{
    [_tableView release];
    [_dataArray release];
    [super dealloc];
}
- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        self.dataArray = [NSMutableArray array];
        NSLog(@"oooooooooooo");
    }
    return _dataArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"折扣店";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建表示图对象
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.rowHeight = kScreenHeight/3.3;
        
    
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    //注册cell
    [self.tableView registerClass:[GoodShopTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView release];
    
    //设置代理对象
    [NetWorkRequset shareNetWorkRequset].delegate = self;
    
    //调用协议里的方法
    [NetWorkRequset getNetRequset:KSHAODIAN];
    NSLog(@"879874654654654654654343541324156");
    
    
//    
//    NoSingleNetWorkRequest *nosing = [[NoSingleNetWorkRequest alloc] init];
//    nosing.delegate = self;
//    [nosing getRequestInterNet:KSHAODIAN];
    
    [self.tableView reloadData];
    
    
    // Do any additional setup after loading the view.
}

//实现协议里的方法

- (void)conllectionViewReload:(id)data{
    for (NSDictionary *tempdic in data) {
        GoodShopModel *modrl = [[GoodShopModel alloc] initWithDic:tempdic];
        [self.dataArray addObject:modrl];
        NSLog(@"-============%@",self.dataArray);
        [modrl release];
    }
    [self.tableView reloadData];
}


//-(void)configurationModelWithRequsetData:(id)data{
//   
//    for (NSDictionary *tempdic in data) {
//        NSLog(@"================%@",tempdic);
//        GoodShopModel *modrl = [[GoodShopModel alloc] initWithDic:tempdic];
//        [self.dataArray addObject:modrl];
//        NSLog(@"-============%@",self.dataArray);
//        [modrl release];
//    }
//    [self.tableView reloadData];
//}












- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GoodShopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    GoodShopModel *model = [self.dataArray objectAtIndex:indexPath.row];
    cell.infoLabel.text = model.info;
    cell.brandView.image = [UIImage imageNamed:@"999.png"];
    cell.discountLabel.text = model.discount;
    cell.dateLabel.text = model.date;
    cell.titleLabel.text = model.title;
    NSURL *url = [NSURL URLWithString:model.pic];

    [cell.picView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeHolderImage.png"]];
    NSURL *logourl = [NSURL URLWithString:model.logo];
    [cell.logoView sd_setImageWithURL:logourl placeholderImage:[UIImage imageNamed:@"placeHolderImage.png"]];
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
