# TabBarSplitViewController

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Adaptive UISplitViewController that works with UITabBarController as primary view controller.

![TabBarSplitViewController Example screenshot in iPad](https://cloud.githubusercontent.com/assets/2727287/13274879/efb9f8f2-dae9-11e5-8510-f683d4381fe0.PNG)
![TabBarSplitViewController Example screenshot in iPhone 6 Plus simulator](https://cloud.githubusercontent.com/assets/2727287/13249103/3bc6a4ee-da5d-11e5-8d41-567a0946e29e.PNG)

(Not what you're looking for? You may be looking for another UI structure: [daveanderson/TabsAndSplits](https://github.com/daveanderson/TabsAndSplits))

If you're using UITabBarController/UINavigationController as rootViewController to build an iPhone-only app, there's NO REASON NOT TO BE AN UNIVERSAL APP ANYMORE!

Fully compatible with iOS 9 iPad multitasking (Slide Over/Split View)!

## Introduction

UISplitViewController (master-detail interface) becomes universal for both iPad and iPhone, with introduction of size classes in iOS 8. However, UISplitViewController default behavior (without implementing UISplitViewControllerDelegate) is limited:

|  | TabBarSplitViewController | UISplitViewController |
| --- | --- | --- |
| Primary use `UITabBarController` | YES (optional) | No (UINavigationController suggested) |
| Secondary use `UINavigationController` | YES (optional) | No |
| Secondary empty state | YES (Customizable) | No (should start with nil) |


## Requirements

iOS 8 or later.

## Add to Your Project

### Cocoapods

### Carthage

#### Cartfile
```
github "indievox-inc/TabBarSplitViewController"
```

Follow instructions on [Carthage](https://github.com/Carthage/Carthage).

### Git Submodule

Add as submodule and clone:
```
git submodule add https://github.com/indievox-inc/TabBarSplitViewController
```
Then manually add to your project, as follows:

### Manually

#### Dependency Project

1. Drag TabBarSplitViewController.xcodeproj into your project.
2. Project settings - Targets - General - Embedded Binaries: add TabBarSplitViewController.frameworkiOS

#### Source Code

Or just drag TabBarSplitViewController.swift into your project.

## How to Use

### Import TabBarSplitViewController Framework

For Swift projects, `import TabBarSplitViewController` before using it. See [Example](https://github.com/indievox-inc/TabBarSplitViewController/tree/master/Example/TabBarSplitViewControllerDemo).

For Objective-C projects, `#import "TabBarSplitViewController/TabBarSplitViewController-Swift.h"` before using it, and change project settings - Targets - Build Settings - `Embedded Content Contains Swift Code` to `YES`. See [Example-ObjC](https://github.com/indievox-inc/TabBarSplitViewController/tree/master/Example/TabBarSplitViewControllerDemo-ObjC) (`carthage update` before running it).

### Init TabBarSplitViewController

Set it as windows's rootViewController.

All view controllers of the tabBarViewController should be UINavigationController, with respective view controller of each tab as its rootViewController.

### Test Your Navigation Flow

Always simplify or design your navigation flow logic with caution!

In primary view controller, `showViewController` (push to primary) / `showDetailViewController` (push to secondary) are preferred rather than the old `pushViewController`.

Further reading: [WWDC 2014 Session 216: Building Adaptive Apps with UIKit](https://developer.apple.com/videos/play/wwdc2014/216) for knowledge of implementation details.

## Afterword

This project powers [LiVE EVIL](https://itunes.apple.com/app/id1075717681?mt=8) app of iNDIEVOX Inc., and is planned to be maintained with the latest Swift and Xcode version.

If you prefer Objective-C to avoid dependency hell of fast-moving Swift version (See: [Is It Time for Swift?](https://realm.io/news/ben-sandofsky-time-for-swift)), or if you're using customized view for tab bar, port the source code and build your own should be easy now.

There are one UI logic flaw in this UI structure, though not a big concern:

* `showDetailViewController` of view controller inside tab #1 in regular size class, tap tab #2, and then changed to compact size class will collapse the secondary and push the view controller of tab #1 onto tab #2.

## Licenses

All source code is licensed under the MIT License. See [LICENSE](https://github.com/indievox-inc/TabBarSplitViewController/blob/master/LICENSE).
