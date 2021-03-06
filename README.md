# Project 3 - *Twitter*

**Twitter** is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).

Time spent: **16** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User sees app icon in home screen and styled launch screen
- [x] User can sign in using OAuth login flow
- [x] User can Logout
- [x] User can view last 20 tweets from their home timeline
- [x] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp.
- [x] User can pull to refresh.
- [x] User can tap the retweet and favorite buttons in a tweet cell to retweet and/or favorite a tweet.
- [x] User can compose a new tweet by tapping on a compose button.
- [x] Using AutoLayout, the Tweet cell should adjust it's layout for iPhone 7, Plus and SE device sizes as well as accommodate device rotation.

The following **optional** features are implemented:

- [x] Tweet Details Page: User can tap on a tweet to view it, with controls to retweet, favorite, and reply.
- [x] User should display the relative timestamp for each tweet "8m", "7h"
- [x] User can view their profile in a *profile tab*
  - Contains the user header view: picture and tagline
  - Contains a section with the users basic stats: # tweets, # following, # followers
  - [ ] Profile view should include that user's timeline
- [x] User can reply to any tweet, and replies should be prefixed with the username and the reply_id should be set when posting the tweet
- [x] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count. Refer to [[this guide|unretweeting]] for help on implementing unretweeting.
- [ ] Links in tweets are clickable.
- [ ] User can tap the profile image in any tweet to see another user's profile
  - Contains the user header view: picture and tagline
  - Contains a section with the users basic stats: # tweets, # following, # followers
- [ ] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.
- [ ] When composing, you should have a countdown for the number of characters remaining for the tweet (out of 280)
- [ ] After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.
- [ ] User sees embedded images in tweet if available
- [ ] User can switch between timeline, mentions, or profile view through a tab bar
- [ ] Profile Page: pulling down the profile page should blur and resize the header image.


The following **additional** features are implemented:

- [x] The details view is configured to show a larger view of the tweet and the profile picture
- [x] Customized UI for adding a Tweet to be pink!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How to create a  file that contains commonly used methods (such as a network error) and use it in multiple View Controllers to reduce repetition
2. How to get rid of the whitespace aroung the retweet and favorite icons (shown when you select the tweet)

## Video Walkthrough

Here's a walkthrough of:

- The Launching screen and the Log-in screen

<img src='http://g.recordit.co/nOzjFIoza4.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

- Composing a tweet, cancelling a tweet, and the tweet appearing on your timeline

<img src='http://g.recordit.co/jJQ5EXOHBI.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

- Favoriting, unfavoriting, retweeting, and unretweeting a tweet; refreshing the timeline

<img src='http://g.recordit.co/tu020PsrJl.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

- Scrolling through a detailed view of the tweet and logging out

<img src='http://g.recordit.co/FdhHtovvBy.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

- Viewing the timeline and detail view on mutliple devices in both portrait and landscape mode

<img src='http://g.recordit.co/fM6G0JRgoc.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

- Seeing a detailed version of the tweet with retweet and like buttons, as well as replying to a tweet

<img src='http://g.recordit.co/I9tRpREV9u.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

- Using a tab view controller to see one's profile

<img src='http://g.recordit.co/uTSKz0Qd5n.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [Recordit](https://recordit.co/).

## Notes

One challenge I encountered when building the app was using the APIManager to send the data about a favorited or unfavorited tweet back to my Twitter Developer database. I didn't understand how the block of code was to be executed, and everytime I tried to call the API method I had a syntax error and would deal with a red alert or the app crashing. After around half an hour of debugging and searching up solutions, as well as referencing the past API call that had been given to me, I was able to write a block of code. Through this process, I understood each component of the complicated, Objective-C APIManager method much better.

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library
- [DateTools](https://github.com/MatthewYork/DateTools) - current time and date library

## License

    Copyright [2020] [Ria Vora]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
