//
//  ViewController.m
//  TabBarSplitViewControllerDemo-ObjC
//
//  Created by Denken on 3/1/16.
//  Copyright © 2016 iNDIEVOX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSInteger tag = self.navigationController.tabBarItem.tag;
    switch (tag) {
        case 0:
            self.title = @"Featured";
            break;
        case 1:
            self.title = @"Search";
            break;
        case 2:
            self.title = @"Favorites";
            break;
        default:
            break;
    }
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *redButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [redButton setTitle:@"Red" forState:UIControlStateNormal];
    [redButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    redButton.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    [redButton addTarget:self action:@selector(showRed:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *blueButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [blueButton setTitle:@"Blue" forState:UIControlStateNormal];
    [blueButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    blueButton.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    [blueButton addTarget:self action:@selector(showBlue:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *greenButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [greenButton setTitle:@"Green" forState:UIControlStateNormal];
    [greenButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    greenButton.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    [greenButton addTarget:self action:@selector(showGreen:) forControlEvents:UIControlEventTouchUpInside];

    redButton.translatesAutoresizingMaskIntoConstraints = NO;
    blueButton.translatesAutoresizingMaskIntoConstraints = NO;
    greenButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redButton];
    [self.view addSubview:blueButton];
    [self.view addSubview:greenButton];

    NSMutableArray *constraints = [NSMutableArray array];
    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(redButton, blueButton, greenButton);
    [constraints addObjectsFromArray: [NSLayoutConstraint constraintsWithVisualFormat:@"V:[redButton]-30-[blueButton]-30-[greenButton]"
                                                                              options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:viewsDict]];
    [constraints addObjectsFromArray: [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[redButton]|"
                                                                              options:NSLayoutFormatAlignAllTop metrics:nil views:viewsDict]];
    [constraints addObjectsFromArray: [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[blueButton]|"
                                                                              options:NSLayoutFormatAlignAllTop metrics:nil views:viewsDict]];
    [constraints addObjectsFromArray: [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[greenButton]|"
                                                                              options:NSLayoutFormatAlignAllTop metrics:nil views:viewsDict]];
    [constraints addObject: [NSLayoutConstraint constraintWithItem:blueButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [NSLayoutConstraint activateConstraints:constraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Actions

- (void)showRed:(UIButton*)sender {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor colorWithRed:1.0 green:0 blue:0 alpha:1.0];
    [self showViewController:vc sender:self];
}

- (void)showBlue:(UIButton*)sender {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1.0 alpha:0.5];
    [self showDetailViewController:vc sender:self];
}

- (void)showGreen:(UIButton*)sender {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor colorWithRed:0 green:1.0 blue:0 alpha:0.5];
    [self showDetailViewController:vc sender:self];
}

@end


@implementation EmptyDetailViewController

- (void)loadView {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor darkGrayColor];

    UILabel *label = [[UILabel alloc] init];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.text = NSLocalizedString(@"not selected", comment: @"not selected");
    label.textColor = [UIColor colorWithWhite:1.0 alpha:0.4];
    label.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    [view addSubview:label];

    NSLayoutConstraint *xConstraint = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *yConstraint = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [NSLayoutConstraint activateConstraints:@[xConstraint, yConstraint]];

    self.view = view;
}

@end