//
//  BCDBaseObject.h
//  Pods
//
//  Created by Brandt Daniels on 12/9/16.
//
//

#import <Mantle/Mantle.h>

@interface BCDBaseObject : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSDate *retrievedAt;

@end
