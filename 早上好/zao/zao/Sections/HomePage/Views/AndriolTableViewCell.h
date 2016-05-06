//
//  AndriolTableViewCell.h
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-2.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SizeMacros.h"
@interface AndriolTableViewCell : UITableViewCell
@property (nonatomic,retain)UIImageView *picImage;
@property (nonatomic,retain)UILabel *titLabel;
@property (nonatomic,retain)UILabel *priceLabel;
@property (nonatomic,retain)UILabel *originalPriceLable;
@property (nonatomic,retain)UILabel *EmallLabel;
@property (nonatomic,retain)UILabel *saledLabel;
@end
