//
//  BCDRandomUserClient+Users.h
//  Pods
//
//  Created by Brandt Daniels on 12/9/16.
//
//

#import "BCDRandomUserClient.h"

@interface BCDRandomUserClient (Users)

/**
 
 Fetches a list of random users.
 
 @param success Success block to be called upon completion. Parameter to block is an array of BCDRandomUser
 @param failure Failure block to be called upon error. Paramter is an NSError containing the error encountered
 
 @return The NSURLSessionTask performing the request.
 
*/
- (NSURLSessionTask *)getUsersWithSuccess:(void(^)(NSArray *))success failure:(void(^)(NSError *))failure;

@end
