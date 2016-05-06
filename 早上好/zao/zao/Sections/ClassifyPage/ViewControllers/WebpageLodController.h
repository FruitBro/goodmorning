//
//  WebpageLodController.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/7/31.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassifyModel.h"
@interface WebpageLodController : UIViewController<UIWebViewDelegate>
@property (nonatomic,retain)ClassifyModel *model;
@property (nonatomic,retain)UIWebView *webView;

@end
