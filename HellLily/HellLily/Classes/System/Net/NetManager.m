//
//  NetManager.m
//  HellCook
//
//  Created by panda on 3/29/13.
//  Copyright (c) 2013 panda. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager
@synthesize reqOpMgr,host;

+ (id)sharedInstance
{
    DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
        return [[self alloc] init];
    });
}

- (id)init{
    if(self=[super init])
    {
        [self InitMgrs];
    }
    return self;
}

- (void)InitMgrs
{
    NSURL *baseURL = [NSURL URLWithString:@"http://bbs.nju.edu.cn/"];
    reqOpMgr = [[AFHTTPRequestOperationManager alloc] initWithBaseURL: baseURL];
}

@end
