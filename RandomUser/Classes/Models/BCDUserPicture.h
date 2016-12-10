//
//  BCDUserPicture.h
//  Pods
//
//  Created by Brandt Daniels on 12/9/16.
//
//

#import <Mantle/Mantle.h>

@interface BCDUserPicture : MTLModel <MTLJSONSerializing>

/** Large image URL */
@property (nonatomic, readonly) NSURL *largeURL;


@property (nonatomic, readonly) NSURL *mediumURL;


@property (nonatomic, readonly) NSURL *thumbnailURL;

@end
