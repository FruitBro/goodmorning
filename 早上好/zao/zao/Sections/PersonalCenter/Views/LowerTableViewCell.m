//
//  LowerTableViewCell.m
//  ProjectArchitecture_26
//
//  Created by 刘俊峰Leo on 15-8-3.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "LowerTableViewCell.h"
#import "SizeMacros.h"
@implementation LowerTableViewCell
- (void)dealloc{
    [_cellLabel release];
    [_rightLabel release];
    [_clickImageView release];
    [super dealloc];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        ;
        for (int i = 0; i < 5; i++) {
            self.cellLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/4.68, 5, kScreenWidth/2.8, kScreenWidth/10)]autorelease];
            [self.contentView addSubview:self.cellLabel];
            self.rightLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth-kScreenWidth/7.5-kScreenWidth/7, kScreenWidth/26.5, kScreenWidth/6, kScreenWidth/18)]autorelease];
            self.rightLabel.textColor = [UIColor whiteColor];
            self.rightLabel.adjustsFontSizeToFitWidth = YES;
            [self.contentView addSubview:self.rightLabel];
            self.clickImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth-kScreenWidth/14, kScreenWidth/29, kScreenWidth/25, kScreenWidth/15)]autorelease];
            self.clickImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"click" ofType:@"png"]];
            [self.contentView addSubview:self.clickImageView];
            
                    }

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
