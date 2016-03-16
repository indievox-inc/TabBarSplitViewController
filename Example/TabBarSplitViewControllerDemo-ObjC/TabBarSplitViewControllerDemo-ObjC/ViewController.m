//
//  ViewController.m
//  TabBarSplitViewControllerDemo-ObjC
//
//  Created by Denken on 3/1/16.
//  Copyright © 2016 iNDIEVOX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) BOOL secondaryWithNav;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER;
@end

@implementation ViewController

- (instancetype)initWithSecondaryWithNav:(BOOL)secondaryWithNav {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.secondaryWithNav = secondaryWithNav;
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSInteger tag = self.navigationController.tabBarItem.tag;
    switch (tag) {
        case 1:
            self.title = @"Featured";
            break;
        case 2:
            self.title = @"Search";
            break;
        case 3:
            self.title = @"Favorites";
            break;
        default:
            break;
    }
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *redButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [redButton setTitle:@"Red (showViewController)" forState:UIControlStateNormal];
    [redButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    redButton.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    [redButton addTarget:self action:@selector(showRed:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *blueButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [blueButton setTitle:@"Blue (showDetailViewController)" forState:UIControlStateNormal];
    [blueButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    blueButton.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    [blueButton addTarget:self action:@selector(showBlue:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *greenButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [greenButton setTitle:@"Green (showDetailViewController)" forState:UIControlStateNormal];
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
    UIViewController *vc = [[ViewController alloc] init];
    vc.title = @"Red";
    vc.view.backgroundColor = [UIColor colorWithRed:0.5 green:0 blue:0 alpha:1.0];
    [self showViewController:vc sender:self];
}

- (void)showBlue:(UIButton*)sender {
    UIViewController *vc = [[DetailViewController alloc] init];
    vc.title = @"Blue";
    vc.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0.5 alpha:1.0];
    if (self.secondaryWithNav) {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [self showDetailViewController:nav sender:self];
    } else {
        [self showDetailViewController:vc sender:self];
    }
}

- (void)showGreen:(UIButton*)sender {
    UIViewController *vc = [[DetailViewController alloc] init];
    vc.title = @"Green";
    vc.view.backgroundColor = [UIColor colorWithRed:0 green:0.5 blue:0 alpha:1.0];
    if (self.secondaryWithNav) {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [self showDetailViewController:nav sender:self];
    } else {
        [self showDetailViewController:vc sender:self];
    }
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

@implementation DetailViewController

@end