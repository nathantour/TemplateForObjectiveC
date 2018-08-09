//
//  UIViewController+XZTopmostViewController.m
//  XZTemplateForObjectiveC
//
//  Created by Nathan on 2018/8/9.
//  Copyright © 2018年 XiongZi. All rights reserved.
//

#import "UIViewController+XZTopmostViewController.h"

@implementation UIViewController (XZTopmostViewController)

//获取当前屏幕显示的viewcontroller
- (UIViewController *)topmostViewController
{
    UIViewController *viewController = self;
    
    UIViewController *controller = [self topmostViewControllerFromViewController:viewController];
    
    return controller;
}

- (UIViewController *)topmostViewControllerFromViewController:(UIViewController *)viewController
{
    UIViewController *topmostViewController;
    
    if ([viewController presentedViewController]) {
        // 视图是被presented出来的
        viewController = [viewController presentedViewController];
    }
    
    if ([viewController isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        topmostViewController = [self topmostViewControllerFromViewController:[(UITabBarController *)viewController selectedViewController]];
    } else if ([viewController isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        topmostViewController = [self topmostViewControllerFromViewController:[(UINavigationController *)viewController visibleViewController]];
    } else {
        // 根视图为非导航类
        topmostViewController = viewController;
    }
    
    return topmostViewController;
}

@end
