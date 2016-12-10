//
//  BCDUserAddress.h
//  Pods
//
//  Created by Brandt Daniels on 12/10/16.
//
//

#import <Mantle/Mantle.h>

@interface BCDUserAddress : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly) NSString *street;
@property (nonatomic, readonly) NSString *city;
@property (nonatomic, readonly) NSString *state;
@property (nonatomic, readonly) id postCode;

@end
