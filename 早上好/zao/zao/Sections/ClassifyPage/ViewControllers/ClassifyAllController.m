//
//  ClassifyAllController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/7/30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "ClassifyAllController.h"
#import "AllViewCell.h"
#import "NetWorkRequset.h"
#import "AllModel.h"
#import "HTMLStringParser.h"
#import "UIImageView+WebCache.h"
#import "ClassifyWebpageViewController.h"
#import "MJRefresh.h"
#import "AFNetworking.h"
#import "SizeMacros.h"
#import "AppDelegate.h"
#define KSMenClothingg @"http://m.api.zhe800.com/v5/deals?parent_tag=wireless1004&url_name=wireless1032&order=&min_price=&max_price=&user_type=1&user_role=1&shop_type=&image_type=all&image_model=webp&page=1&per_page=20"
#define KSSaled @"http://m.api.zhe800.com/v5/deals?parent_tag=wireless1004&url_name=wireless1032&order=saled&min_price=&max_price=&user_type=1&user_role=1&shop_type=&image_type=all&image_model=webp&page=1&per_page=20"
#define KSPrice @"http://m.api.zhe800.com/v5/deals?parent_tag=wireless1004&url_name=wireless1032&order=price&min_price=&max_price=&user_type=1&user_role=1&shop_type=&image_type=all&image_model=webp&page=1&per_page=20"
#define KSBustNew @"http://m.api.zhe800.com/v5/deals?parent_tag=wireless1004&url_name=wireless1032&order=publishTime&min_price=&max_price=&user_type=1&user_role=1&shop_type=&image_type=all&image_model=webp&page=1&per_page=20"
@interface ClassifyAllController ()<netWorkRequsetDelegate,UIScrollViewDelegate>
@property (nonatomic,retain)NSMutableArray *dataArry;//数据源  用来存储AllModel对象
@property (nonatomic,retain)UIButton *button;
@property (nonatomic,retain)UIImageView *imageView;

@end

@implementation ClassifyAllController
- (void)dealloc{
    [_dataArry release];
    [super dealloc];
}
//懒加载
- (NSMutableArray *)dataArry{
    if (_dataArry == nil) {
        self.dataArry = [NSMutableArray array];
    }
    return _dataArry;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //刷新
    [self.tableView reloadData];
    //返回行高
    self.tableView.rowHeight = kScreenHeight/5.7;
    //上拉加载
   [self UpdateLoad];
    //返回顶部的操作
    //[self.tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
    
    // 设置导航条
    //接受上个界面传过来的值  名字
    self.navigationItem.title = self.model;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:20]};
    UISegmentedControl *segmente = [[UISegmentedControl alloc] initWithItems:@[@"默认",@"销量",@"价格",@"最新"]];
    segmente.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40);
    segmente.selectedSegmentIndex = 0;
    [segmente addTarget:(self) action:@selector(handleClicksegmente:) forControlEvents:UIControlEventValueChanged];
    self.tableView.tableHeaderView = segmente;
    [segmente release];
    
    
    //self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    
    NSLog(@"%@",self.receiveModel);
    
    //设置代理对象
    [NetWorkRequset shareNetWorkRequset].delegate = self;
    //调用协议里的方法

    [NetWorkRequset getNetRequset:[NSString stringWithFormat:@"http://m.api.zhe800.com/v5/deals?parent_tag=wireless1004&url_name=%@&order=&min_price=&max_price=&user_type=1&user_role=1&shop_type=&image_type=all&image_model=webp&page=1&per_page=20",self.receiveModel]];
   
    
       [self.tableView reloadData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     //self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
#pragma mark - 更新数据源的方法
//更新数据源的方法
static NSInteger pag = 1;
- (void)loadModel{
    
    //AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [NetWorkRequset shareNetWorkRequset].delegate = self;

    NSString *urlstr = [NSString stringWithFormat:@"http://m.api.zhe800.com/v5/deals?parent_tag=wireless1004&url_name=%@&order=&min_price=&max_price=&user_type=1&user_role=1&shop_type=&image_type=all&image_model=webp&page=%ld&per_page=20",self.receiveModel,(long)++pag];
    
    [NetWorkRequset getNetRequset:urlstr];
    
    [self.tableView reloadData];
    
}

#pragma mark==-----------添加上拉加载的方法
//上拉加载
- (void)UpdateLoad{
    ClassifyAllController __block *weakSelf = self;
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [weakSelf.tableView.footer noticeNoMoreData];
            [weakSelf loadModel];//加载更多数据
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];//重新加载
      
            [weakSelf.tableView.footer endRefreshing];//关闭加载效果
        });
            
            
        });
       
    }];
    self.tableView.footer = footer;
    
}

