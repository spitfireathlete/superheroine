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
        [self postImage:[UIImage imageNamed:@"Supergirl.png"]  withStatus:@"test post using ios sdk"];
    } else {
        NSLog(@"nope");
    }
}

- (IBAction)favorite:(id)sender {
}

- (IBAction)watchVideo:(id)sender {
    NSLog(@"I was clicked: %@", self.card.videoLink);
    
    if (self.card.videoLink) {
        [[UIApplication sharedApplication] openURL:self.card.videoLink];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.youtube.com/watch?v=xyKXBxK82LE"]];
    }

}


- (void)postImage:(UIImage *)image withStatus:(NSString *)status
{
    ACAccountType *twitterType =
    [self.accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    SLRequestHandler requestHandler =
    ^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
        if (responseData) {
            NSInteger statusCode = urlResponse.statusCode;
            if (statusCode >= 200 && statusCode < 300) {
                NSDictionary *postResponseData =
                [NSJSONSerialization JSONObjectWithData:responseData
                                                options:NSJSONReadingMutableContainers
                                                  error:NULL];
                NSLog(@"[SUCCESS!] Created Tweet with ID: %@", postResponseData[@"id_str"]);
            }
            else {
                NSLog(@"[ERROR] Server responded: status code %lu %@", statusCode,
                      [NSHTTPURLResponse localizedStringForStatusCode:statusCode]);
            }
        }
        else {
            NSLog(@"[ERROR] An error occurred while posting: %@", [error localizedDescription]);
        }
    };
    
    ACAccountStoreRequestAccessCompletionHandler accountStoreHandler =
    ^(BOOL granted, NSError *error) {
        if (granted) {
            NSArray *accounts = [self.accountStore accountsWithAccountType:twitterType];
            NSURL *url = [NSURL URLWithString:@"https://api.twitter.com"
                          @"/1.1/statuses/update_with_media.json"];
            NSDictionary *params = @{@"status" : status};
            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                                    requestMethod:SLRequestMethodPOST
                                                              URL:url
                                                       parameters:params];
            NSData *imageData = UIImageJPEGRepresentation(image, 1.f);
            [request addMultipartData:imageData
                             withName:@"media[]"
                                 type:@"image/jpeg"
                             filename:@"image.jpg"];
            [request setAccount:[accounts lastObject]];
            [request performRequestWithHandler:requestHandler];
        }
        else {
            NSLog(@"[ERROR] An error occurred while asking for user authorization: %@",
                  [error localizedDescription]);
        }
    };
    
    [self.accountStore requestAccessToAccountsWithType:twitterType
                                               options:NULL
                                            completion:accountStoreHandler];
}
@end
