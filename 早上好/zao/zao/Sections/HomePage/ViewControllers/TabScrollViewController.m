//
//  TabScrollViewController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-31.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "TabScrollViewController.h"
#import "SizeMacros.h"
@interface TabScrollViewController ()

@end

@implementation TabScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:self.receiveModel.wap_url]];
    UIWebView *tabWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-49)];
    self.automaticallyAdjustsScrollViewInsets = NO;
    tabWebView.scalesPageToFit = YES;
    [tabWebView loadRequest:urlRequest];
    [self.view addSubview:tabWebView];
    [tabWebView release];
    NSLog(@"%@",self.receiveModel.wap_url);
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
