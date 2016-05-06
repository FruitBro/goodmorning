//
//  ValueTrivelCollectionViewCell.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-3.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "ValueTrivelCollectionViewCell.h"

@implementation ValueTrivelCollectionViewCell
-(void)dealloc{
    [_valueImage release];
}
-(UIImageView *)valueImage{
    if (_valueImage == nil) {
        self.valueImage = [[[UIImageView alloc]initWithFrame:self.contentView.frame]autorelease];
    }
    return _valueImage;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.valueImage];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.valueImage.frame = self.contentView.frame;
}

@end
