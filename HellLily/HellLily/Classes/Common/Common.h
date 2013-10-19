//
//  Common.h
//  HellLily
//
//  Created by panda on 10/19/13.
//  Copyright (c) 2013 panda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

// define some macros
#ifndef __has_feature
#define __has_feature(x) 0
#endif
#ifndef __has_extension
#define __has_extension __has_feature // Compatibility with pre-3.0 compilers.
#endif

#ifndef HLRSLog
#if DEBUG
# define HCRSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt),__PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define HCRSLog(fmt, ...)
#endif
#endif

#define HLSystemVersionGreaterOrEqualThan(version) ([[[UIDevice currentDevice] systemVersion] floatValue] >= version)

#define isRetina4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define isIOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#define _screenHeight [[UIScreen mainScreen] bounds].size.height
#define _screenWidth [[UIScreen mainScreen] bounds].size.width
#define _stateBarHeight 20
#define _navigationBarHeight 44
#define _tabBarHeight 49
#define _screenHeight_NoStBar (_screenHeight - _stateBarHeight)
#define _screenHeight_NoStBar_NoNavBar (_screenHeight - _stateBarHeight - _navigationBarHeight)
#define _screenHeight_NoStBar_NoNavBar_NoTabBar (_screenHeight - _stateBarHeight - _navigationBarHeight - _tabBarHeight)

#define _offset 40
#define _sideWindowWidth (_screenWidth - _offset)

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

typedef void (^ALAssetsLibraryAssetForURLResultBlock)(ALAsset *myasset);
typedef void (^ALAssetsLibraryAccessFailureBlock)(NSError *error);

@interface Common : NSObject

+ (NSString *)dataFilePath:(NSString*)filePath;
+(void)loadPhotoFromURL:(NSURL*)imgURL thumbnail:(BOOL)useThumbnail showIn:(UIImageView*)imView;
+ (NSString *) displayViews: (UIView *) aView;
+ (void)dumpView:(UIView *)aView atIndent:(int)indent into:(NSMutableString *)outString;

@end
