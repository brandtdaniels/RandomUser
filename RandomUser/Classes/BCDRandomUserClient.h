//
//  BCDRandomUserClient.h
//  Pods
//
//  Created by Brandt Daniels on 12/9/16.
//
//

#import <Foundation/Foundation.h>

#pragma mark -

@interface BCDRandomUserClient : NSObject

+ (instancetype)randomUserClient;

@end

#pragma mark - Requests

@interface BCDRandomUserClient (Requests)

- (NSURLSessionTask *)GET:(NSString *)URLString
                  success:(void(^)( NSURLSessionDataTask *task, id responseObject))success
                  failure:(void(^)( NSURLSessionDataTask *task, NSError *error ))failure;

- (NSURLSessionTask *)GET:(NSString *)URLString
               parameters:(id)parameters
                  success:(void(^)( NSURLSessionDataTask *task, id responseObject))success
                  failure:(void(^)( NSURLSessionDataTask *task, NSError *error ))failure;

@end
