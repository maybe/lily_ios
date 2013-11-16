//
//  Common.m
//  HellLily
//
//  Created by panda on 10/19/13.
//  Copyright (c) 2013 panda. All rights reserved.
//

#import "Common.h"

@implementation Common

+ (NSString *)dataFilePath:(NSString*)filePath {
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *documentsDirectory = [paths objectAtIndex:0];
  return [documentsDirectory stringByAppendingPathComponent:filePath];
}

#pragma mark - Load Image

+(void)loadPhotoFromURL:(NSURL*)imgURL thumbnail:(BOOL)useThumbnail showIn:(UIImageView*)imView{
  
  if (imgURL!=nil) {
    ALAssetsLibraryAssetForURLResultBlock resultBlock = ^(ALAsset *myasset){
      CGImageRef iref;
      if (useThumbnail) {
        iref = [myasset thumbnail];
      }else {
        ALAssetRepresentation *rep = [myasset defaultRepresentation];
        iref = [rep fullScreenImage];
      }
      
      if (iref) {
        UIImage *resPhoto = [UIImage imageWithCGImage:iref];
        //NSLog(@"photo size:%f x %f",resPhoto.size.width,resPhoto.size.height);
        imView.image = resPhoto;
      }
    };//end result block
    
    ALAssetsLibraryAccessFailureBlock failureBlock = ^(NSError *error){
      NSLog(@"error....");
    };//end failureBlock
    
    ALAssetsLibrary *assetLib = [[ALAssetsLibrary alloc] init];
    
    [assetLib assetForURL:imgURL
              resultBlock:resultBlock
             failureBlock:(ALAssetsLibraryAccessFailureBlock)failureBlock];
    
  }//end if
  
}//end function


+ (void)dumpView:(UIView *)aView atIndent:(int)indent into:(NSMutableString *)outString
{
  for (int i = 0; i < indent; i++) [outString appendString:@"--"];
  [outString appendFormat:@"[%2d] %@ (x:%.1f,y:%.1f,width:%.1f,height:%.1f)\n", indent, [[aView class] description], aView.frame.origin.x, aView.frame.origin.y, aView.frame.size.width, aView.frame.size.height];
  for (UIView *view in [aView subviews])
    [self dumpView:view atIndent:indent + 1 into:outString];
}

// Start the tree recursion at level 0 with the root view
+ (NSString *) displayViews: (UIView *) aView
{
  NSMutableString *outString = [[NSMutableString alloc] init];
  [outString appendString:@"\n"];
  [self dumpView: aView atIndent:0 into:outString];
  return outString;
}
@end
