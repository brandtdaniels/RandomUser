//
//  BCDRandomUserClient+Helpers.h
//  Pods
//
//  Created by Brandt Daniels on 12/9/16.
//
//

#import "BCDRandomUserClient.h"

@interface BCDRandomUserClient (Helpers)

/**
 @param responseObject Must be a dictionary.
 */
- (NSError *)errorFromResponseObject:(id)responseObject;

/**
 @param responseObject Must be a dictionary.
 */
- (NSError *)errorFromResponseObject:(id)responseObject task:(NSURLSessionTask *)sessionTask;

- (NSError *)errorFromResponseError:(NSError *)responseError;

- (NSArray *)handleGetCollectionResponse:(id)responseObject task:(NSURLSessionDataTask *)task responseError:(NSError *)responseError modelObjectArrayJSONKey:(NSString *)jsonKey modelObjectClass:(Class)class error:(out NSError **)error;

- (NSArray *)handleGetCollectionResponse:(id)responseObject task:(NSURLSessionDataTask *)task responseError:(NSError *)responseError modelObjectClass:(Class)class error:(out NSError **)error;

@end
