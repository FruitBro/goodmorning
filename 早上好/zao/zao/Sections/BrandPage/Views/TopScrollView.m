//
//  TopScrollView.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-7-30.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "TopScrollView.h"

@implementation TopScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)dealloc{
    [_itemsArr release];
    [_scrollView release];
    [_topScrollButton release];
    [_buttonArr release];
    [super dealloc];
}
- (UIScrollView *)scrollView{
    if (_scrollView == nil) {
        self.scrollView = [[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)]autorelease];
        //self.scrollView.backgroundColor = [UIColor redColor];
        self.scrollView.bounces = YES;
        self.scrollView.alwaysBounceHorizontal = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        
    }
    return _scrollView;
}
- (NSMutableArray *)itemsArr{
    if (_itemsArr == nil) {
        self.itemsArr = [NSMutableArray array];
    }
    return _itemsArr;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureScrollView];
        [self addSubview:self.scrollView];
    }
    return self;
}

- (void)configureScrollView{
    NSArray *arr = @[@"最新上线",@"昨日上线",@"最后疯抢",@"女装",@"母婴",@"儿童",@"鞋品",@"内衣",@"箱包",@"居家",@"美食",@"男装",@"美妆",@"配饰",@"数码家电",@"家纺",@"其它"];
    for (int i = 0; i < arr.count; i++) {
        [self.itemsArr addObject:arr[i]];
    }
    int singelLength = [UIScreen mainScreen].bounds.size.width/5;
    self.scrollView.contentSize = CGSizeMake(singelLength*self.itemsArr.count, 50);
    for (int i = 0; i < self.itemsArr.count; i++) {
        self.topScrollButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _topScrollButton.frame = CGRectMake(singelLength*i, 0, singelLength, 50);
        [_topScrollButton setTitle:self.itemsArr[i] forState:UIControlStateNormal];
        [_topScrollButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _topScrollButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _topScrollButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        _topScrollButton.tag = 100 + i;
        [_topScrollButton addTarget:self action:@selector(handleClickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:_topScrollButton];
        
    }
}

- (void)handleClickButton:(UIButton *)sender{
    for (int i = 100; i < self.itemsArr.count + 100; i++) {
        UIButton *button = (UIButton *)[self.scrollView viewWithTag:i];
        
        if (i == sender.tag) {
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:16];
        }else{
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:13];
        }
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(handleClickThebutton:)]) {
        [self.delegate handleClickThebutton:sender];
    }
}











@end
