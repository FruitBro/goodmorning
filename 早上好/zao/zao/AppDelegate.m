//
//  AppDelegate.m
//  zao
//
//  Created by 好望角mac on 16/2/24.
//  Copyright © 2016年 张世斌. All rights reserved.
//

#import "AppDelegate.h"
#import "HomePageTableViewController.h"
#import "ClassifyPageViewController.h"
#import "homeViewController.h"
#import "PersonalCenterViewController.h"
#import "UMSocial.h"
#import "AFNetworking.h"
#import "AFNetworkReachabilityManager.h"
#import <RongIMKit/RongIMKit.h>
#import "ChatViewController.h"
#import "ChatTestViewController.h"
#import "ChatListViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [[RCIM sharedRCIM]initWithAppKey:@"z3v5yqkbvtk20"];
//    //使用token链接
//    [[RCIM sharedRCIM]connectWithToken:@"m0mnsqNq4UGIAyixGfACSQlJDt3fb+92byGABRh2//UX7OPOjM2GXHv66QSmQ9GNuOYSdRJd5FO7y5OeyZXGzz9sMNda1hWi" success:^(NSString *userId) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
////            ChatTestViewController *chatList = [[ChatTestViewController alloc]initWithConversationType:ConversationType_PRIVATE targetId:@"tester2"];
////            UINavigationController *chatNC = [[UINavigationController alloc]initWithRootViewController:chatList];
////            self.window.rootViewController = chatNC;
//            
//            ChatListViewController *vc = [[ChatListViewController alloc]init];
//            UINavigationController *ChatListVC = [[UINavigationController alloc]initWithRootViewController:vc];
//            self.window.rootViewController = ChatListVC;
//            
//        });
//    } error:^(RCConnectErrorCode status) {
//        
//    } tokenIncorrect:^{
//        
//    }];
    
    
    
    
    
    //1.创建主界面上导航视图控制器管理的跟视图控制器
    HomePageTableViewController *homePageVC = [[HomePageTableViewController alloc]init];
    
    //2.创建主界面导航视图控制器对象  用来管理 homePageVC
    UINavigationController *homePageNC = [[UINavigationController alloc]initWithRootViewController:homePageVC];
    
    //3.创建分类界面上导航视图控制器管理根视图控制器
    ClassifyPageViewController *classifyPageVC = [[ClassifyPageViewController alloc]init];
    
    //4.创建分类界面导航视图控制器对象  用来管理 classifyPageVC
    UINavigationController *classifyPageNC = [[UINavigationController alloc]initWithRootViewController:classifyPageVC];
    
    //5.创建品牌团界面上导航视图控制器管理根视图控制器
    homeViewController *brandPageVC = [[homeViewController alloc]init];
    
    //6.创建品牌团界面导航视图控制器对象  用来管理 brandPageVC
    UINavigationController *brandPageNC = [[UINavigationController alloc]initWithRootViewController:brandPageVC];
    
    //7.//创建标签视图控制器对象
    UITabBarController *tabBar = [[UITabBarController alloc]init];
    //创建个人中心根视图控制器对象
//    PersonalCenterViewController *personalCenterVC = [[PersonalCenterViewController alloc]init];
//    UINavigationController *personalCenterNC = [[UINavigationController alloc]initWithRootViewController:personalCenterVC];
    //8.给标签视图控制器添加所管理的视图控制器对象 (导航控制器)
    tabBar.viewControllers = @[homePageNC,classifyPageNC,brandPageNC];
    //9.//给window添加跟视图控制器
    self.window.rootViewController = tabBar;


    

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "---.zao" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"zao" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"zao.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
