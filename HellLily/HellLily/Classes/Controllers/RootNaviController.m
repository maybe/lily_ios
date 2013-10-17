//
//  RootNaviController.m
//  HellLily
//
//  Created by panda on 10/17/13.
//  Copyright (c) 2013 panda. All rights reserved.
//

#import "RootNaviController.h"
#import "MenuController.h"
#import "UIViewController+REFrostedViewController.h"

@interface RootNaviController ()

@property (strong, readwrite, nonatomic) MenuController *menuViewController;

@end

@implementation RootNaviController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showMenu) name:@"ShowSideMenu" object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)showMenu
{
    [self.frostedViewController presentMenuViewController];
}

#pragma mark -
#pragma mark Gesture recognizer

- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
    [self.frostedViewController panGestureRecognized:sender];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([viewController isKindOfClass:[RootNaviController class]])
    {
        [navigationController setNavigationBarHidden:YES animated:animated];
    }
    else
    {
        [navigationController setNavigationBarHidden:NO animated:animated];
    }
}

@end
