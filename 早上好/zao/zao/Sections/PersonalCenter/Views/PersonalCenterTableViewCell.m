//
//  PersonalCenterTableViewCell.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-3.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "PersonalCenterTableViewCell.h"
#import "SizeMacros.h"
@implementation PersonalCenterTableViewCell
- (void)dealloc{
    [_upperImageCellView release];
    [_loginButton release];
    
    [super dealloc];
}
- (UIImageView *)upperImageCellView{
    if (_upperImageCellView == nil) {
        self.upperImageCellView = [[[UIImageView alloc]initWithFrame:CGRectMake(0, -20, kScreenWidth, kScreenHeight/2.4)]autorelease];
        _upperImageCellView.image = [[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"upperCell" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return [[_upperImageCellView retain]autorelease];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.upperImageCellView];
        
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
