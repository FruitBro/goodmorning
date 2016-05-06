//
//  UIViewTableViewCell.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-29.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol UIViewTableViewCellDelegate <NSObject>

-(void)reloadTableUIView:(id)value;
-(void)pushToNextInterFace:(NSMutableString *)string :(NSIndexPath *)indexPath;

@end

@interface UIViewTableViewCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,retain)UICollectionViewFlowLayout *UIViewCollectionViewLayout;
@property (nonatomic,retain)UICollectionView *UIViewCollectionView;
@property (nonatomic,assign)id<UIViewTableViewCellDelegate>delegate;
@end
