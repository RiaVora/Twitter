//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "TweetCell.h"
#import "Tweet.h"
#import "UIImageView+AFNetworking.h"
#import "ComposeViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "DetailsViewController.h"


@interface TimelineViewController () <ComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *allTweets;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    
    [self fetchTweets];
    
    [self.refreshControl addTarget:self action:@selector(beginRefresh:) forControlEvents:UIControlEventValueChanged];
    
    [self.tableView insertSubview:self.refreshControl atIndex:0];
}

- (void)fetchTweets {
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            self.allTweets = [NSMutableArray arrayWithArray:tweets];
            
            [self.tableView reloadData];
            
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
    }];
    
}

- (void)beginRefresh:(UIRefreshControl *)refreshControl {
    
    [self fetchTweets];
    
    [self.refreshControl endRefreshing];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"%@", segue.identifier);
    if ([segue.identifier isEqualToString: @"ComposeSegue"]) {
        [self composeTweetSegue:segue];
        
    } else if ([segue.identifier isEqualToString: @"DetailsSegue"]) {
        [self detailsTweetSegue:segue sender:sender];
    }
    
}

- (void)composeTweetSegue:(UIStoryboardSegue *)segue {
    UINavigationController *navigationController = [segue destinationViewController];
    ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
    composeController.delegate = self;
}

- (void)detailsTweetSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UITableViewCell *tappedCell = sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:tappedCell];
    Tweet *tweet = self.allTweets[indexPath.row];
    DetailsViewController *detailsViewController = [segue destinationViewController];
    detailsViewController.tweet = tweet;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    
    Tweet *tweet = self.allTweets[indexPath.row];
    cell.tweet = tweet;
    User *user = tweet.user;
    cell.nameLabel.text = user.name;
    cell.handleLabel.text = [NSString stringWithFormat:@"@%@", user.screenName];
    cell.tweetLabel.text = tweet.text;
    cell.dateLabel.text = tweet.createdAt;
    [cell refreshData];
    
    cell.profileView.image = nil;
    
    [cell.profileView setImageWithURL:user.profileImageURL];
    cell.profileView.layer.cornerRadius = 10;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allTweets.count;
}


- (void)didTweet:(nonnull Tweet *)tweet {
    [self.allTweets addObject:tweet];
    
    [self fetchTweets];
}

- (IBAction)pressedLogout:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    [[APIManager shared] logout];
}

@end
