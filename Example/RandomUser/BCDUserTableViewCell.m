//
//  BCDUserTableViewCell.m
//  RandomUser
//
//  Created by Brandt Daniels on 12/10/16.
//  Copyright © 2016 Brandt Daniels. All rights reserved.
//

#import "BCDUserTableViewCell.h"

@implementation BCDUserTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.pictureView.layer.cornerRadius = self.pictureView.frame.size.width / 2;
    self.pictureView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
