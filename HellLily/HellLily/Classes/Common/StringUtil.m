//
//  StringUtil.m
//  LilyBBS
//
//  Created by panda on 11-12-20.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "StringUtil.h"
#import "iconv.h"
#import "RegexKitLite.h"

@implementation StringUtil

+(NSData *)cleanGBK:(NSData *)data {
  iconv_t cd = iconv_open("GBK", "GBK"); // convert to UTF-8 from UTF-8
  int one = 1;
  iconvctl(cd, ICONV_SET_DISCARD_ILSEQ, &one); // discard invalid characters
  
  size_t inbytesleft, outbytesleft;
  inbytesleft = outbytesleft = data.length;
  char *inbuf  = (char *)data.bytes;
  char *outbuf = (char*)malloc(sizeof(char) * data.length);
  char *outptr = outbuf;
  if (iconv(cd, &inbuf, &inbytesleft, &outptr, &outbytesleft)
      == (size_t)-1) {
    NSLog(@"this should not happen, seriously");
    return nil;
  }
  NSData *result = [NSData dataWithBytes:outbuf length:data.length - outbytesleft];
  iconv_close(cd);
  free(outbuf);
  return result;
}

+ (NSInteger) countUTF8String:(NSString*)str
{
  int count = 0;
  if (str) {
    for (int i = 0; i<str.length; i++) {
      NSString* regEx = @"^[^x00-xff]$";
      if ([[str substringWithRange:NSMakeRange(i, 1)] stringByMatching:regEx]) {
        count = count +2;
      }
      else
        count++;
    }
  }
  return count;
}

+ (NSInteger) getUTF8Length:(NSString*)str ByLimit:(NSInteger)limit
{
  int result = [StringUtil countUTF8String:str];
  if (result<=limit) {
    return str.length;
  
  }else{
  
    int count = 0;
    int i;
    for (i = 0; i<str.length; i++) {
      NSString* regEx = @"^[^x00-xff]$";
      if ([[str substringWithRange:NSMakeRange(i, 1)] stringByMatching:regEx]) {
        count = count + 2;
      }
      else
        count++;
      if (count>limit) {
        break;
      }
    }
    result = i-1;
    return result;
  }
}

+(NSString *)cleanColor:(NSString *)str
{
  while ([str stringByMatching:@"(\\[(1;(\\w+))*m)(.+?)(\\[(1;\\w+)*m)*"]) {
    NSString* colorStr2 = [str stringByMatching:@"(\\[(1;(\\w+))*m)(.+?)(\\[(1;\\w+)*m)*" capture:1L];
    NSString* colorStr3 = [str stringByMatching:@"(\\[(1;(\\w+))*m)(.+?)(\\[(1;\\w+)*m)*" capture:4L];
    
    NSString* str1 = [NSString stringWithFormat:@"%@%@",colorStr2,colorStr3];
    NSString* str2 = [NSString stringWithFormat:@"<span style='color=#33a0a6;'>%@</span>",colorStr3];  
    
    str = [str stringByReplacingOccurrencesOfString:str1 withString:str2];
  }
  return str;
}

+(NSString*) unescape:(NSString*)string 
{ 
  string = [string stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"]; 
  string = [string stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"]; 
  string = [string stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""]; 
  string = [string stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"]; 
  string = [string stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"]; 
  string = [string stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];   
  return string; 
} 

+ (NSString*) cleanColorTag:(NSString*)string
{
  string = [string stringByReplacingOccurrencesOfRegex:@"\\[(.+?)*m" withString:@""]; 
//  string = [string stringByReplacingOccurrencesOfRegex:@"()*\\[((\\w+;)*(\\w+))*m" withString:@""]; 

  string = [string stringByReplacingOccurrencesOfRegex:@"\\[I" withString:@""]; 

  return string;
}



@end
