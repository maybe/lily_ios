//
//  TopTenController.h
//  HellLily
//
//  Created by panda on 10/20/13.
//  Copyright (c) 2013 VeryPanda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopTenController : UITableViewController
{
    NSMutableArray* contentArray;
}

- (void)grabURLInBackground;

@end
