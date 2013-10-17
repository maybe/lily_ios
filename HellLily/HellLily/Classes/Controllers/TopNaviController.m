//
//  RootNaviController.m
//  HellLily
//
//  Created by panda on 10/17/13.
//  Copyright (c) 2013 panda. All rights reserved.
//

#import "TopNaviController.h"
#import "UIViewController+REFrostedViewController.h"
#import "REFrostedViewController.h"

@interface TopNaviController ()

@end

@implementation TopNaviController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([viewController isKindOfClass:[REFrostedViewController class]])
    {
        [navigationController setNavigationBarHidden:YES animated:animated];
    }
    else
    {
        [navigationController setNavigationBarHidden:NO animated:animated];
    }
}

@end
