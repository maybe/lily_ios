//
//  NetManager.h
//  HellLily
//
//  Created by panda on 10/18/13.
//  Copyright (c) 2013 panda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "GCDSingleton.h"

@interface NetManager : NSObject
{
    AFHTTPRequestOperationManager *reqOpMgr;
    NSString* host;
}

@property (strong, nonatomic) AFHTTPRequestOperationManager *reqOpMgr;
@property (strong, nonatomic) NSString* host;


+ (id)sharedInstance;
- (id)init;
- (void)InitMgrs;

@end
