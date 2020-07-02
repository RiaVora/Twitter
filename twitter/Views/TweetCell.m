//
//  TweetCell.m
//  twitter
//
//  Created by Ria Vora on 6/29/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
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
