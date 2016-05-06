//
//  ChatListViewController.m
//  zao
//
//  Created by 好望角mac on 16/3/10.
//  Copyright © 2016年 张世斌. All rights reserved.
//

#import "ChatListViewController.h"

@interface ChatListViewController ()

@end

@implementation ChatListViewController

- (id)init
{
    self = [super init];
    if (self) {
        [self setDisplayConversationTypeArray:@[@(ConversationType_PRIVATE),@(ConversationType_GROUP),@(ConversationType_DISCUSSION)]];//私聊 群组 讨论组
        //聚合形式 有很多的私聊组
        [self setCollectionConversationType:@[@(ConversationType_PRIVATE),@(ConversationType_DISCUSSION)]];
        
    }
    return  self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),@(ConversationType_DISCUSSION),@(ConversationType_CHATROOM),@(ConversationType_GROUP),@(ConversationType_APPSERVICE),@(ConversationType_SYSTEM)]];
    [self setCollectionConversationType:@[@(ConversationType_DISCUSSION),@(ConversationType_GROUP)]];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath{
//    if (conversationModelType == RC_CONVERSATION_MODEL_TYPE_COLLECTION) {
//        ChatListViewController *temp = [[ChatListViewController alloc]init];
//        NSArray *array = [NSArray arrayWithObject:[NSNumber numberWithInt:model.conversationModelType]];
//        [temp setDisplayConversationTypes:array];
//        [temp setCollectionConversationType:nil];
//        temp.isEnteredToCollectionViewController = YES;
//        [self.navigationController pushViewController:temp animated:YES];
//    }else if (model.conversationType == ConversationType_PRIVATE){
    
        RCConversationViewController *VC = [[RCConversationViewController alloc]init];
        VC.conversationType = model.conversationType;
        VC.targetId = model.targetId;
        VC.title = @"Test2";
        [self.navigationController pushViewController:VC animated:YES];
//    }
    
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
