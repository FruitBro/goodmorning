//
//  todayUpdateViewController.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-2.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "todayUpdateViewController.h"

@interface todayUpdateViewController ()

@end

@implementation todayUpdateViewController
- (void)dealloc{
    [_model release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpBackButton];
    [self setUpWebView];
    // Do any additional setup after loading the view.
}
- (void)setUpWebView{
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64)];
    self.automaticallyAdjustsScrollViewInsets = YES;
    NSURL *url = [NSURL URLWithString:self.model.wap_url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    [webView release];
    
}
- (void)setUpBackButton{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    backButton.frame = CGRectMake(-20, 10, 100, 50);
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(handleClickBackButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
}
- (void)handleClickBackButtonAction:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
