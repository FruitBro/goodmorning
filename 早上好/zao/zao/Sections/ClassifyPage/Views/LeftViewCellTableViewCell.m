//
//  LeftViewCellTableViewCell.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15/8/1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "LeftViewCellTableViewCell.h"
#import "SizeMacros.h"
@implementation LeftViewCellTableViewCell
- (void)dealloc{
    [_leftLabel release];
    [_leftLabel release];
    [super dealloc];
}


//
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        self.leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/37.5, 0, kScreenWidth/3.75, kScreenHeight/15.159)];
        //self.leftLabel.backgroundColor = [UIColor orangeColor];
        self.leftLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:self.leftLabel];
        [self.leftLabel release];
        self.lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/75, kScreenHeight/15.159)];
        [self.contentView addSubview:self.lineLabel];
        [self.lineLabel release];
        
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
