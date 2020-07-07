//
//  TimelineViewController.h
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>

/*The purpose of the TimelineViewController is to facilitate the table view of tweets pulled from the Twitter API. The format of the TimelineViewController is displayed on Main.storyboard. The TimelineViewController gets tweet data from the API using the API Manager, inserts them in a table view, sends information to the DetailsViewController and the ComposeViewController, and logs the user out.*/


@interface TimelineViewController : UIViewController

@end
