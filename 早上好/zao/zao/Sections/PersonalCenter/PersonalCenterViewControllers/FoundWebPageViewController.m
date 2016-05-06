//
//  FoundWebPageViewController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/6.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "FoundWebPageViewController.h"

#import "SizeMacros.h"
@interface FoundWebPageViewController ()<UIWebViewDelegate>
@property (nonatomic,retain)UIWebView *web;
@property (nonatomic,retain)UIActivityIndicatorView *activityView;//加载的菊花效果
@property (nonatomic,retain)UILabel *activLabel;//呈现一个正在加载的字条
@end

@implementation FoundWebPageViewController
- (void)dealloc{
    [_web release];
    [_activityView release];
    [_activLabel release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"生活街";
    
    
    //处理网页的方式  而且使用网络封装 代理传值得到的数据
    [self detailWithHTMLInWebView];
    
    
    // Do any additional setup after loading the view.
}


//处理网页的方式  而且使用网络封装 代理传值得到的数据
- (void)detailWithHTMLInWebView{
    //
    NSURLRequest *urlReauest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://zhekou.yijia.com/lws/view/yijia_shop.php?id=9&app_id=3119872284&sche=fen_nine_anzhong&app_channel=Android"]];
    //创建UIWebView;
    self.web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64-49)];
    self.automaticallyAdjustsScrollViewInsets = NO;
    //webview根据网页的页数多少去自适应
    
    self.web.scalesPageToFit = YES;
    //设置代理对象
    self.web.delegate = self;
    [self.web loadRequest:urlReauest];
    [self.view addSubview:self.web];
    [self.web release];
    
    
    
    
    
    
}


#pragma mark --------UIWebViewDelegate
//网页开始加载的方法
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    
    
    self.activLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/2.7, kScreenHeight/2.1, kScreenWidth/3.75, kScreenHeight/22.23)];
    self.activLabel.text = @"正在加载...";
    self.activLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.web addSubview:self.activLabel];
    [self.activLabel release];
    
    
    
    self.activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.activityView.frame = CGRectMake(0, 0, kScreenWidth/12.5, kScreenWidth/12.5);
    //self.activityView.center = self.view.center;
    [self.activityView setCenter:CGPointMake(kScreenWidth/2, kScreenHeight/2.23)];
    self.activityView.color = [UIColor orangeColor];
    [self.activityView startAnimating];
    [self.web addSubview:self.activityView];
    [self.activityView release];
    
    
    
    NSLog(@"网页开始加载");
}
//询问是否开始加载网页链接
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
//网页加载完成  也就是说网页显示在webView上了
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"网页加载完成");
    
    [self.activityView stopAnimating];
    [self.activLabel removeFromSuperview];
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
