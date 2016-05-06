//
//  PersonalCenterViewController.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-3.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "PersonalCenterViewController.h"
#import "SizeMacros.h"
#import "PersonalCenterTableViewCell.h"
#import "LowerTableViewCell.h"
#import "FoundWebPageViewController.h"
#import "BargainbuyhandViewController.h"
#import "LookwebViewController.h"
#import "TodayWebViewController.h"
#import "GoodShopViewController.h"
#import "DevelopersViewController.h"
#import "SizeMacros.h"
@interface PersonalCenterViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)UITableView *tableView;
@end

@implementation PersonalCenterViewController
- (void)dealloc{
    [_tableView release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"发现";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 50;
    self.tableView.bounces = NO;
    //这两个都可以让tableView不动
   // self.tableView.scrollEnabled = NO;
    

    [self.view addSubview:self.tableView];
        [self.tableView release];
    //注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *personTabBarIteam = [[UITabBarItem alloc]initWithTitle:@"发现 " image:[[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"home_tab_point_btn@2x" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"home_tab_point_selected_btn@2x" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        personTabBarIteam.imageInsets = UIEdgeInsetsMake(7, 0, -7, 0);
        self.tabBarItem = personTabBarIteam;
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = @[@[@"生活街",@"超值买手"],@[@"今天很划算",@"瞄一眼"],@[@"品牌团",@"开发者"]];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = arr[indexPath.section][indexPath.row];
//    NSArray *imageArry = @[@[[UIImage imageNamed:@"personal_home_icon_first_order@2x.png"],[UIImage imageNamed:@"personal_home_icon_shopcart@2x"]],@[[UIImage imageNamed:@"login_dijia.png"],[UIImage imageNamed:@"sharemore_sight@2x.png"]],@[[UIImage imageNamed:@"message_small_loading@2x.png"],[UIImage imageNamed:@"mobile_addressbook@2x.png"]]];
//    cell.imageView.image =imageArry[indexPath.section][indexPath.row];
    //在cell最右侧上显示一个箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        FoundWebPageViewController *found = [[FoundWebPageViewController alloc] init];
        [self.navigationController pushViewController:found animated:YES];
        [found release];

    }else if (indexPath.section == 0 && indexPath.row == 1){
        BargainbuyhandViewController *bargainbuy = [[BargainbuyhandViewController alloc] init];
        [self.navigationController pushViewController:bargainbuy animated:YES];
        [bargainbuy release];
    }else if (indexPath.section == 1 && indexPath.row == 0){
        TodayWebViewController *today = [[TodayWebViewController alloc] init];
        [self.navigationController pushViewController:today animated:YES];
        [today release];
    }else if(indexPath.section == 1 && indexPath.row == 1){
        LookwebViewController *look = [[LookwebViewController alloc] init];
        [self.navigationController pushViewController:look animated:YES];
        [look release];
        
    }else if(indexPath.section == 2 && indexPath.row == 0)
    {
        
        self.tabBarController.selectedIndex = 2;
        
//        GoodShopViewController *goodshop = [[GoodShopViewController alloc] init];
//        [self.navigationController pushViewController:goodshop animated:YES];
//        [goodshop release];
        
    }else{
//        DevelopersViewController *developer = [[DevelopersViewController alloc] init];
//        
//        [self.navigationController pushViewController:developer animated:YES];
//        [developer release];
//        
        
        UIAlertView *aletView = [[UIAlertView alloc]initWithTitle:@"感谢您的使用和支持！" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
        [aletView show];
        [aletView release];
        
        
        
        }

    
    

}
- (void)viewWillAppear:(BOOL)animated{
    //self.tabBarController.tabBar.hidden = NO;
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
