//
//  BCDRandomUserClient.m
//  Pods
//
//  Created by Brandt Daniels on 12/9/16.
//
//

#import "BCDRandomUserClient.h"
#import "AFNetworking.h"
#import "Mantle.h"
#import "BCDBaseObject.h"

NSString *const BCDRandomUserAPIURLPath = @"/api/";
NSString *const BCDRandomUserOrigin = @"https://randomuser.me";

#pragma mark -

@interface BCDRandomUserClient ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

#pragma mark -

@implementation BCDRandomUserClient

+ (instancetype)randomUserClient {
    
    BCDRandomUserClient *userClient = [[self.class alloc] init];
    
    return userClient;
    
}

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        [self configureSessionManager];
        
    }
    
    return self;
    
}

- (void)configureSessionManager {
    
    self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:self.APIURL];
    self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    self.sessionManager.responseSerializer.acceptableStatusCodes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(200, 304)];
}

// Should be in separate configuration class

- (NSURL *)baseURL {
    return [NSURL URLWithString:BCDRandomUserOrigin];
}

- (NSURL *)APIURL {
    return [NSURL URLWithString:BCDRandomUserAPIURLPath relativeToURL:self.baseURL];
}

@end

#pragma mark - Requests

@implementation BCDRandomUserClient (Requests)

- (NSURLSessionTask *)GET:(NSString *)URLString
                  success:(void(^)( NSURLSessionDataTask *task, id responseObject))success
                  failure:(void(^)( NSURLSessionDataTask *task, NSError *error ))failure
{
    return [self GET:URLString parameters:nil success:success failure:failure];
}

- (NSURLSessionTask *)GET:(NSString *)URLString
               parameters:(id)parameters
                  success:(void(^)( NSURLSessionDataTask *task, id responseObject))success
                  failure:(void(^)( NSURLSessionDataTask *task, NSError *error ))failure
{
    return [self.sessionManager GET:URLString parameters:parameters progress:nil success:success failure:failure];
}

@end
