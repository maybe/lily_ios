//
//  ArticleTitle.h
//  HellLily
//
//  Created by panda on 10/17/13.
//  Copyright (c) 2013 panda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticleTitle : NSObject{
  NSString *title;		
  NSString* author;	
  NSString* board;
  NSString *url;
  NSString *number;
  NSString *date;
  NSString* renqi;
}

@property(nonatomic,retain) NSString *title;
@property(nonatomic,retain) NSString *author;
@property(nonatomic,retain) NSString *board;
@property(nonatomic,retain) NSString *url;
@property(nonatomic,retain) NSString *number;
@property(nonatomic,retain) NSString *date;
@property(nonatomic,retain) NSString* renqi;

@end
