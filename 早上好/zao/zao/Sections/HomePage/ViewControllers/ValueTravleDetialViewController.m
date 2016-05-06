//
//  ValueTravleDetialViewController.m
//  ProjectArchitecture_26
//
//  Created by lanouhn on 15-8-1.
//  Copyright (c) 2015年 苏江涛. All rights reserved.
//

#import "ValueTravleDetialViewController.h"
#import "ValuetrivelModel.h"
#import "WaterF.h"
#import "NetWorkRequset.h"
#import "UIImageView+WebCache.h"
#import "SizeMacros.h"
#import "LastBuyInterFaceViewController.h"
#import "GiFHUD.h"
@interface ValueTravleDetialViewController ()<netWorkRequsetDelegate,WaterFDelegate>
@property (nonatomic,retain)NSMutableArray *dataSoucesArray;
@property (nonatomic,retain)NSMutableArray *picArr;
@property (nonatomic,retain) WaterF* waterfall;
@property (nonatomic,retain) NSMutableArray* texts;
@end

@implementation ValueTravleDetialViewController
-(NSMutableArray *)dataSoucesArray{
    if (_dataSoucesArray == nil) {
        self.dataSoucesArray = [NSMutableArray array];
    }
    return _dataSoucesArray;
}
-(NSMutableArray *)picArr{
    if (_picArr == nil) {
        self.picArr = [NSMutableArray array];
    }
    return _picArr;
}
-(NSMutableArray *)texts{
    if (_texts == nil) {
        self.texts = [NSMutableArray array];
    }
    return _texts;
}

-(void)dealloc{
    [_waterfall release];
    [_texts release];
    [_picArr release];
  

    [_receiveWapUrlString release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [GiFHUD setGifWithImageName:@"pika.gif"];
    [GiFHUD show];
    
    self.navigationItem.title = @"值得逛";
     self.view.backgroundColor = [UIColor whiteColor];
    [NetWorkRequset shareNetWorkRequset].delegate = self;
    [NetWorkRequset getNetRequset:@"http://m.api.zhe800.com/v2/guang/deals?tag_url=-1&image_type=all&image_model=webp&page=1&per_page=20"];
    
    WaterFLayout* flowLayout = [[WaterFLayout alloc]init];
    self.waterfall = [[WaterF alloc]initWithCollectionViewLayout:flowLayout];
    self.waterfall.delegate = self;
    self.waterfall.collectionView.backgroundColor = [UIColor colorWithRed:194/256.0 green:203/256.0 blue:249/256.0 alpha:0.4];
    self.waterfall.imagesArr = self.picArr;
    self.waterfall.textsArr = self.texts;
  self.waterfall.sectionNum = 1;
    self.waterfall.imagewidth = kScreenWidth/2-20;
    [self.view addSubview:self.waterfall.view];

    // Do any additional setup after loading the view.
}
-(void)pushToTheBuyDetialIn:(NSIndexPath *)indexPath{
    LastBuyInterFaceViewController *last = [[LastBuyInterFaceViewController alloc]init];
    ValuetrivelModel *model = [self.dataSoucesArray objectAtIndex:indexPath.row];
    
    last.receScholl = model.pic_height;
    
    [self.navigationController pushViewController:last animated:YES];
    [last release];
}
-(void)conllectionViewReload:(id)data{
    dispatch_queue_t queue = dispatch_queue_create(nil, DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
  
        NSDictionary *dic = data;
        NSArray *arr = [dic objectForKey:@"objects"];
        for (id object in arr) {
            ValuetrivelModel *model = [[ValuetrivelModel alloc]initWithDictionary:object];
            [self.dataSoucesArray addObject:model];
            NSString *str = [NSString stringWithFormat:@"%@",model.recommend_reason];
            
            [self.texts addObject:str];
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.imageUrl]]];
            if (image) {
                [self.picArr addObject:image];
            }
            
            [model release];
        }
              dispatch_async(dispatch_get_main_queue(), ^{
          [self.waterfall.collectionView reloadData];
            [GiFHUD dismiss];

        });
        
    });

    dispatch_release(queue);
  
}


- (void)viewDidDisappear:(BOOL)animated
{
    [GiFHUD dismiss];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSoucesArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
       return nil;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
