//
//  NetManager.m
//  HellCook
//
//  Created by panda on 3/29/13.
//  Copyright (c) 2013 panda. All rights reserved.
//

#import "NetManager.h"
#import "StringUtil.h"
#import "RegexKitLite.h"
#import "User.h"

@implementation NetManager
@synthesize sessionMgr,host;

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
    sessionMgr = [[AFHTTPSessionManager alloc] initWithBaseURL: baseURL];
    sessionMgr.responseSerializer = [AFHTTPResponseSerializer serializer];
}

- (void)requestURL:(NSString*)aUrl parameters:(NSDictionary*)dic withType:(RequestNetType)type
{
    [sessionMgr GET:aUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSString *responseString = nil;
        // parse to gb18030
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingGB_18030_2000);
        responseString=[[NSString alloc]initWithData:responseObject encoding:enc];
        // parse again
        if (!responseString) {
            NSData* responseData = [StringUtil cleanGBK:responseObject];
            responseString=[[NSString alloc]initWithData:responseData encoding:enc];
        }
        // handle response
        if (responseString) {
            [self handleResponse:responseString withType:type];
            // NSLog(@"Response: %@", responseString);
        }
    } failure:^(NSURLSessionDataTask *task, id responseObject) {
        // TODO:
    }];
}

- (void)handleResponse:(NSString*)responseString withType:(RequestNetType)type
{
    switch (type) {
        case RNT_TopTen:
            {
                [self handleTopTenResponse:responseString withType:type];
            }
            break;
        default:
            break;
    }
}

- (void)handleTopTenResponse:(NSString*)responseString withType:(RequestNetType)type
{
    NSString* resWithoutN = [responseString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    NSString* regEx = @"<tr bgcolor=#(.+?)><td>第 (\\w+) 名<td><a href=bbsdoc\\?board=(.+?)>(.+?)</a><td><a href=\"(.+?)\">(.+?)</a><td><a href=(.+?)>\\s*(.+?)</a><td>(\\w+)";
    NSArray* ttArray = [resWithoutN componentsMatchedByRegex:regEx];
    
    User* user = [User sharedInstance];
    [user.ttd.titleList removeAllObjects];
    
    for (int i = 0; i < ttArray.count; i++) {
        ArticleTitle *articleTitle = [[ArticleTitle alloc]init];
        NSString* ttString = [ttArray objectAtIndex:i];
        NSString* titleStr = [ttString stringByMatching:regEx capture:6L];
        articleTitle.title = [StringUtil unescape:titleStr];
        articleTitle.author = [ttString stringByMatching:regEx capture:8L];
        articleTitle.board = [ttString stringByMatching:regEx capture:4L];
        articleTitle.url = [ttString stringByMatching:regEx capture:5L];
        [user.ttd.titleList addObject:articleTitle];
    }
    
    NSString* notifName = [NSString stringWithFormat:@"NetCB%d", type];
    SendNotification(notifName, nil);
}

@end
