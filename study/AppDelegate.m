//
//  AppDelegate.m
//  study
//
//  Created by Sam Liu on 2016/11/2.
//  Copyright © 2016年 Sam Liu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MLNavigationController.h"
#import <SDWebImageManager.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[SDWebImageManager sharedManager].imageDownloader setValue: nil forHTTPHeaderField:@"Accept"];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *VC = [[ViewController alloc]init];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];//返回字体颜色
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];//标题颜色
    
    //    [[UINavigationBar appearance] setTranslucent:YES];
    //    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationBarBg"] forBarMetrics:UIBarMetricsDefault];
    
    //    [[UINavigationBar appearance] setBackgroundColor:[UIColor colorWithRed:0.478 green:0.020 blue:0.039 alpha:1]];
    //    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlackOpaque];
    //UInavigationBar背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.86 green:0.23 blue:0.22 alpha:1]];
    
    //    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"navigationBarBg"]];
    
    //设置UINavigationBar的字体已经字体颜色
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIFont fontWithName:@"FZQingKeBenYueSongS-R-GB" size:16.0f],NSFontAttributeName,
                                                          [UIColor whiteColor],NSForegroundColorAttributeName ,
                                                          
                                                          nil]];
    MLNavigationController *nvc = [[MLNavigationController alloc]initWithRootViewController:VC];
    self.window.rootViewController = nvc;
    [self.window makeKeyAndVisible];
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
