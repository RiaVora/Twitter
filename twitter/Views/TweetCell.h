//
//  TweetCell.h
//  twitter
//
//  Created by Ria Vora on 6/29/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

/*The TweetCell is used to represent a TableViewCell that displays a tweet in the TimelineViewController, and handles the favoriting, unfavoriting, retweeting, and unretweeting a tweet (with the animation and the call back to the API Manager to update the tweet).*/


#import <UIKit/UIKit.h>
#import "TTTAttributedLabel.h"
#import "Tweet.h"
#import "APIManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface TweetCell : UITableViewCell

@property (weak, nonatomic) IBOutlet TTTAttributedLabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *handleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) Tweet *tweet;
@property (weak, nonatomic) IBOutlet UIImageView *profileView;
@property (weak, nonatomic) IBOutlet UILabel *favoriteLabel;
@property (weak, nonatomic) IBOutlet UILabel *retweetLabel;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;

- (void)refreshData;
@end

NS_ASSUME_NONNULL_END
