//
//  AppDelegate.m
//  TabBarSplitViewControllerDemo-ObjC
//
//  Created by Denken on 3/1/16.
//  Copyright © 2016 iNDIEVOX. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "TabBarSplitViewController/TabBarSplitViewController-Swift.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    UITabBarItem *tab1 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:0];
    UIViewController *vc1 = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    vc1.tabBarItem = tab1;
    UITabBarItem *tab2 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:1];
    UIViewController *vc2 = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    vc2.tabBarItem = tab2;
    UITabBarItem *tab3 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:2];
    UIViewController *vc3 = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    vc3.tabBarItem = tab3;

    TabBarSplitViewController *tabBarSplitViewController = [[TabBarSplitViewController alloc] initWithTabBarViewControllers:@[vc1, vc2, vc3] detailClassGeneral:[DetailViewController class] detailClassEmpty:[EmptyDetailViewController class]];
    
    // setting up UIWindow
    if SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"9.0"){
        self.window = [[UIWindow alloc] init];
    } else {
        self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    }
    self.window.rootViewController = tabBarSplitViewController;
    [self.window makeKeyAndVisible];

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
}

@end
