//
//  DetailsViewController.m
//  twitter
//
//  Created by Ria Vora on 7/1/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameLabel.text = self.tweet.user.name;
    self.handleLabel.text = self.tweet.user.screenName;
    self.dateLabel.text = self.tweet.createdAt;
    self.tweetLabel.text = [@"Posted " stringByAppendingString: self.tweet.text];
    
    self.profileView.image = nil;
    
    [self.profileView setImageWithURL:self.tweet.user.profileImageURL];
    self.profileView.layer.cornerRadius = 10;
}

@end
