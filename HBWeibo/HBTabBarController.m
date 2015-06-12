//
//  HBTabBarController.m
//  HBWeibo
//
//  Created by bottle on 15/6/12.
//  Copyright (c) 2015年 bottle. All rights reserved.
//

#import "HBTabBarController.h"
#import "HBHomeController.h"
#import "HBMessageController.h"
#import "HBDiscoverController.h"
#import "HBMeController.h"
#import "HBTabbar.h"

@interface HBTabBarController ()
//@property (nonatomic,weak) HBTabbar *customTabar;
@end

@implementation HBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabbar];
    [self setupViewControllers];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    for (UIView *view in self.tabBar.subviews) {
        if ([view isKindOfClass:[UIControl class]]) {
            [view removeFromSuperview];
        }
    }
}

- (void)setupTabbar {
    HBTabbar *tabbar = [[HBTabbar alloc] init];
    tabbar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:tabbar];
}

- (void)setupViewControllers
{
    HBTabbar *tabar =  (HBTabbar *)self.tabBar.subviews[0];
    //home
    HBHomeController *home = [[HBHomeController alloc] init];
    home.title = @"首页";
    home.tabBarItem.image = [UIImage imageNamed:@"tabbar_home_os7"];
    home.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_home_selected_os7"];
    [self addChildViewController:[[UINavigationController alloc] initWithRootViewController:home]];
    [tabar addButtonWithItem:home.tabBarItem];
    //message
    HBMessageController *message = [[HBMessageController alloc] init];
    message.title = @"消息";
    [self addChildViewController:[[UINavigationController alloc] initWithRootViewController:message]];
    [tabar addButtonWithItem:message.tabBarItem];
    //discover
    HBDiscoverController *discover = [[HBDiscoverController alloc] init];
    discover.title = @"发现";
    [self addChildViewController:[[UINavigationController alloc] initWithRootViewController:discover]];
    [tabar addButtonWithItem:discover.tabBarItem];
    //Me
    HBMeController *me = [[HBMeController alloc] init];
    me.title = @"我";
    [self addChildViewController:[[UINavigationController alloc] initWithRootViewController:me]];
    [tabar addButtonWithItem:me.tabBarItem];
}




@end