//实现协议里的方法
- (void)conllectionViewReload:(id)data{
    if (pag == 1) {
        [self.dataArry removeAllObjects];//作用  当点击Segment上的 默认 销量 价格 最新的时候 移除这个数组的数据 重新 获取点击Segment上对应的 数据
        //获取字典对应的数组
        NSArray *Arry = [data objectForKey:@"objects"];
        //遍历数组得到对应的字典 然后封装成AllModel对象
        for (NSDictionary *tmpeDic in Arry) {
            //将遍历出来的对象封装对象
            AllModel *model = [[AllModel alloc] initWithDic:tmpeDic];
            //将封装的对象添加到数组中
            [self.dataArry addObject:model];
            [model release];
        }
        //刷新
        [self.tableView reloadData];
        

    }else{
    //[self.dataArry removeAllObjects];//作用  当点击Segment上的 默认 销量 价格 最新的时候 移除这个数组的数据 重新 获取点击Segment上对应的 数据
    //获取字典对应的数组
    NSArray *Arry = [data objectForKey:@"objects"];
    //遍历数组得到对应的字典 然后封装成AllModel对象
    for (NSDictionary *tmpeDic in Arry) {
        //将遍历出来的对象封装对象
        AllModel *model = [[AllModel alloc] initWithDic:tmpeDic];
        //将封装的对象添加到数组中
        [self.dataArry addObject:model];
        [model release];
    }
    //刷新
    [self.tableView reloadData];
    }
}

//悬浮按钮 点击返回顶部

- (void)ClickButtonReturnTop{
    NSLog(@"yuuuuuuuuuuuuuuuuuuuuueirw");
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth-kScreenWidth/375*41, kScreenHeight-64-kScreenWidth/375*50, kScreenWidth/375*30, kScreenWidth/375*30)];
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"common_scrolltotop_btn" ofType:@"png"]]];
    self.imageView.frame = CGRectMake(kScreenWidth-kScreenWidth/375*41, kScreenHeight-64-kScreenWidth/375*50, kScreenWidth/375*30, kScreenWidth/375*30);
    
    [self.button addSubview:self.imageView];
    
    [UIView animateWithDuration:2 animations:^{
        if (self.tableView.contentOffset.y<0) {
            self.imageView.userInteractionEnabled = YES;
            [((AppDelegate *)[UIApplication sharedApplication].delegate).window addSubview:self.button];
        
            [self.button addTarget:self action:@selector(handleClickbutton:) forControlEvents:UIControlEventTouchUpInside];
            
            
            
            
        }else{
            [self.button removeFromSuperview];
        }
        
        
        
        
    }];
}

//点击按钮的响应事件
- (void)handleClickbutton:(UIButton *)sender{
    self.tableView.contentOffset = CGPointMake(0,0);
}


- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
   // [self ClickButtonReturnTop];
}







