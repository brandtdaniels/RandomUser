//
//  BCDRandomUserClient+Users.m
//  Pods
//
//  Created by Brandt Daniels on 12/9/16.
//
//

#import "BCDRandomUserClient+Users.h"
#import "BCDRandomUserClient+Helpers.h"
#import "BCDConstants.h"
#import "BCDUser.h"

@implementation BCDRandomUserClient (Users)

- (NSURLSessionTask *)getUsersWithSuccess:(void(^)(NSArray *))success failure:(void(^)(NSError *))failure {
    
    return [self GET:FILTERED_PATH(@"", BCDRandomUserAPIOneHundredResultsFilter) success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSError *restError = nil;
        NSArray *users = [self handleGetCollectionResponse:responseObject task:task responseError:nil modelObjectArrayJSONKey:BCDRandomUserAPIResultsKey modelObjectClass:BCDUser.class error:&restError];
        
        if (restError) {
            if (failure) {
                failure(restError);
            }
        } else {
            if (success) {
                success(users);
            }
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSError *restError = nil;
        [self handleGetCollectionResponse:nil task:task responseError:error modelObjectArrayJSONKey:nil modelObjectClass:nil error:&restError];
        
        if (failure) {
            failure(restError);
        }
    }];
    
}

@end
