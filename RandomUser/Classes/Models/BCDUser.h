//
//  BCDUser.h
//  Pods
//
//  Created by Brandt Daniels on 12/9/16.
//
//

#import "BCDBaseObject.h"
#import "BCDUserName.h"
#import "BCDUserPicture.h"
#import "BCDUserAddress.h"

typedef NS_ENUM(NSInteger, BCDGenderType) {
    BCDGenderTypeUnknown,
    BCDGenderTypeMale,
    BCDGenderTypeFemale
};

#pragma mark -

@interface BCDUser : BCDBaseObject

/** Includes title, first, and last name. */
@property (nonatomic, readonly) BCDUserName *name;

/** URLs for thumbnail, medium, and large images. */
@property (nonatomic, readonly) BCDUserPicture *picture;

@property (nonatomic, readonly) BCDGenderType gender;
@property (nonatomic, readonly) NSString *email;
@property (nonatomic, readonly) NSString *mobilePhone;
@property (nonatomic, readonly) NSString *mainPhone;
@property (nonatomic, readonly) NSDate *birthDate;
@property (nonatomic, readonly) BCDUserAddress *address;

@end
