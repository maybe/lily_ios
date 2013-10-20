//
//  CommonDef.h
//  HellLily
//
//  Created by panda on 10/20/13.
//  Copyright (c) 2013 VeryPanda. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SendNotification(notify, obj) [[NSNotificationCenter defaultCenter] postNotificationName:notify object: obj]


typedef enum {
    RNT_TopTen = 0,
} RequestNetType;

