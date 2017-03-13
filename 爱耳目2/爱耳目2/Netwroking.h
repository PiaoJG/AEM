//
//  Netwroking.h
//  映客直播
//
//  Created by Peter on 17/2/11.
//  Copyright © 2017年 Peter. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock) (id block);
typedef void(^FailureBlock) (id block);

@interface Netwroking : NSObject<NSURLSessionDelegate>
+ (instancetype)shareInstance;
- (void)requestWithURL:(NSString *)url params:(NSDictionary *)params successBlock:(SuccessBlock)success failure:(FailureBlock)failure;
@end
