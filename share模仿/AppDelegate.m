//
//  AppDelegate.m
//  share模仿
//
//  Created by 开朗的男子 on 2018/7/27.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "AppDelegate.h"
#import "Begin.h"
#import "Login.h"
#import "VCFirst.h"
#import "VCSecond.h"
#import "VCThird.h"
#import "VCFouth.h"
#import "VCFifth.h"
#import "LunBo.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window makeKeyAndVisible];
    _tbController = [UITabBarController new];
    Login * login = [Login new];
    
    //添加视图
    VCFirst * vcFirst = [VCFirst new];
    vcFirst.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
    VCSecond * vcSecond = [VCSecond new];
    vcSecond.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
    VCThird * vcThird = [VCThird new];
    vcThird.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
    VCFouth * vcFouth = [VCFouth new];
    vcFouth.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
    VCFifth * vcFifth = [VCFifth new];
    vcFifth.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
    
    
    //分栏元素的设置
    UITabBarItem * tabBarItem1 = [UITabBarItem new];
    tabBarItem1.selectedImage = [[UIImage imageNamed:@"radio_button1_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem1.image = [[UIImage imageNamed:@"radio_button1_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController * nav1 = [[UINavigationController alloc] initWithRootViewController:vcFirst];
    vcFirst.title = @"SHARE";
    nav1.navigationBar.barTintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [nav1.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //nav1.navigationBar.tintColor = [UIColor redColor];
    
    
    UITabBarItem * tabBarItem2 = [UITabBarItem new];
    tabBarItem2.selectedImage = [[UIImage imageNamed:@"search_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem2.image = [[UIImage imageNamed:@"search"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController * nav2 = [[UINavigationController alloc] initWithRootViewController:vcSecond];
    vcSecond.title = @"搜索🔍";
    nav2.navigationBar.barTintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [nav2.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UITabBarItem * tabBarItem3 = [UITabBarItem new];
    tabBarItem3.selectedImage = [[UIImage imageNamed:@"xiugai_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem3.image = [[UIImage imageNamed:@"xiugai"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController * nav3 = [[UINavigationController alloc] initWithRootViewController:vcThird];
    vcThird.title = @"文章";
    nav3.navigationBar.barTintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [nav3.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UITabBarItem * tabBarItem4 = [UITabBarItem new];
    tabBarItem4.selectedImage = [[UIImage imageNamed:@"jiangbei_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem4.image = [[UIImage imageNamed:@"jiangbei"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController * nav4 = [[UINavigationController alloc] initWithRootViewController:vcFouth];
    vcFouth.title = @"活动";
    nav4.navigationBar.barTintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [nav4.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UITabBarItem * tabBarItem5 = [UITabBarItem new];
    tabBarItem5.selectedImage = [[UIImage imageNamed:@"touxiang_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem5.image = [[UIImage imageNamed:@"touxiang"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController * nav5 = [[UINavigationController alloc] initWithRootViewController:vcFifth];
    vcFifth.title = @"个人信息";
    nav5.navigationBar.barTintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [nav5.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    vcFirst.tabBarItem = tabBarItem1;
    vcSecond.tabBarItem = tabBarItem2;
    vcThird.tabBarItem = tabBarItem3;
    vcFouth.tabBarItem = tabBarItem4;
    vcFifth.tabBarItem = tabBarItem5;
    
    //分栏的添加
    _pageTable = [NSArray arrayWithObjects:nav1, nav2, nav3, nav4, nav5, nil];
    _tbController.viewControllers = _pageTable;
    //self.window.rootViewController = _tbController;
    self.window.rootViewController = login;
  
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}



- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
