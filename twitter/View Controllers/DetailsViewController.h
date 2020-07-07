//
//  DetailsViewController.h
//  twitter
//
//  Created by Ria Vora on 7/1/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

/*The purpose of the DetailsViewController is to show a detailed view of a tweet from the TimelineViewController. The DetailsViewController is shown when a tweet is clicked on the TimelineViewController, and displays a larger version of the tweet with a more detailed "created_at" attribute and a reply feature.*/


#import <UIKit/UIKit.h>
#import "Tweet.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"
#import "TweetCell.h"
#import "ComposeViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController

@property (strong, nonatomic) Tweet *tweet;
@property (weak, nonatomic) IBOutlet UIImageView *profileView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *handleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UILabel *favoriteLabel;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (weak, nonatomic) IBOutlet UILabel *retweetLabel;
@property (weak, nonatomic) IBOutlet UIButton *replyLabel;

@end

NS_ASSUME_NONNULL_END
