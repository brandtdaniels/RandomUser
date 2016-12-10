//
//  BCDUserName.h
//  Pods
//
//  Created by Brandt Daniels on 12/9/16.
//
//

#import <Mantle/Mantle.h>

@interface BCDUserName : MTLModel <MTLJSONSerializing>

/** User's title such as Mr, Mrs, Miss */
@property (nonatomic, readonly) NSString *title;

/** User's first name */
@property (nonatomic, readonly) NSString *first;

/** User's last name */
@property (nonatomic, readonly) NSString *last;

@end
