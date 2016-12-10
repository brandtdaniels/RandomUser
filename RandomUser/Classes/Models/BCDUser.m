//
//  BCDUser.m
//  Pods
//
//  Created by Brandt Daniels on 12/9/16.
//
//

#import "BCDUser.h"

#pragma mark -

@implementation BCDUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return [[super JSONKeyPathsByPropertyKey] mtl_dictionaryByAddingEntriesFromDictionary:@{@"gender": @"gender",
                                                                                            @"name" : @"name",
                                                                                            @"picture" : @"picture",
                                                                                            @"email": @"email",
                                                                                            @"mobilePhone": @"cell",
                                                                                            @"mainPhone": @"phone",
                                                                                            @"birthDate": @"dob",
                                                                                            @"address": @"location"}];
}

+ (NSValueTransformer *)genderJSONTransformer {
    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:@{@"male" : @(BCDGenderTypeMale),
                                                                           @"female" : @(BCDGenderTypeFemale)}
                                                            defaultValue:@(BCDGenderTypeUnknown)
                                                     reverseDefaultValue:nil];
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:BCDUserName.class];
}

+ (NSValueTransformer *)pictureJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:BCDUserPicture.class];
}

+ (NSValueTransformer *)addressJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:BCDUserAddress.class];
}

+ (NSValueTransformer *)birthDateJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter dateFromString:dateString];;
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

#pragma mark - Helpers

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return dateFormatter;
}

@end
