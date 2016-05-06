//
//  ListDetialTableViewController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-6.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "ListDetialTableViewController.h"

@interface ListDetialTableViewController ()

@end

@implementation ListDetialTableViewController

-(void)dealloc{
    [_model release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:self.model.wap_url]];
    UIWebView *listWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-49)];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [listWebView loadRequest:urlRequest];
    [self.view addSubview:listWebView];
    [listWebView release];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
