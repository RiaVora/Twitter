//
//  DetailsViewController.m
//  twitter
//
//  Created by Ria Vora on 7/1/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"
#import "TweetCell.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameLabel.text = self.tweet.user.name;
    self.handleLabel.text = self.tweet.user.screenName;
    self.dateLabel.text = [@"Tweeted " stringByAppendingString: self.tweet.createdAt];
    self.tweetLabel.text = self.tweet.text;
    
    [self refreshData];
    
    self.profileView.image = nil;
    
    [self.profileView setImageWithURL:self.tweet.user.profileImageURL];
    self.profileView.layer.cornerRadius = 10;
}

- (IBAction)pressedFavorite:(id)sender {
    
    NSString *action = @"favorites/create";
    
    if (self.tweet.favorited == YES) {
        action = @"favorites/destroy";
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        
    } else {
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
    }
    
    [self refreshFavorites];
    
    [[APIManager shared]interactWithTweet:self.tweet:action completion:^(Tweet *tweet, NSError *error) {
        if(error) {
            NSLog(@"Error %@ Tweet: %@", error.localizedDescription, tweet.text);
        } else {
            NSLog(@"Successfully %@d the following Tweet: %@", action, tweet.text);
            self.tweet = tweet;
        }
    }];
}
- (IBAction)pressedRetweet:(id)sender {
    NSString *action = @"statuses/retweet";
    
    if (self.tweet.retweeted) {
        action = @"statuses/unretweet";
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
    } else {
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
    }
    
    [self refreshRetweets];
    
    [[APIManager shared]interactWithTweet:self.tweet:action completion:^(Tweet *tweet, NSError *error) {
        if(error) {
            NSLog(@"Error %@ Tweet: %@", error.localizedDescription, tweet.text);
        } else {
            NSLog(@"Successfully %@d the following Tweet: %@", action, tweet.text);
            self.tweet = tweet;
        }
    }];
}
- (IBAction)pressedReply:(id)sender {
}

- (void)refreshData {
    [self refreshFavorites];
    [self refreshRetweets];
}

- (void)refreshFavorites {
    self.favoriteButton.selected = self.tweet.favorited;
    self.favoriteLabel.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
}

- (void)refreshRetweets {
    self.retweetButton.selected = self.tweet.retweeted;
    self.retweetLabel.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
}

@end
