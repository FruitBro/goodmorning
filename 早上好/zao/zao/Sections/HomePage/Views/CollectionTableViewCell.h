//
//  CollectionTableViewCell.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-29.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetWorkRequset.h"
#import "CollectionModel.h"
@protocol collectionTableViewCellDelegate <NSObject>

-(void)pushtoCollectionDetialControll:(CollectionModel *)model;

@end

@interface CollectionTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,netWorkRequsetDelegate>
@property (nonatomic,retain)UICollectionView *conllection;
@property (nonatomic,retain)UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,retain)NSMutableArray *collectionCellArrayModel;
@property (nonatomic,retain)NSMutableDictionary *collectionCellDicModel;
@property (nonatomic,assign)id<collectionTableViewCellDelegate>delegate;


@end
