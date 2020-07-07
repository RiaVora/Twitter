//
//  ComposeViewController.h
//  twitter
//
//  Created by Ria Vora on 6/30/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

/*The purpose of the ComposeViewController is to facilitate the construction of a tweet, whether it is a new tweet or a reply to another tweet. The ComposeViewController is initiated from the creation of a tweet (through the TimelineViewController) or from the user trying to reply to a tweet (through the DetailsViewController).*/


#import <UIKit/UIKit.h>
#import "APIManager.h"
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ComposeViewControllerDelegate

- (void)didTweet:(Tweet *)tweet;

@end

@interface ComposeViewController : UIViewController

@property (nonatomic, weak) id<ComposeViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *inReplyToID;
@property (nonatomic, strong) NSString *author;


@end



NS_ASSUME_NONNULL_END