#pragma mark--------------------点击segment的响应事件
//点击segment的响应事件
- (void)handleClicksegmente:(UISegmentedControl *)sender{
    NSLog(@"hhkjh");
    switch (sender.selectedSegmentIndex) {
        case 0:
        {
            [NetWorkRequset getNetRequset:[NSString stringWithFormat:@"http://m.api.zhe800.com/v5/deals?parent_tag=wireless1004&url_name=%@&order=&min_price=&max_price=&user_type=1&user_role=1&shop_type=&image_type=all&image_model=webp&page=1&per_page=20",self.receiveModel]];
        }
            break;
        case 1:
        {
            [NetWorkRequset getNetRequset:[NSString stringWithFormat:@"http://m.api.zhe800.com/v5/deals?parent_tag=wireless1004&url_name=%@&order=saled&min_price=&max_price=&user_type=1&user_role=1&shop_type=&image_type=all&image_model=webp&page=1&per_page=20",self.receiveModel]];
        }
            break;
        case 2:
        {
            [NetWorkRequset getNetRequset:[NSString stringWithFormat:@"http://m.api.zhe800.com/v5/deals?parent_tag=wireless1004&url_name=%@&order=price&min_price=&max_price=&user_type=1&user_role=1&shop_type=&image_type=all&image_model=webp&page=1&per_page=20",self.receiveModel]];
        }
            break;
        case 3:
        {
            [NetWorkRequset getNetRequset:[NSString stringWithFormat:@"http://m.api.zhe800.com/v5/deals?parent_tag=wireless1004&url_name=%@&order=publishTime&min_price=&max_price=&user_type=1&user_role=1&shop_type=&image_type=all&image_model=webp&page=1&per_page=20",self.receiveModel]];
        }
            break;
            
            
        default:
            break;
    }
    
    
    
    
    //[self.tableView reloadData];
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
    return self.dataArry.count;
}


//配置cell  也就是cell上显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AllModel *model = [self.dataArry objectAtIndex:indexPath.row];
    static NSString *cellind = @"cell";
    AllViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellind];
    if (cell == nil) {
        cell = [[[AllViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellind]autorelease];
    }
    //为cell赋值
    cell.titleLabel.text = model.title;
    cell.priceLabel.text = [NSString stringWithFormat:@"￥%d",[model.price intValue]/100];
    cell.originalprice.text = [NSString stringWithFormat:@"￥%d",[model.list_price intValue]/100];
    cell.originalprice.textColor = [UIColor grayColor];
    cell.originalprice.font = [UIFont systemFontOfSize:10];
    cell.saledLabel.text = [NSString stringWithFormat:@"已售%d件",[model.sales_count intValue]];
    cell.saledLabel.textColor = [UIColor grayColor];
    cell.saledLabel.font = [UIFont systemFontOfSize:10];
    if ((cell.baoyouLabel.text = [NSString stringWithFormat:@"%d",[model.baoyou intValue]])) {
        cell.baoyouLabel.text = @"包邮";
        cell.baoyouLabel.textColor = [UIColor redColor];
    }else{
        cell.baoyouLabel.text = nil;
    }
    if ((cell.soure_typeLabel.text = [NSString stringWithFormat:@"%d",[model.soure_type intValue]])) {
        cell.soure_typeLabel.text = @"去天猫";
        cell.soure_typeLabel.textColor = [UIColor grayColor];
        cell.soure_typeLabel.adjustsFontSizeToFitWidth = YES;
    }else{
        cell.soure_typeLabel.text = @"特卖商城";
        cell.soure_typeLabel.textColor = [UIColor grayColor];
        cell.soure_typeLabel.adjustsFontSizeToFitWidth = YES;
    }
    NSString *string =  [model.normal substringToIndex:model.normal.length - 5];
    NSURL *url = [NSURL URLWithString:string];
    
    [cell.picImageView sd_setImageWithURL:url placeholderImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bgc" ofType:@"jpg"]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        cell.picImageView.image = image;
    }];
    
    

    
    return cell;
    
    
    
}
//点击cell的响应事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ClassifyWebpageViewController *clawebLoad = [[ClassifyWebpageViewController alloc] init];
    clawebLoad.model = [self.dataArry objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:clawebLoad animated:YES];
    [clawebLoad release];
    
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
