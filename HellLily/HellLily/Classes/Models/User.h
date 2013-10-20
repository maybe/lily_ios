//
//  User.h
//  HellLily
//
//  Created by panda on 10/17/13.
//  Copyright (c) 2013 panda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TopTenData.h"

@interface User : NSObject
{
  TopTenData* ttd;
}

@property (nonatomic, retain)TopTenData* ttd;;

+ (id)sharedInstance;
- (id)init;

@end
