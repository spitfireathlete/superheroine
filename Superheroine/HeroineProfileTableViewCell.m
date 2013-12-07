//
//  HeroineProfileTableViewCell.m
//  Superheroine
//
//  Created by Erin Parker on 12/6/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "HeroineProfileTableViewCell.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "User.h"
@interface HeroineProfileTableViewCell()

@property (nonatomic) ACAccountStore *accountStore;

@end

@implementation HeroineProfileTableViewCell



- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        _accountStore = [[ACAccountStore alloc] init];
    }
    
    return self;
}
- (void) setSelected:(BOOL) selected animated:(BOOL) animated {
    
}

- (IBAction)tweet:(id)sender {
    if ([User userHasAccessToTwitter]) {
        NSLog(@"tweeet");
        [self doTweet];
    } else {
        NSLog(@"nope");
    }
}

- (IBAction)favorite:(id)sender {
}

- (IBAction)watchVideo:(id)sender {
}

- (void) doTweet {
    //  Step 1:  Obtain access to the user's Twitter accounts
    ACAccountType *twitterAccountType =
    [self.accountStore accountTypeWithAccountTypeIdentifier:
     ACAccountTypeIdentifierTwitter];
    
    [self.accountStore
     requestAccessToAccountsWithType:twitterAccountType
     options:NULL
     completion:^(BOOL granted, NSError *error) {
         if (granted) {
             //  Step 2:  Create a request
             NSArray *twitterAccounts =
             [self.accountStore accountsWithAccountType:twitterAccountType];
             
             NSURL *url = [NSURL URLWithString:@"https://api.twitter.com"
                           @"/1.1/statuses/user_timeline.json"];
             NSDictionary *params = @{@"screen_name" : [[twitterAccounts lastObject] username],
                                      @"include_rts" : @"0",
                                      @"trim_user" : @"1",
                                      @"count" : @"1"};
             SLRequest *request =
             [SLRequest requestForServiceType:SLServiceTypeTwitter
                                requestMethod:SLRequestMethodGET
                                          URL:url
                                   parameters:params];
             
             //  Attach an account to the request
             [request setAccount:[twitterAccounts lastObject]];
             
             //  Step 3:  Execute the request
             [request performRequestWithHandler:
              ^(NSData *responseData,
                NSHTTPURLResponse *urlResponse,
                NSError *error) {
                  
                  if (responseData) {
                      if (urlResponse.statusCode >= 200 &&
                          urlResponse.statusCode < 300) {
                          
                          NSError *jsonError;
                          NSDictionary *timelineData =
                          [NSJSONSerialization
                           JSONObjectWithData:responseData
                           options:NSJSONReadingAllowFragments error:&jsonError];
                          if (timelineData) {
                              NSLog(@"Timeline Response: %@\n", timelineData);
                          }
                          else {
                              // Our JSON deserialization went awry
                              NSLog(@"JSON Error: %@", [jsonError localizedDescription]);
                          }
                      }
                      else {
                          // The server did not respond ... were we rate-limited?
                          NSLog(@"The response status code is %lu", urlResponse.statusCode);
                      }
                  }
              }];
         }
         else {
             // Access was not granted, or an error occurred
             NSLog(@"%@", [error localizedDescription]);
         }
     }];
}
@end
