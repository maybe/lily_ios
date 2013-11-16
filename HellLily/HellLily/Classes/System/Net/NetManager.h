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
    AFHTTPSessionManager *sessionMgr;
}

@property (strong, nonatomic) AFHTTPSessionManager *sessionMgr;

+ (id)sharedInstance;
- (id)init;
- (void)InitMgr;

- (void)requestURL:(NSString*)aUrl parameters:(NSDictionary*)dic withType:(RequestNetType)type;

@end
