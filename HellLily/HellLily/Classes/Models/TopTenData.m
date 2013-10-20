//
//  TopTenData.m
//  HellLily
//
//  Created by panda on 10/20/13.
//  Copyright (c) 2013 VeryPanda. All rights reserved.
//

#import "TopTenData.h"

@implementation TopTenData
@synthesize titleList;

- (id)init
{
    if(self=[super init]){
        titleList = [[NSMutableArray alloc]init];
    }
    return self;
}

@end
