//
//  LastBuyInterFaceViewController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-31.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "LastBuyInterFaceViewController.h"
#import "HTMLStringParser.h"
#import "NetWorkRequset.h"
#import "UMSocial.h"
#import "GiFHUD.h"
@interface LastBuyInterFaceViewController ()<netWorkRequsetDelegate,UIWebViewDelegate>
@property (nonatomic,retain)UIWebView *buyInterFace;
@end

@implementation LastBuyInterFaceViewController
-(void)dealloc{
    [_receiveScholl release];
    self.buyInterFace.delegate = nil;
    
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    but.frame = CGRectMake(0, 0, 40, 40);
//    [but setImage:[UIImage imageNamed:@"12"] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(shareToSomeThing) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:but];
    self.navigationItem.rightBarButtonItem = buttonItem;
    
    if (self.receScholl.length == 0) {
         self.receScholl = self.receiveScholl.wap_url;
    }
   
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:self.receScholl]];
    self.buyInterFace = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-49)];
     self.buyInterFace.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.buyInterFace.scalesPageToFit = YES;
    [self.buyInterFace loadRequest:urlRequest];
    [self.view addSubview:self.buyInterFace];
    [self.buyInterFace release];
  }
-(void)shareToSomeThing{
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"507fcab25270157b37000010"
                                      shareText:@"你要分享的文字"
                                     shareImage:[UIImage imageNamed:@"icon.png"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,nil]
                                       delegate:nil];
//    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToQQ,UMShareToQzone,UMShareToWechatSession,UMShareToWechatTimeline]];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    return YES;
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
 
//  [GiFHUD setGifWithImageName:@"pika.gif"];
//    [GiFHUD show];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{

   
//    [GiFHUD dismiss];


}
-(void)viewDidDisappear:(BOOL)animated{
//    [super viewDidDisappear:animated];
     [GiFHUD dismiss];
//    self.buyInterFace.delegate = nil;
   
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
