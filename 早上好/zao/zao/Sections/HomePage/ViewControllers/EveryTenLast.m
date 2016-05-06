//
//  EveryTenLast.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "EveryTenLast.h"


@interface EveryTenLast ()

@end

@implementation EveryTenLast
-(void)dealloc{
    [_receiveWap_url release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-49)];
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.receiveWap_url]]];
    [self.view addSubview:web];
    self.automaticallyAdjustsScrollViewInsets = NO;
    web.scalesPageToFit = YES;
    [web release];
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
