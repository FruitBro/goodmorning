//
//  WaterF.h
//  CollectionView
//
//  Created by d2space on 14-2-21.
//  Copyright (c) 2014年 D2space. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WaterFLayout.h"

@protocol WaterFDelegate <NSObject>

-(void)pushToTheBuyDetialIn:(NSIndexPath *)indexPath;

@end

@interface WaterF : UICollectionViewController 
@property (nonatomic,weak)id<WaterFDelegate>delegate;
@property (nonatomic,strong) NSArray* imagesArr;
@property (nonatomic,strong) NSArray* textsArr;
@property (nonatomic,assign) NSInteger sectionNum;
@property (nonatomic) NSInteger imagewidth;
@property (nonatomic) CGFloat textViewHeight;
@property (nonatomic,strong) NSMutableArray* buttons;
@property (nonatomic,strong) NSMutableArray* buttonStates;

@end
