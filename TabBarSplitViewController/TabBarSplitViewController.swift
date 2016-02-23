//
//  TabBarSplitViewController.swift
//  iNDIEPASS
//
//  Created by Denken on 6/29/15.
//  Copyright (c) 2015 iNDIEVOX. All rights reserved.
//

// This class handles everything about UISplitViewController and corresponding size class collapsing/expanding.

import UIKit

@available(iOS 8.0, *)
public class TabBarSplitViewController: UISplitViewController {

    public let masterTabBarController = UITabBarController()
    public var DetailViewControllerType : (General: UIViewController.Type, Empty: UIViewController.Type) = (UIViewController.self, UIViewController.self)

    public init(tabBarViewControllers: [UIViewController]?, detailViewControllerType: (General: UIViewController.Type, Empty: UIViewController.Type)) {
        self.DetailViewControllerType = detailViewControllerType
        super.init(nibName: nil, bundle: nil)

        masterTabBarController.viewControllers = tabBarViewControllers
        let detailViewController = detailViewControllerType.Empty.init()
        viewControllers = [masterTabBarController, detailViewController]
        preferredDisplayMode = .AllVisible
        delegate = self
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UISplitViewControllerDelegate
extension TabBarSplitViewController: UISplitViewControllerDelegate {

    // MARK: to Compact Width size class (collapse)
    public func primaryViewControllerForCollapsingSplitViewController(splitViewController: UISplitViewController) -> UIViewController? {
        if let primaryTabViewController = splitViewController.viewControllers[0] as? UITabBarController,
               primaryNavViewController = primaryTabViewController.selectedViewController as? UINavigationController {
                let secondaryViewController = splitViewController.viewControllers[1]
                if !(secondaryViewController.dynamicType === DetailViewControllerType.Empty) {
                    dispatch_async(dispatch_get_main_queue()) {     // otherwise we get console error "<Error>: CGImageCreate: invalid image size: 0 x 0."
                        primaryNavViewController.showViewController(secondaryViewController, sender: secondaryViewController)
                    }
                    return primaryTabViewController
                }
        }

        return nil
    }

    public func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
        return true
    }

    // MARK: to Regular Width size class (separate/expand)

    public func splitViewController(splitViewController: UISplitViewController, separateSecondaryViewControllerFromPrimaryViewController primaryViewController: UIViewController) -> UIViewController? {
        if let primaryTabViewController = splitViewController.viewControllers[0] as? UITabBarController,
               primaryNavViewController = primaryTabViewController.selectedViewController as? UINavigationController {
                let primaryTopViewController = primaryNavViewController.topViewController
                if let primaryTopViewController = primaryTopViewController {
                    if ((primaryTopViewController.dynamicType === DetailViewControllerType.General)
                     || (primaryTopViewController.dynamicType === DetailViewControllerType.Empty)) {
                        primaryNavViewController.popViewControllerAnimated(false)
                        return primaryTopViewController
                    }
                }
        }

        return DetailViewControllerType.Empty.init()
    }

    public func primaryViewControllerForExpandingSplitViewController(splitViewController: UISplitViewController) -> UIViewController? {
        if let primaryTabViewController = splitViewController.viewControllers[0] as? UITabBarController {
            return primaryTabViewController
        }

        return nil
    }

    // MARK: override showDetailViewController
    public func splitViewController(splitViewController: UISplitViewController, showDetailViewController vc: UIViewController, sender: AnyObject?) -> Bool {
        let isCompactWidth = (splitViewController.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.Compact)
        if isCompactWidth {
            if let primaryTabViewController = splitViewController.viewControllers[0] as? UITabBarController,
                      primaryViewController = primaryTabViewController.selectedViewController as? UINavigationController {
                        primaryViewController.showViewController(vc, sender: sender)
                        return true
            }
        }

        return false
    }
}