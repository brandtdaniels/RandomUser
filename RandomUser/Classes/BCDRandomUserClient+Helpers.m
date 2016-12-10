//
//  BCDRandomUserClient+Helpers.m
//  Pods
//
//  Created by Brandt Daniels on 12/9/16.
//
//

#import "BCDRandomUserClient+Helpers.h"
#import "BCDBaseObject.h"

@implementation BCDRandomUserClient (Helpers)

#pragma mark - Error Handlers

- (NSError *)errorFromResponseObject:(id)responseObject {
    
    if (![responseObject isKindOfClass:[NSDictionary class]]) //If response is not a dictionary, something went wrong
        return [NSError errorWithDomain:@"BCDRandomUserClientErrorDomain" code:2 userInfo:nil];
    
    NSDictionary *responseDict = (NSDictionary *)responseObject;
    NSNumber *subcode = responseDict[@"code"];
    NSString *message = responseDict[@"message"];
    
    if (subcode != nil) {
        return [NSError errorWithDomain:@"BCDRandomUserClientErrorDomain" code:subcode userInfo:@{@"message": message}];
    }
    else {
        return nil;
    }
}

- (NSError *)errorFromResponseObject:(id)responseObject task:(NSURLSessionTask *)sessionTask {
    
    if (![responseObject isKindOfClass:NSDictionary.class]) {
        return [NSError errorWithDomain:@"BCDRandomUserClientErrorDomain" code:2 userInfo:nil];
    }
    
    NSDictionary *responseDict = (NSDictionary *)responseObject;
    NSNumber *subcode = responseDict[@"code"];
    NSString *message = responseDict[@"message"];
    
    if ( subcode != nil) {
        
        NSInteger errorCode = 999;//UnknownError;
        if ([sessionTask.response isKindOfClass:[NSHTTPURLResponse class]]) {
            errorCode = [(NSHTTPURLResponse *)sessionTask.response statusCode];
        }
        
        return [NSError errorWithDomain:@"BCDRandomUserClientErrorDomain" code:subcode userInfo:@{@"message": message}];
    }
    else {
        return nil;
    }
}

- (NSError *)errorFromResponseError:(NSError *)responseError {
    
    if (!responseError)
        return nil;
    
    if ([responseError.domain isEqual:NSURLErrorDomain]) {
        return [self errorFromNSURLDomainError:responseError];
    } else {
        return [NSError errorWithDomain:@"BCDRandomUserClientErrorDomain" code:999 userInfo:nil]; //Placeholder
    }
}

- (NSError *)errorFromResponseError:(NSError *)responseError orResponseObject:(id)responseObject task:(NSURLSessionTask *)task {
    
    NSError *error = nil;
    if (responseError) {
        error = [self errorFromResponseError:responseError];
        return error;
    }
    
    if (responseObject) {
        error = [self errorFromResponseObject:responseObject task:task];
    }
    
    return error;
}

- (NSError *)errorFromNSURLDomainError:(NSError *)urlDomainError
{
    NSError *error = nil;
    
    switch (urlDomainError.code) {
        case NSURLErrorCannotFindHost:
        case kCFURLErrorCannotConnectToHost:
        case kCFURLErrorNetworkConnectionLost:
        case kCFURLErrorDNSLookupFailed:
        case kCFURLErrorNotConnectedToInternet:
            error = [NSError errorWithDomain:@"BCDRandomUserClientErrorDomain" code:1 userInfo:nil];
            break;
        default:
            error = [NSError errorWithDomain:@"BCDRandomUserClientErrorDomain" code:999 userInfo:nil];
            break;
    }
    
    return error;
}

#pragma mark - Result Handlers

- (NSArray *)handleGetCollectionResponse:(id)responseObject task:(NSURLSessionDataTask *)task responseError:(NSError *)responseError modelObjectArrayJSONKey:(NSString *)jsonKey modelObjectClass:(Class)class error:(out NSError **)error {
    
    *error = [self errorFromResponseError:responseError orResponseObject:responseObject task:task];
    if (*error) {
        return nil;
    }
    
    NSDictionary *responseDict = (NSDictionary *)responseObject;
    NSArray *responseModelArray = responseDict[jsonKey];
    
    return [self handleGetCollectionResponse:responseModelArray task:task responseError:responseError modelObjectClass:class error:error];
    
}

- (NSArray *)handleGetCollectionResponse:(id)responseObject task:(NSURLSessionDataTask *)task responseError:(NSError *)responseError modelObjectClass:(Class)class error:(out NSError **)error {
    
    //TODO: Handle error for array. Currently this method only accepts a dictionary.
    *error = [self errorFromResponseError:responseError orResponseObject:nil task:task];
    if (*error) {
        return nil;
    }
    
    NSArray *responseModelArray = (NSArray *)responseObject;
    NSError *deserializationError = nil;
    
    NSArray *returnObjects = [MTLJSONAdapter modelsOfClass:class fromJSONArray:responseModelArray error:&deserializationError];
    
    if (deserializationError) {
        *error = [NSError errorWithDomain:@"BCDRandomUserClientErrorDomain" code:999 userInfo:nil];
        return nil;
    }
    else {
        return returnObjects;
    }
    
}

@end
