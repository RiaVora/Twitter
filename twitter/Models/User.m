//
//  User.m
//  twitter
//
//  Created by Ria Vora on 6/29/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        NSString *profileImageString = [dictionary[@"profile_image_url_https"]
                                        stringByReplacingOccurrencesOfString:@"_normal" withString:@""];
        self.profileImageURL = [NSURL URLWithString:profileImageString];
        NSString *profileBannerString = [dictionary[@"profile_banner_url"]
                                        stringByAppendingString:@"mobile"];
        self.profileBannerURL = [NSURL URLWithString:profileBannerString];
        
        self.verified = [dictionary[@"verified"] boolValue];
        self.followingCount = [dictionary[@"friends_count"] intValue];
        self.followersCount = [dictionary[@"followers_count"] intValue];
        self.tweetCount = [dictionary[@"statuses_count"] intValue];
        
    }
    return self;
}

@end
