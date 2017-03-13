//
//  Netwroking.m
//  映客直播
//
//  Created by Peter on 17/2/11.
//  Copyright © 2017年 Peter. All rights reserved.
//

#import "Netwroking.h"

static Netwroking *reuqest;

@implementation Netwroking
{
    SuccessBlock sucblock;
    FailureBlock faiBlock;
    NSMutableData *_allData;
}
+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        reuqest = [[Netwroking alloc] init];
    });
    return reuqest;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (!reuqest) {
        reuqest = [super allocWithZone:zone];
    }
    return reuqest;
}

- (id)copy
{
    return reuqest;
}
- (void)requestWithURL:(NSString *)url params:(NSDictionary *)params successBlock:(SuccessBlock)success failure:(FailureBlock)failure
{
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15];
    
    
    NSURLSessionDownloadTask *downLoad =[[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]] downloadTaskWithRequest:myRequest];
    
    // 开始请求
    [downLoad resume];
    
    sucblock = success;
    faiBlock = failure;
    
}
// 请求完成
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location
{
    NSData *data = [NSData dataWithContentsOfURL:location];
    id reuslt = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    sucblock(reuslt);
}
// 网络请求进度
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    
}
@end
