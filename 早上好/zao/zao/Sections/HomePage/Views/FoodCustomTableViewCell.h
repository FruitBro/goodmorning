//
//  FoodCustomTableViewCell.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-2.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NetWorkRequset.h"

@protocol FoodCustomTableViewCellDelegate <NSObject>

-(void)passValueArray:(id)data;

@end
@interface FoodCustomTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,netWorkRequsetDelegate>
@property (nonatomic,retain)UICollectionView *foodCollectionView;
@property (nonatomic,retain)UICollectionViewFlowLayout *foodCollectionViewLayout;
@property (nonatomic,retain)NSMutableArray *foodDataArray;
@property (nonatomic,assign)id<FoodCustomTableViewCellDelegate>delegate;
@end
