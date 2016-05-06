//
//  DropDownTable.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-5.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol dropDownTableDelegate <NSObject>

-(void)pushToDetialSearchView:(id)data;

@end

@interface DropDownTable : UITableViewController
@property (nonatomic,assign)id<dropDownTableDelegate>delegate;
@property (nonatomic,retain)NSMutableArray *receiveArr;

@end
