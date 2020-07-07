//
//  User.h
//  twitter
//
//  Created by Ria Vora on 6/29/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

/*The User model is used to represent a User object from Twitter's API, and stores the attributes of the User object as attributes of the class. The User object is initialized from the dictionary sent by Twitter's API that represents a User object.*/


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, strong) NSURL *profileImageURL;
@property (nonatomic, strong) NSURL *profileBannerURL;
@property (nonatomic) BOOL verified;
@property (nonatomic) int followingCount;
@property (nonatomic) int followersCount;
@property (nonatomic) int tweetCount;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
