//
//  SecondViewController.m
//  HellLily
//
//  Created by panda on 10/17/13.
//  Copyright (c) 2013 panda. All rights reserved.
//

#import "SecondViewController.h"
#import "RootNaviController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Second Controller";
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:(RootNaviController *)self.navigationController
                                                                            action:@selector(showMenu)];
}

@end
