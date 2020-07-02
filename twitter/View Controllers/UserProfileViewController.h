//
//  UserProfileViewController.h
//  twitter
//
//  Created by Ria Vora on 7/2/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "APIManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *profileView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *handleLabel;
@property (weak, nonatomic) IBOutlet UILabel *followerLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingLabel;
@property (strong, nonatomic) User *user;

@end

NS_ASSUME_NONNULL_END
