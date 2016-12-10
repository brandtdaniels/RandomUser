//
//  BCDUserAddress.m
//  Pods
//
//  Created by Brandt Daniels on 12/10/16.
//
//

#import "BCDUserAddress.h"

@implementation BCDUserAddress

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{@"street": @"street",
             @"city": @"city",
             @"state": @"state",
             @"postCode": @"postcode"};
    
}

@end
