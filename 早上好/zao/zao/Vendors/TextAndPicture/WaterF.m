//
//  WaterF.m
//  CollectionView
//
//  Created by d2space on 14-2-21.
//  Copyright (c) 2014年 D2space. All rights reserved.
//

#import "WaterF.h"
//#import "WaterFLayout.h"
#import "WaterFCell.h"



@interface WaterF ()

@property (nonatomic, strong) WaterFCell* cell;
@end

@implementation WaterF

- (id)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithCollectionViewLayout:layout];
    if (self)
    {
        [self.collectionView registerClass:[WaterFCell class] forCellWithReuseIdentifier:@"cell"];
          }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.buttons = [[NSMutableArray alloc]initWithCapacity:15];
    self.buttonStates = [[NSMutableArray alloc]initWithCapacity:15];
}

#pragma mark UICollectionViewDataSource
//required
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.sectionNum;
}

/* For now, we won't return any sections */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.imagesArr.count;
  
   
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* identifier = @"cell";
    self.cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    CGFloat aFloat = 0;
    UIImage* image = self.imagesArr[indexPath.item];
    aFloat = self.imagewidth/image.size.width;
    self.cell.imageView.frame = CGRectMake(0, 0, self.imagewidth,  image.size.height*aFloat) ;
   
    [self getTextViewHeight:indexPath];
    self.cell.textView.frame = CGRectMake(0, image.size.height*aFloat+2, self.imagewidth, self.textViewHeight+10);

    self.cell.imageView.image = image;
    self.cell.textView.text = self.textsArr[indexPath.item];

    return self.cell;
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
#pragma mark - UICollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(pushToTheBuyDetialIn:)]) {
        [self.delegate pushToTheBuyDetialIn:indexPath];
    }

}
#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat aFloat = 0;
    UIImage* image = self.imagesArr[indexPath.item];
    aFloat = self.imagewidth/image.size.width;
     CGSize size = CGSizeMake(0,0);
    [self getTextViewHeight:indexPath];
     size = CGSizeMake(self.imagewidth, image.size.height*aFloat+self.textViewHeight);
    return size;
}

- (CGFloat)getTextViewHeight:(NSIndexPath*)indexPath
{
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:self.textsArr[indexPath.item]];
    UITextView* textViewTemple = [[UITextView alloc]init];
    textViewTemple.attributedText = attrStr;
    textViewTemple.text = self.textsArr[indexPath.item];
    NSRange range = NSMakeRange(0, attrStr.length);
    NSDictionary *dic = [attrStr attributesAtIndex:0 effectiveRange:&range];   // 获取该段attributedString的属性字典
    // 计算文本的大小  ios7.0
    CGSize textSize = [textViewTemple.text boundingRectWithSize:CGSizeMake(self.imagewidth, MAXFLOAT) // 用于计算文本绘制时占据的矩形块
                                                        options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading // 文本绘制时的附加选项
                                                     attributes:dic        // 文字的属性
                                                        context:nil].size;
    self.textViewHeight = textSize.height;
    return self.textViewHeight;
}

#pragma mark ADD Header AND Footer
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForFooterInSection:(NSInteger)section
{
    return 40;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
