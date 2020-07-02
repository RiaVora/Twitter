//
//  UserProfileViewController.m
//  twitter
//
//  Created by Ria Vora on 7/2/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "UserProfileViewController.h"
#import "UIImageView+AFNetworking.h"

@interface UserProfileViewController ()

@end

@implementation UserProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchUser];
}

- (void)fetchUser {
    NSString __block *idStr = @"";
    [[APIManager shared]getUserData:^(NSDictionary *dictionary, NSError *error) {
        if(error){
            NSLog(@"Error returning user: %@", error.localizedDescription);
        }
        else{
            idStr = dictionary[@"id_str"];
            NSLog(@"Successfully found User's ID String! %@", idStr);
            [[APIManager shared]lookupUserID:idStr completion:^(User *foundUser, NSError *error) {
                if (error) {
                    NSLog(@"Error finding user: %@", error.localizedDescription);
                } else {
                    self.user = foundUser;
                    NSLog(@"Successfully found User through lookup! %@", foundUser.screenName);
                    [self refreshData];
                }
            }];
        }
    }];
    
}

- (void)refreshData {
    self.profileView.image = nil;
    [self.profileView setImageWithURL: self.user.profileImageURL];
    
    self.nameLabel.text = self.user.name;
    self.handleLabel.text = self.user.screenName;
    self.followerLabel.text = [NSString stringWithFormat:@"%d", self.user.followersCount];
    self.followingLabel.text = [NSString stringWithFormat:@"%d", self.user.followingCount];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
