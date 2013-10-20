//
//  User.m
//  HellLily
//
//  Created by panda on 10/19/13.
//  Copyright (c) 2013 panda. All rights reserved.
//

#import "User.h"
#import "GCDSingleton.h"


@implementation User
@synthesize ttd;

+ (id)sharedInstance
{
  DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
    return [[self alloc] init];
  });
}

- (id)init
{
  if(self=[super init]){
    ttd = [[TopTenData alloc]init];
  }
  return self;
}

@end
