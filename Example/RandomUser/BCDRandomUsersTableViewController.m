//
//  BCDRandomUsersTableViewController.m
//  RandomUser
//
//  Created by Brandt Daniels on 12/9/16.
//  Copyright © 2016 Brandt Daniels. All rights reserved.
//

#import "BCDRandomUsersTableViewController.h"
#import "BCDRandomUserDetailTableViewController.h"
#import "BCDRandomUserAPIClient.h"
#import "BCDUserTableViewCell+Additions.h"
#import <MBProgressHUD/MBProgressHUD.h>

static NSString *const BCDUserDetailSegueIdentifier = @"BCDUserDetailSegueIdentifier";

#pragma mark -

@interface BCDRandomUsersTableViewController ()

@property (nonatomic, strong) BCDRandomUserClient *userClient;

@property (nonatomic, strong) NSArray *users;

@property (nonatomic, strong) BCDUser *selectedUser;

@end

@implementation BCDRandomUsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Users", nil);
    
    [self.tableView registerNib:[UINib nibWithNibName:BCDUserTableViewCellNibName bundle:nil] forCellReuseIdentifier:BCDUserCellReuseIdentifier];
    
    self.userClient = [BCDRandomUserClient randomUserClient];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.users.count == 0) {
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.label.text = @"Loading...";
        
        [self.userClient getUsersWithSuccess:^(NSArray *users) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            self.users = [users sortedArrayUsingComparator:^NSComparisonResult(BCDUser *userA, BCDUser *userB) {
                NSString *first = userA.name.last;
                NSString *second = userB.name.last;
                return [first compare:second];
            }];
            [self.tableView reloadData];
        } failure:^(NSError *error) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self showErrorAlertForError:error];
        }];
        
    }
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.selectedUser = nil;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BCDUser *user = self.users[indexPath.row];
    
    BCDUserTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:BCDUserCellReuseIdentifier forIndexPath:indexPath];
    
    [cell configureCellForUser:user];
    
    return cell;
    
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedUser = self.users[indexPath.row];
    
    NSLog(@"%@", self.selectedUser.description);
    
    [self performSegueWithIdentifier:BCDUserDetailSegueIdentifier sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.destinationViewController isKindOfClass:BCDRandomUserDetailTableViewController.class]) {
        BCDRandomUserDetailTableViewController *userDetailTVC = segue.destinationViewController;
        userDetailTVC.user = self.selectedUser;
    }
}

#pragma mark - Helpers

- (void)showErrorAlertForError:(NSError *)error {
    
    NSString *message = [NSString stringWithFormat:@"Response Status Code: %ld\nMessage: %@", (long)error.code, error.localizedDescription];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

@end
