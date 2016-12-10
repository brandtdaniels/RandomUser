//
//  BCDRandomUserDetailTableViewController.m
//  RandomUser
//
//  Created by Brandt Daniels on 12/10/16.
//  Copyright © 2016 Brandt Daniels. All rights reserved.
//

#import "BCDRandomUserDetailTableViewController.h"

NS_ENUM(NSInteger, BCDUserDetailRow) {
    BCDUserDetailRowName,
    BCDUserDetailRowGender,
    BCDUserDetailRowAge,
    BCDUserDetailRowMainPhone,
    BCDUserDetailRowMobilePhone,
    BCDUserDetailRowEmail,
    BCDUserDetailRowAddress,
    BCDUserDetailRowCount
};

static NSString *const BCDUserDetailCellReuseIdentifier = @"BCDUserDetailCell";

#pragma mark -

@implementation BCDRandomUserDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = self.user.name.first ? self.user.name.first.capitalizedString : NSLocalizedString(@"Details", nil);
    
    self.tableView.tableHeaderView = [self tableHeaderViewForUser:self.user];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return BCDUserDetailRowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BCDUserDetailCellReuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    [self configureCell:cell atIndexPath:indexPath forUser:self.user];
    
    return cell;
}

#pragma mark - Helpers

- (UIView *)tableHeaderViewForUser:(BCDUser *)user {
    
    NSData *data = [NSData dataWithContentsOfURL:user.picture.largeURL];
    UIImage *picture = [UIImage imageWithData:data];
    UIImageView *pictureView = [[UIImageView alloc] initWithImage:picture];
    pictureView.layer.cornerRadius = pictureView.frame.size.width / 2;
    pictureView.clipsToBounds = YES;
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth(self.tableView.frame), CGRectGetHeight(pictureView.frame)  + (CGRectGetHeight(pictureView.frame) / 4))];
    headerView.backgroundColor = [UIColor whiteColor];
    pictureView.center = headerView.center;
    [headerView addSubview:pictureView];
    
    return headerView;
    
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath forUser:(BCDUser *)user {
    
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17.0];
    cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17.0];
    cell.detailTextLabel.textColor = [UIColor grayColor];

    switch (indexPath.row) {
        case BCDUserDetailRowName: {
            cell.textLabel.text = NSLocalizedString(@"Name", nil);
            cell.detailTextLabel.text = [NSString stringWithFormat:NSLocalizedString(@"%@ %@, %@", @"User's name"), user.name.title.capitalizedString, user.name.last.capitalizedString, user.name.first.capitalizedString];
            break;
        }
        case BCDUserDetailRowGender: {
            cell.textLabel.text = NSLocalizedString(@"Gender", nil);
            cell.detailTextLabel.text = [self stringForGender:self.user.gender];
            break;
        }
        case BCDUserDetailRowAge: {
            cell.textLabel.text = NSLocalizedString(@"Age", nil);
            cell.detailTextLabel.text = [self stringForBirthdate:self.user.birthDate];
            break;
        }
        case BCDUserDetailRowMainPhone: {
            cell.textLabel.text = NSLocalizedString(@"Main Phone", nil);
            cell.detailTextLabel.text = self.user.mainPhone ?: NSLocalizedString(@"Unknown", nil);
            break;
        }
        case BCDUserDetailRowMobilePhone: {
            cell.textLabel.text = NSLocalizedString(@"Mobile Phone", nil);
            cell.detailTextLabel.text = self.user.mobilePhone ?: NSLocalizedString(@"Unknown", nil);
            break;
        }
        case BCDUserDetailRowEmail: {
            cell.textLabel.text = NSLocalizedString(@"Email", nil);
            cell.detailTextLabel.text = self.user.email ?: NSLocalizedString(@"Unknown", nil);
            break;
        }
        case BCDUserDetailRowAddress: {
            cell.textLabel.text = NSLocalizedString(@"Location", nil);
            cell.detailTextLabel.text = [self stringForAddress:self.user.address];
            break;
        }
        default:
            break;
    }
    
}

- (NSString *)stringForGender:(BCDGenderType)gender {
    
    switch (gender) {
        case BCDGenderTypeMale:
            return NSLocalizedString(@"Male", @"gender");
            break;
        case BCDGenderTypeFemale:
            return NSLocalizedString(@"Female", @"gender");
            break;
        case BCDGenderTypeUnknown:
        default:
            return NSLocalizedString(@"Unknown", @"gender");
            break;
    }
    
}

- (NSString *)stringForBirthdate:(NSDate *)birthDate {
    
    if (!birthDate) {
        return NSLocalizedString(@"Unknown", nil);
    }
    
    NSDate *now = [NSDate date];
    NSDateComponents *ageComponents = [[NSCalendar currentCalendar]
                                       components:NSCalendarUnitYear
                                       fromDate:birthDate
                                       toDate:now
                                       options:0];
    NSInteger age = [ageComponents year];
    
    return [NSString stringWithFormat:@"%ld", (long)age];
    
    
}

- (NSString *)stringForAddress:(BCDUserAddress *)address {
    
    if (address.city && address.state) {
        return [NSString stringWithFormat:@"%@, %@", self.user.address.city.capitalizedString, self.user.address.state.capitalizedString];
    } else if (address.city) {
        return [NSString stringWithFormat:@"%@", self.user.address.city.capitalizedString];
    } else if (address.state) {
        return [NSString stringWithFormat:@"%@", self.user.address.state.capitalizedString];
    } else {
        return NSLocalizedString(@"Unknown", nil);
    }
    
}

@end
