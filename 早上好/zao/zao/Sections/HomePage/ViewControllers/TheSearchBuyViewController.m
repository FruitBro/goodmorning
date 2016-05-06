//
//  TheSearchBuyViewController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-5.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "TheSearchBuyViewController.h"

@interface TheSearchBuyViewController ()

@end

@implementation TheSearchBuyViewController
-(void)dealloc{
    [_receiveWap release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:self.receiveWap]];
    UIWebView *listWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-49)];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [listWebView loadRequest:urlRequest];
    [self.view addSubview:listWebView];
    [listWebView release];
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
