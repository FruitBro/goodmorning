//
//  ListTableViewCell.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-29.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "ListTableViewCell.h"
#import "SizeMacros.h"
@implementation ListTableViewCell
-(void)dealloc{
    [_picImage release];
    [_titLabel release];
    [_priceLabel release];
    [_originalPriceLable release];
    [_EmallLabel release];
    [_saledLabel release];
    [super dealloc];
}
-(UIImageView *)picImage{
    if (_picImage == nil) {
        self.picImage = [[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth/3, kScreenHeight/5)]autorelease];
        self.picImage.backgroundColor = [UIColor magentaColor];
    }
    return [[_picImage retain]autorelease];
}
-(UILabel *)titLabel{
    if (_titLabel == nil) {
        self.titLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/3, 0, kScreenWidth/3*2, kScreenHeight/5/3)]autorelease];
               self.titLabel.adjustsFontSizeToFitWidth = YES;
        self.titLabel.numberOfLines = 0;
    }
    return [[_titLabel retain]autorelease];
}
-(UILabel *)priceLabel{
    if (_priceLabel == nil) {
        self.priceLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/3, kScreenHeight/5/3,kScreenWidth/3*2/8, kScreenHeight/5/3)]autorelease];
        self.priceLabel.adjustsFontSizeToFitWidth = YES;
    }
    return [[_priceLabel retain]autorelease];
}
-(UILabel *)originalPriceLable{
    if (_originalPriceLable == nil) {
        self.originalPriceLable = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/3+kScreenWidth/3*2/8, kScreenHeight/5/3, kScreenWidth/3*2/8, kScreenHeight/5/3)] autorelease];
        self.originalPriceLable.adjustsFontSizeToFitWidth = YES;
    }
    return [[_originalPriceLable retain]autorelease];
}
-(UILabel *)EmallLabel{
    if (_EmallLabel == nil) {
        self.EmallLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/3, kScreenHeight/5/3*2, kScreenWidth/3*2/3, kScreenHeight/5/3)] autorelease];
        self.EmallLabel.textAlignment = NSTextAlignmentCenter;
    }
    return [[_EmallLabel retain]autorelease];
}
-(UILabel *)saledLabel{
    if (_saledLabel == nil) {
        self.saledLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/3+kScreenWidth/3*2/3, kScreenHeight/5/3*2, kScreenWidth/3*2/3, kScreenHeight/5/3)]autorelease];
        self.saledLabel.textAlignment = NSTextAlignmentCenter;
    }
    return [[_saledLabel retain]autorelease];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.picImage];
        [self.contentView addSubview: self.titLabel];
        [self.contentView addSubview: self.priceLabel];
        [self.contentView addSubview:self.originalPriceLable];
        [self.contentView addSubview:self.EmallLabel];
        [self.contentView addSubview:self.saledLabel];
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
