//
//  TopTenData.h
//  HellLily
//
//  Created by panda on 10/20/13.
//  Copyright (c) 2013 VeryPanda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArticleTitle.h"

@interface TopTenData : NSObject
{
    NSMutableArray* titleList;
}

@property (strong, nonatomic) NSMutableArray* titleList;;

@end
