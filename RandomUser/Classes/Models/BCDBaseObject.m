//
//  BCDBaseObject.m
//  Pods
//
//  Created by Brandt Daniels on 12/9/16.
//
//

#import "BCDBaseObject.h"

#pragma mark -

@interface BCDBaseObject ()

@property (nonatomic, copy, readwrite) NSDate *retrievedAt;

@end

#pragma mark -

@implementation BCDBaseObject

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing *)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    
    if (self) {
        self.retrievedAt = [NSDate date];
    }
    
    return self;
}

@end
