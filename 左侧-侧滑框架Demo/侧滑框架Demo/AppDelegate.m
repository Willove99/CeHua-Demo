//
//  AppDelegate.m
//  侧滑框架Demo
//
//  Created by 王惠平 on 2017/6/29.
//  Copyright © 2017年 will wang. All rights reserved.
//

#import "AppDelegate.h"
#import "VVSliderController.h"
#import "VVOneViewController.h"
#import "VVTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    //1.创建UIwindow
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    
    //2.创建tabBarVC
    VVTabBarController *tabBarVc = [[VVTabBarController alloc]init];
    VVOneViewController *leftVc = [[VVOneViewController alloc] init];
    
    VVSliderController *sliderVc = [[VVSliderController alloc] initWithLeftViewController:leftVc withRightViewController:tabBarVc];
    
    //3.设置rootVc
    _window.rootViewController = sliderVc;
    
    //4.设置主窗口并显示
    [_window makeKeyAndVisible];
    
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
