//
//  ViewController.h
//  TabBarSplitViewControllerDemo-ObjC
//
//  Created by Denken on 3/1/16.
//  Copyright © 2016 iNDIEVOX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (instancetype)initWithSecondaryWithNav:(BOOL)secondaryWithNav NS_DESIGNATED_INITIALIZER;
@end

@interface EmptyDetailViewController : UIViewController
@end

@interface DetailViewController : ViewController
@end