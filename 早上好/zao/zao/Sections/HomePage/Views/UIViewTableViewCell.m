//
//  UIViewTableViewCell.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-29.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "UIViewTableViewCell.h"
#import "SizeMacros.h"
#import "UIViewCollectionViewCell.h"
#import "UIviewRequestNetWorking.h"
#import "UIViewModel.h"
#import "UIImageView+WebCache.h"
@interface UIViewTableViewCell ()<UIviewRequestNetWorkingDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,retain)NSMutableArray *UIViewArray;
@property (nonatomic,retain)NSMutableString *wapUrlString;

@end
@implementation UIViewTableViewCell
-(NSMutableArray *)UIViewArray{
    if (_UIViewArray == nil) {
        self.UIViewArray = [NSMutableArray array];
    }
    return [[_UIViewArray retain]autorelease];
}
-(void)configurationUIViewModelWithRequsetData:(id)data{
    for (id object in data) {
        UIViewModel *viewModel = [[UIViewModel alloc]initWithDictionary:object];
        [self.UIViewArray addObject:viewModel];
        [viewModel release];
    }
    [self.UIViewCollectionView reloadData];
    if (self.delegate && [self.delegate respondsToSelector:@selector(reloadTableUIView:)]) {
        [self.delegate reloadTableUIView:self.UIViewArray];
    }

}

-(void)dealloc{
    [_UIViewCollectionView release];
    [_UIViewCollectionViewLayout release];
    [_UIViewArray release];
    [_wapUrlString release];
    [super dealloc];
}
-(UICollectionViewFlowLayout *)UIViewCollectionViewLayout{
    if (_UIViewCollectionViewLayout == nil) {
        self.UIViewCollectionViewLayout = [[[UICollectionViewFlowLayout alloc]init]autorelease];

        self.UIViewCollectionViewLayout.minimumInteritemSpacing = 0;
        self.UIViewCollectionViewLayout.minimumLineSpacing = 0;
       
    }
    return _UIViewCollectionViewLayout;
}
-(UICollectionView *)UIViewCollectionView{
    if (_UIViewCollectionView == nil) {
        self.UIViewCollectionView = [[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/3+kScreenHeight/4*2) collectionViewLayout:self.UIViewCollectionViewLayout]autorelease];
        [self.UIViewCollectionView registerClass:[UIViewCollectionViewCell class] forCellWithReuseIdentifier:@"UIVE"];
        self.UIViewCollectionView.backgroundColor = [UIColor colorWithRed:73/256.0 green:255/256.0 blue:249/256.0 alpha:0.1];
    }
    return _UIViewCollectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
       return 8;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (self.UIViewArray.count) {
        return 1;
    }
        return 0;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row <= 1) {
        return CGSizeMake(kScreenWidth/2-10, kScreenHeight/3-10);
           }else{
               
               return CGSizeMake(kScreenWidth/3-1, kScreenHeight/4-1);

    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UIViewCollectionViewCell *collCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UIVE" forIndexPath:indexPath];
  UIViewModel *model = [self.UIViewArray objectAtIndex:indexPath.row];
       [collCell.UIViewButton sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld",(long)indexPath.row+1]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       collCell.UIViewButton.image = image;
           
    }];
    collCell.titleLable.text = model.title;
    collCell.contentLabel.text = model.content;
            return collCell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        self.wapUrlString = [NSMutableString stringWithString:@"http://m.api.zhe800.com/v3/deals/today?tag_url=&order=&min_price=&max_price=&shop_type=&image_type=all&image_model=webp&page=1&per_page=20"];
    }else if(indexPath.row == 1){
         self.wapUrlString = [NSMutableString stringWithString:@"http://m.api.zhe800.com/v3/tendeals?image_type=all&image_model=webp&user_type=1&user_role=1&page=1&per_page=20"];
    }else if(indexPath.row == 2){
        self.wapUrlString = [NSMutableString stringWithString:@"http://m.api.zhe800.com/v2/forecast/deals?image_type=all&image_model=webp&page=1&per_page=20"];
    }else if(indexPath.row == 3){
        self.wapUrlString = [NSMutableString stringWithString:@"http://m.api.zhe800.com/v3/mobile/deals?platform=android&model=N918St&image_type=all&image_model=webp&url_name=&page=1&per_page=20"];
    }else if(indexPath.row == 4){
        self.wapUrlString = [NSMutableString stringWithString:@"http://m.api.zhe800.com/v5/deals?url_name=baoyou&parent_tag=&order=&min_price=&max_price=&user_type=1&user_role=1&shop_type=&image_type=all&image_model=webp&page=1&per_page=20"];
    }else if(indexPath.row == 5){
        self.wapUrlString = [NSMutableString stringWithString:@"http://m.api.zhe800.com/v2/guang/deals?tag_url=guangyifu&image_type=all&image_model=webp&page=1&per_page=20"];
    }else if(indexPath.row == 6){
        self.wapUrlString = [NSMutableString stringWithString:@"http://zapi.zhe800.com/cn/inner/lottery/processing"];
    }else if(indexPath.row == 7){
        self.wapUrlString = [NSMutableString stringWithString:@"http://th5.m.zhe800.com/youpin/deals?image_model=jpg&url_name=all&per_page=20&page=1&order=&user_type=1&user_role=1&student=1"];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(pushToNextInterFace::)]) {
        [self.delegate pushToNextInterFace:self.wapUrlString :indexPath];
    }

    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.UIViewCollectionView.delegate = self;
        self.UIViewCollectionView.dataSource = self;
        UIviewRequestNetWorking *UIViewRequest = [[UIviewRequestNetWorking alloc]init];
        UIViewRequest.delegate = self;
        [UIViewRequest getUIViewRequestInterNet:@"http://m.api.zhe800.com/homesetting/v5?user_type=0&user_role=1&platform=android"];
        [UIViewRequest release];

        [self.contentView addSubview:self.UIViewCollectionView];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
