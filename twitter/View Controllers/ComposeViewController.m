//
//  ComposeViewController.m
//  twitter
//
//  Created by Ria Vora on 6/30/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"

@interface ComposeViewController ()

@property (weak, nonatomic) IBOutlet UITextView *composeTextView;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.composeTextView.text = @"";
}

- (IBAction)cancelPressed:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)tweetPressed:(id)sender {
    NSString *allText = [@" " stringByAppendingString:self.composeTextView.text];
    if (self.author) {
        allText = [self.author stringByAppendingString:allText];
    }
    
    NSString *idStr = @"";
    if (self.inReplyToID) {
        idStr = self.inReplyToID;
    }
    
    [[APIManager shared]postStatusWithText:allText:idStr completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error composing Tweet: %@", error.localizedDescription);
        }
        else{
            [self.delegate didTweet:tweet];
            NSLog(@"Compose Tweet Success!");
            [self dismissViewControllerAnimated:true completion:nil];
        }
    }];
}

@end
