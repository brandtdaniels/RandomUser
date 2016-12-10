//
//  BCDUserTableViewCell.h
//  RandomUser
//
//  Created by Brandt Daniels on 12/10/16.
//  Copyright © 2016 Brandt Daniels. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const BCDUserCellReuseIdentifier = @"BCDUserCell";
static NSString *const BCDUserTableViewCellNibName = @"BCDUserTableViewCell";

@interface BCDUserTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *pictureView;

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;

@end
