//
//  TweetCell.h
//  twitter
//
//  Created by Ria Vora on 6/29/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTTAttributedLabel.h";

NS_ASSUME_NONNULL_BEGIN

@interface TweetCell : UITableViewCell

@property (weak, nonatomic) IBOutlet TTTAttributedLabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *handleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
//@property (nonatomic, strong) NSString *tweet;
@property (weak, nonatomic) IBOutlet UIImageView *profileView;

@end

NS_ASSUME_NONNULL_END
