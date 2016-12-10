//
//  BCDUserPicture.m
//  Pods
//
//  Created by Brandt Daniels on 12/9/16.
//
//

#import "BCDUserPicture.h"

@implementation BCDUserPicture

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{@"thumbnailURL": @"thumbnail",
             @"mediumURL": @"medium",
             @"largeURL": @"large"};
    
}

+ (NSValueTransformer *)thumbnailURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)mediumURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)largeURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
