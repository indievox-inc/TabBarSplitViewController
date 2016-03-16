//
//  AppDelegate.swift
//  TabBarSplitViewControllerDemo
//
//  Created by Denken on 2/23/16.
//  Copyright © 2016 iNDIEVOX. All rights reserved.
//

import UIKit
import TabBarSplitViewController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.

        let secondaryWithNav = false

        let tab1 = UITabBarItem(tabBarSystemItem: .Featured, tag: 1)
        let vc1 = UINavigationController(rootViewController: ViewController(secondaryWithNav: secondaryWithNav))
        vc1.tabBarItem = tab1

        let tab2 = UITabBarItem(tabBarSystemItem: .Search, tag: 2)
        let vc2 = UINavigationController(rootViewController: ViewController(secondaryWithNav: secondaryWithNav))
        vc2.tabBarItem = tab2

        let tab3 = UITabBarItem(tabBarSystemItem: .Favorites, tag: 3)
        let vc3 = UINavigationController(rootViewController: ViewController(secondaryWithNav: secondaryWithNav))
        vc3.tabBarItem = tab3

        let tabBarSplitViewController = TabBarSplitViewController(primaryViewControllers: [vc1, vc2, vc3], SecondaryViewControllerConfiguration: (DetailViewController.self, secondaryWithNav, EmptyDetailViewController.self))

        // setting up UIWindow
        let window : UIWindow
        if #available(iOS 9, *) {
            window = UIWindow()     // because of iPad iOS 9 multitasking
        } else {
            window = UIWindow(frame: UIScreen.mainScreen().bounds)
        }
        window.rootViewController = tabBarSplitViewController
        window.makeKeyAndVisible()
        self.window = window

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

