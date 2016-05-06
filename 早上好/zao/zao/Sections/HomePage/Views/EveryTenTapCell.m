//
//  EveryTenTapCell.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "EveryTenTapCell.h"
#import "SizeMacros.h"
@implementation EveryTenTapCell
-(void)dealloc{
    [_tapTiLabel release];
    [_tapImageViewShow release];
    [super dealloc];
}
-(UIImageView *)tapImageViewShow{
    if (_tapImageViewShow == nil) {
        self.tapImageViewShow = [[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/32*9)]autorelease];
    }
    return _tapImageViewShow;
}
-(UILabel *)tapTiLabel{
    if (_tapTiLabel == nil) {
        self.tapTiLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, kScreenHeight/32*9, kScreenWidth, kScreenHeight/8*3-kScreenHeight/32*9)];
    }
    return _tapTiLabel;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.tapImageViewShow];
        [self.contentView addSubview:self.tapTiLabel];
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
