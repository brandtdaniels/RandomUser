//
//  BCDUserTableViewCell+Additions.h
//  RandomUser
//
//  Created by Brandt Daniels on 12/10/16.
//  Copyright © 2016 Brandt Daniels. All rights reserved.
//

#import "BCDUserTableViewCell.h"

@class BCDUser;

@interface BCDUserTableViewCell (Additions)

- (void)configureCellForUser:(BCDUser *)user;

@end
