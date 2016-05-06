//
//  UIViewCollectionViewCell.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-7-31.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "UIViewCollectionViewCell.h"

@implementation UIViewCollectionViewCell
-(void)dealloc{
    [_UIViewButton release];
    [_titleLable release];
    [_contentLabel release];
    [super dealloc];
}
-(UIImageView *)UIViewButton{
    if (_UIViewButton == nil) {
        self.UIViewButton = [[[UIImageView alloc]initWithFrame:CGRectMake(self.contentView.frame.size.width/4, self.contentView.frame.size.height/4+self.contentView.frame.size.height/4/2/2, self.contentView.frame.size.width/2, self.contentView.frame.size.height/2)]autorelease];
                  }
    return _UIViewButton;
}
-(UILabel *)titleLable{
    if (_titleLable == nil) {
        self.titleLable = [[[UILabel alloc]initWithFrame:CGRectMake(0, self.contentView.frame.size.height/4/2/2, self.contentView.frame.size.width, self.contentView.frame.size.height/4/2)]autorelease];
        self.titleLable.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLable;
}
-(UILabel *)contentLabel{
    if (_contentLabel == nil) {
        self.contentLabel = [[[UILabel alloc]initWithFrame:CGRectMake(0, self.contentView.frame.size.height/4/2+self.contentView.frame.size.height/4/2/2, self.contentView.frame.size.width, self.contentView.frame.size.height/4/2)]autorelease];
        self.contentLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _contentLabel;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.titleLable];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.UIViewButton];
    }
    return self;
}
@end
