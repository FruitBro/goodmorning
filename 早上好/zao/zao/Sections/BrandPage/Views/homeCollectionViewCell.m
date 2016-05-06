//
//  homeCollectionViewCell.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-4.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "homeCollectionViewCell.h"
#import "SizeMacros.h"
#import "NetWorkRequset.h"
#import "brandSessionModel.h"
#import "BrandSessionTableViewCell.h"
#import "AppDelegate.h"
#import "MJRefresh.h"
#import "BrandDetailViewController.h"
@interface homeCollectionViewCell()<netWorkRequsetDelegate>
@property (nonatomic,retain)NSMutableArray *dataArr;
@property (nonatomic,assign)NSInteger pageNumber;
//@property (nonatomic,retain)UIImageView *movingToTopImageView;
@property (nonatomic,retain)UIButton *toTopButton;
@end
@implementation homeCollectionViewCell
- (void)dealloc{
    [_tableView release];
    [_dataArr release];
    [_receiveURLStr release];
//    [_movingToTopImageView release];
    [_toTopButton release];
    [super dealloc];
}
- (NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        self.dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
- (UIButton *)toTopButton{
    if (_toTopButton == nil) {
        self.toTopButton = [[[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth-kScreenWidth/375*41, kScreenHeight-64-kScreenWidth/375*50, kScreenWidth/375*30, kScreenWidth/375*30)]autorelease];
//        _toTopButton.backgroundColor = [UIColor redColor];
        [_toTopButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"common_scrolltotop_btn" ofType:@"png"]] forState:UIControlStateNormal];
    }
    return [[_toTopButton retain]autorelease];
}
//- (UIImageView *)movingToTopImageView{
//    if (_movingToTopImageView == nil) {
//        self.movingToTopImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth-kScreenWidth/375*41, kScreenHeight-64-kScreenWidth/375*50, kScreenWidth/375*30, kScreenWidth/375*30)]autorelease];
//        //_movingToTopImageView.backgroundColor = [UIColor redColor];
//        _movingToTopImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"common_scrolltotop_btn" ofType:@"png"]];
//    }
//    return [[_movingToTopImageView retain]autorelease];
//}
- (UITableView *)tableView{
    if (_tableView == nil) {
        self.tableView = [[[UITableView alloc]initWithFrame:CGRectMake(0, kScreenWidth/10.5, kScreenWidth, kScreenHeight)]autorelease];
        //self.tableView.backgroundColor = [UIColor redColor];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = [UIColor whiteColor];
    }
    return [[_tableView retain]autorelease];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView.rowHeight = [UIScreen mainScreen].bounds.size.height/3.2;
       [self.tableView registerClass:[BrandSessionTableViewCell class] forCellReuseIdentifier:@"cell"];
        [self.contentView addSubview:self.tableView];
        }
    return self;
}
- (void)getURLstring{
    if (self.dataArr.count) {
        [self.dataArr removeAllObjects];
    }
    self.pageNumber = 0;
    [self requestURLData];
    [self loadMore];
    [self addHeader];
    [self addFooder];
}
- (void)loadMore{
    [self requestURLData];
}

- (void)requestURLData{
    
    NetWorkRequset *request = [[NetWorkRequset alloc] init];
    request.delegate = self;
    NSString *str =[NSString stringWithFormat:self.receiveURLStr,++self.pageNumber];
    [request getNetRequset:str];
   
    [request release];
}
- (void)conllectionViewReload:(id)data{
    //[self.tableView reloadData];
    
    NSArray *arr = [data objectForKey:@"objects"];
    for (NSDictionary *dic in arr) {
        brandSessionModel *model = [[[brandSessionModel alloc]initWithDic:dic]autorelease];
        //NSLog(@"%@", model.special_name);
        [self.dataArr addObject:model];
    }
    [self.tableView reloadData];
}
- (void)addHeader{
    homeCollectionViewCell *weakSelf = self;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [weakSelf updateDataSource];//更新数据
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.tableView reloadData];//重新加载tableView；
                [weakSelf.tableView.header endRefreshing];//关闭刷新效果
            });
        });
    }];
    self.tableView.header = header;
}
- (void)updateDataSource{
    [self requestURLData];
}
- (void)addFooder{
    homeCollectionViewCell *weakSelf = self;
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMore];//加载更多数据
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.footer endRefreshing];
    }];
    self.tableView.footer = footer;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BrandSessionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //NSLog(@"%@",self.receiveURLStr);
    if (self.dataArr.count != 0) {
        brandSessionModel *model = [self.dataArr objectAtIndex:indexPath.row];
        [cell configureCellWithModel:model];
    }
    [UIView animateWithDuration:2 animations:^{
        if (self.tableView.contentOffset.y>kScreenHeight/3.2*5) {
//            self.movingToTopImageView.userInteractionEnabled = YES;
            
//            [((AppDelegate *)[UIApplication sharedApplication].delegate).window addSubview:self.movingToTopImageView];
//           [((AppDelegate *)[UIApplication sharedApplication].delegate).window addSubview:self.toTopButton];
         [self.tableView.superview addSubview:self.toTopButton];
            [self.toTopButton addTarget:self action:@selector(handelClickToTopButton:) forControlEvents:UIControlEventTouchUpInside];
        }else{
//            [self.movingToTopImageView removeFromSuperview];
            [self.toTopButton removeFromSuperview];
        }

    }];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArr.count !=0) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(pushToBrandDetailListViewController:)]) {
            [self.delegate pushToBrandDetailListViewController:[self.dataArr objectAtIndex:indexPath.row]];
        }

    }
    
    
}




- (void)handelClickToTopButton:(UIButton *)sender{
    self.tableView.contentOffset = CGPointMake(0, 0);
}














@end
