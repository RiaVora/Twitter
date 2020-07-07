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
    NSString __block *screenName = @"";
    [[APIManager shared]getUserData:^(NSDictionary *dictionary, NSError *error) {
        if(error){
            NSLog(@"Error returning user: %@", error.localizedDescription);
        }
        else{
            screenName = dictionary[@"screen_name"];
            NSLog(@"Successfully found User's ID String! %@", screenName);
            [[APIManager shared]lookupUserID:screenName completion:^(User *foundUser, NSError *error) {
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
    
    self.bannerView.image = nil;
    [self.bannerView setImageWithURL: self.user.profileBannerURL];
    
    self.nameLabel.text = self.user.name;
    self.handleLabel.text = self.user.screenName;
    self.followerLabel.text = [NSString stringWithFormat:@"%d", self.user.followersCount];
    self.followingLabel.text = [NSString stringWithFormat:@"%d", self.user.followingCount];
    
}

@end
