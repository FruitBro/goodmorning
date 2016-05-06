//
//  ChatTestViewController.m
//  zao
//
//  Created by 好望角mac on 16/3/9.
//  Copyright © 2016年 张世斌. All rights reserved.
//

#import "ChatTestViewController.h"

@interface ChatTestViewController ()

@end

@implementation ChatTestViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.conversationMessageCollectionView.backgroundColor = [UIColor clearColor];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"屏幕快照 2016-03-03 下午5.07.45"]];
    
    
    //设置需要显示哪些类的会话
    [self setDisplayConversationTypeArray:@[@(ConversationType_PRIVATE),@(ConversationType_DISCUSSION),@(ConversationType_CHATROOM),@(ConversationType_GROUP),@(ConversationType_APPSERVICE),@(ConversationType_SYSTEM)]];
   
    
    
    //设置需要将哪些类型的会话列表中聚合显示
//    [self setConversationType:@[@(ConversationType_DISCUSSION),@(ConversationType_GROUP)]];
    
//    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 30)];
//    [leftButton setTitle:@"单聊" forState:UIControlStateNormal];
//    [leftButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    [leftButton addTarget:self action:@selector(gotoConversatinView) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
//    self.navigationItem.leftBarButtonItem = leftBtn;
   
    
    
    
    
//    //新建一个聊天会话对象
//    RCConversationViewController *chat = [[RCConversationViewController alloc]init];
//    //设置会话的类型（单聊）
//    chat.conversationType = ConversationType_PRIVATE;
//    //设置会话的目标会话ID
//    chat.targetId = @"targetIdYouWillChatIn";
//    //设置聊天会话界面要显示的标题
//    chat.title = @"小陆璐";
//    //显示聊天会话界面
//    [self.navigationController pushViewController:chat animated:YES];
    // Do any additional setup after loading the view.
}
- (void)gotoConversatinView{
    RCConversationViewController *VC = [[RCConversationViewController alloc]initWithConversationType:ConversationType_PRIVATE targetId:@"test2"];
//    ChatTestViewController *VC = [[ChatTestViewController alloc]init];
//    VC.targetId = @"test2";

    
    VC.title = @"Test2";
    [self.navigationController pushViewController:VC animated:YES];
}
//改变字体的颜色
- (void)willDisplayMessageCell:(RCMessageBaseCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    //如果为文本类型的cell，转换cell的颜色为红色
    if ([cell isMemberOfClass:[RCTextMessageCell class]]) {
        RCTextMessageCell *testMsgcell =(RCTextMessageCell *)cell;
        UILabel *textMsgLabel = (UILabel *)testMsgcell.textLabel;
        textMsgLabel.textColor = [UIColor redColor];
    }
}
//会话列表详细页面
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
