//
//  AppDelegate.m
//  WTEmptyProject
//
//  Created by 计恩良 on 2018/5/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "AppDelegate.h"
#import "WTTranslateViewController.h"
#import "WTDeviceViewController.h"
#import "WTUserCenterViewController.h"
#import "WTLoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];    
    
    //读取登录信息
    [WTLoginInfo readLoginInfo];
    //进入app
    [self initRoot];
    return YES;
}

- (void)initRoot {
    if ([WTLoginInfo isLogin]) {
        WTTabBarItem *itIndex = [[WTTabBarItem alloc] init];
        itIndex.titleText = [[WTLanguageUtil shareInstance] valueForKey:@"translate_title"];
        itIndex.normalImage = @"tabbar_translate";
        itIndex.selectImage = @"tabbar_translate_highlighted";
        itIndex.vc = [[WTTranslateViewController alloc] init];
        
        WTTabBarItem *itCenter = [[WTTabBarItem alloc] init];
        itCenter.titleText = [[WTLanguageUtil shareInstance] valueForKey:@"device_title"];
        itCenter.normalImage = @"tabbar_application";
        itCenter.selectImage = @"tabbar_profile_highlighted";
        itCenter.vc = [[WTDeviceViewController alloc] init];
        
        WTTabBarItem *itMine = [[WTTabBarItem alloc] init];
        itMine.titleText = [[WTLanguageUtil shareInstance] valueForKey:@"user_title"];
        itMine.normalImage = @"tabbar_profile";
        itMine.selectImage = @"tabbar_profile_highlighted";
        itMine.vc = [[WTUserCenterViewController alloc] init];
        
        WTTabbarController *tab = [[WTTabbarController alloc] init];
        tab.itemsArray = [NSArray arrayWithObjects:itIndex,itCenter,itMine, nil];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tab];
        nav.navigationBarHidden = YES;
        self.window.rootViewController = nav;
        [self.window makeKeyAndVisible];
    } else {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[WTLoginViewController alloc] init]];
        nav.navigationBarHidden = YES;
        self.window.rootViewController = nav;
        [self.window makeKeyAndVisible];
    }
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
