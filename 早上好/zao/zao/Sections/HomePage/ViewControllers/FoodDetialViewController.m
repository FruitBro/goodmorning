//
//  FoodDetialViewController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "FoodDetialViewController.h"
#import "FoodCustomTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "LastBuyInterFaceViewController.h"
#import "SizeMacros.h"
@interface FoodDetialViewController ()<FoodCustomTableViewCellDelegate>

@end

@implementation FoodDetialViewController
-(void)dealloc{
    [_receiveWapUrlString release];
    [_tableView release];
    [_receiveArray release];
   
    [super dealloc];
}
-(void)passValueArray:(id)data{
    if ([data isKindOfClass:[NSArray class]]) {
        self.receiveArray = data;
        [self.tableView reloadData];
    }
    
    if (![data isKindOfClass:[NSArray class]]) {
        LastBuyInterFaceViewController *last = [[LastBuyInterFaceViewController alloc]init];
        last.receiveScholl = data;
        [self.navigationController pushViewController:last animated:YES];
        [last release];
    }
    
}
-(NSArray *)receiveArray{
    if (_receiveArray == nil) {
        self.receiveArray = [NSArray array];
    }
    return _receiveArray;
}
-(UITableView *)tableView{
    if (_tableView ==nil ) {
        self.tableView = [[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain]autorelease];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return _tableView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
         return self.receiveArray.count/2*kScreenHeight/2;
    }
    return kScreenHeight/4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HEHE" forIndexPath:indexPath];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:cell.contentView.frame];
        [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://z11.tuanimg.com/imagev2/wxyy/640x244.e5e2e0804ed180023dddc69ebfc272b3.jpg"] placeholderImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1" ofType:nil]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            imageView.image = image;
        }];
        [cell.contentView addSubview:imageView];
        [imageView release];
        return cell;
        
    
    }else{
    FoodCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PO" forIndexPath:indexPath];
    cell.delegate = self;
        return cell;}
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"优品汇";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[FoodCustomTableViewCell class] forCellReuseIdentifier:@"PO"];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"HEHE"];
       // Do any additional setup after loading the view.
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
