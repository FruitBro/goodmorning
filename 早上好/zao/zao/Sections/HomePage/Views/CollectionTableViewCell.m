//
//  CollectionTableViewCell.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-29.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "CollectionTableViewCell.h"
#import "CustomCollectionViewCell.h"

#import "NetWorkRequset.h"
#import "UIImageView+WebCache.h"
#import "SizeMacros.h"
@implementation CollectionTableViewCell
-(void)dealloc{
    [_conllection release];
    [_flowLayout release];
    [_collectionCellArrayModel release];
    [_collectionCellDicModel release];
    [super dealloc];
}
-(NSMutableArray *)collectionCellArrayModel{
    if (_collectionCellArrayModel == nil) {
        self.collectionCellArrayModel = [NSMutableArray array];
    }
    return _collectionCellArrayModel;
}
-(void)conllectionViewReload:(id)data{

            NSArray *arr = data;
        
        for (id object in arr) {
            CollectionModel *model = [[CollectionModel alloc]initWithDictionary:object];
            [self.collectionCellArrayModel addObject:model];
            [model release];
        }
        [self.conllection reloadData];

}
-(UICollectionViewFlowLayout *)flowLayout{
    if (_flowLayout == nil) {
        self.flowLayout = [[[UICollectionViewFlowLayout alloc]init]autorelease];
        self.flowLayout.itemSize = CGSizeMake(kScreenWidth/4, kScreenHeight/8);
        self.flowLayout.minimumLineSpacing = 0;
        self.flowLayout.minimumInteritemSpacing = 0;
    }
    return _flowLayout;
}
-(UICollectionView *)conllection{
    if (_conllection == nil) {
        self.conllection = [[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/4) collectionViewLayout:self.flowLayout]autorelease];
    self.conllection.backgroundColor = [UIColor colorWithRed:102/256.0 green:206/256.0 blue:242/256.0 alpha:0.1];
        self.conllection.dataSource = self;
        self.conllection.delegate = self;
        [self.conllection registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"CUSTOM"];
    }
    return _conllection;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.conllection];
        [NetWorkRequset shareNetWorkRequset].delegate = self;
        [NetWorkRequset getNetRequset:@"http://m.api.zhe800.com/v4/tags/recommend?user_type=0&user_role=1&student=1"];
   
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.collectionCellArrayModel.count) {
        return self.collectionCellArrayModel.count+1;
    }
    return self.collectionCellArrayModel.count;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%ld",(long)indexPath.row);
    if (indexPath.row != 7) {
       
        if (self.delegate &&[self.delegate respondsToSelector:@selector(pushtoCollectionDetialControll:)]) {
            [self.delegate pushtoCollectionDetialControll:[self.collectionCellArrayModel objectAtIndex:indexPath.row]];
        }}
        if (indexPath.row == 7){
            
            if (self.delegate &&[self.delegate respondsToSelector:@selector(pushtoCollectionDetialControll:)]) {
                [self.delegate pushtoCollectionDetialControll:nil];}
             
            }
  

   
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
      CustomCollectionViewCell *customCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CUSTOM" forIndexPath:indexPath];
   
    if (indexPath.row != 7) {
        CollectionModel *model = [self.collectionCellArrayModel objectAtIndex:indexPath.row];
        customCell.titleCollectionLabel.text = model.category_name;
        [customCell.imageView sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"1" ofType:nil]]];

    }else{
        customCell.imageView.image = [UIImage imageNamed:@"gengduo1"];
        customCell.titleCollectionLabel.text = @"更多";
        

    }
            return customCell;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
