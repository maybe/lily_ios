//
//  StringUtil.h
//  LilyBBS
//
//  Created by panda on 11-12-20.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringUtil : NSObject

+ (NSData *)cleanGBK:(NSData *)data;

+ (NSInteger)countUTF8String:(NSString*)str;

+ (NSInteger)getUTF8Length:(NSString*)str ByLimit:(NSInteger)limit;

+ (NSString*)cleanColor:(NSString*)str;

+ (NSString*) unescape:(NSString*)string;

+ (NSString*) cleanColorTag:(NSString*)string;
 

@end
