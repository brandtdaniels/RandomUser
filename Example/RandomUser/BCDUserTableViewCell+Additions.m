//
//  BCDUserTableViewCell+Additions.m
//  RandomUser
//
//  Created by Brandt Daniels on 12/10/16.
//  Copyright © 2016 Brandt Daniels. All rights reserved.
//

#import "BCDUserTableViewCell+Additions.h"
#import "BCDUser.h"
#import <Haneke/Haneke.h>

@implementation BCDUserTableViewCell (Additions)

- (void)configureCellForUser:(BCDUser *)user {
    
    [self.pictureView hnk_setImageFromURL:user.picture.thumbnailURL];
    
    self.nameLabel.text = [NSString stringWithFormat:NSLocalizedString(@"%@ %@, %@", @"User's name"), user.name.title.capitalizedString, user.name.last.capitalizedString, user.name.first.capitalizedString];
}

@end
