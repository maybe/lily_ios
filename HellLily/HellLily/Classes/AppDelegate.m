//
//  AppDelegate.m
//  HellLily
//
//  Created by panda on 10/17/13.
//  Copyright (c) 2013 VeryPanda. All rights reserved.
//

#import "AppDelegate.h"
#import "TopTenController.h"
#import "MenuController.h"
#import "RootNaviController.h"
#import "TopNaviController.h"
#import "UINavigationController+Autorotate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Create content and menu controllers
    RootNaviController *navigationController = [[RootNaviController alloc] initWithRootViewController:[[TopTenController alloc] init]];
    MenuController *menuController = [[MenuController alloc] initWithStyle:UITableViewStylePlain];
    
    // Create frosted view controller
    REFrostedViewController *frostedViewController = [[REFrostedViewController alloc] initWithContentViewController:navigationController menuViewController:menuController];
    frostedViewController.direction = REFrostedViewControllerDirectionRight;
    frostedViewController.liveBlurBackgroundStyle = REFrostedViewControllerLiveBackgroundStyleLight;
    frostedViewController.animationDuration = 0.22;
    frostedViewController.limitMenuViewSize = true;
    
    // create top navigation controller
    TopNaviController *topNaviController = [[TopNaviController alloc] initWithRootViewController:frostedViewController];
    
    // Make it a root controller
    //
    self.window.rootViewController = topNaviController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
