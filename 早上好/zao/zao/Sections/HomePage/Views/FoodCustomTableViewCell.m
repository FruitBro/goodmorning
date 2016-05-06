//
//  FoodCustomTableViewCell.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-2.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "FoodCustomTableViewCell.h"
#import "SizeMacros.h"
#import "brandDetailListModel.h"
#import "FoodCustomModel.h"
#import "UIImageView+WebCache.h"
#import "BrandDetailCollectionViewCell.h"

@implementation FoodCustomTableViewCell
-(void)dealloc{
    [_foodCollectionView release];
    [_foodCollectionViewLayout release];
     [_foodDataArray release];
    [super dealloc];
}
-(NSMutableArray *)foodDataArray{
    if (_foodDataArray == nil) {
        self.foodDataArray = [NSMutableArray array];
    }
    return _foodDataArray;
}

-(void)conllectionViewReload:(id)data{
    NSDictionary *dic = data;
    NSArray *arr = [dic objectForKey:@"objects"];
    for (id object in arr) {
        brandDetailListModel *model = [[brandDetailListModel alloc]initWithDic:object];
        [self.foodDataArray addObject:model];
        [model release];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(passValueArray:)]) {
        [self.delegate passValueArray:self.foodDataArray];
    }
    [self.foodCollectionView reloadData];
    self.foodCollectionView.frame = CGRectMake(0, 0,kScreenWidth, kScreenHeight/2*self.foodDataArray.count/2);
    
}

-(UICollectionView *)foodCollectionView{
    if (_foodCollectionView == nil) {
    
        self.foodCollectionView = [[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth, kScreenHeight/2*self.foodDataArray.count/2) collectionViewLayout:self.foodCollectionViewLayout]autorelease];
        
       

    }
    return _foodCollectionView;
}

-(UICollectionViewFlowLayout *)foodCollectionViewLayout{
    if (_foodCollectionViewLayout == nil) {
        self.foodCollectionViewLayout = [[[UICollectionViewFlowLayout alloc]init]autorelease];
        self.foodCollectionViewLayout.itemSize = CGSizeMake(kScreenWidth/2, kScreenHeight/2);
        self.foodCollectionViewLayout.minimumInteritemSpacing = 0;
        self.foodCollectionViewLayout.minimumLineSpacing = 0;

        }
    return _foodCollectionViewLayout;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
        self.foodCollectionView.delegate = self;
        self.foodCollectionView.dataSource = self;
        self.foodCollectionView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.foodCollectionView];
        [self.foodCollectionView registerClass:[BrandDetailCollectionViewCell class] forCellWithReuseIdentifier:@"HE"];
        [NetWorkRequset shareNetWorkRequset].delegate = self;
        [NetWorkRequset getNetRequset:@"http://th5.m.zhe800.com/youpin/deals?image_model=jpg&url_name=all&per_page=20&page=1&order=&user_type=1&user_role=1&student=1"];
        //[self.foodCollectionView reloadData];
        
    }
    return self;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(kScreenWidth/2, kScreenHeight/2);
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
   
    return self.foodDataArray.count;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate && [self.delegate respondsToSelector:@selector(passValueArray:)]) {
        [self.delegate passValueArray:self.foodDataArray[indexPath.row]];
    }
    }
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BrandDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HE" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    brandDetailListModel *model = [self.foodDataArray objectAtIndex:indexPath.row];
    [cell configureCollectionCellWithBrandDetailListModel:model];
    
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
