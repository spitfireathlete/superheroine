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
#import "APIClient.h"
#import "UIImageView+AFNetworking.h"

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
        
        NSData *data = [NSData dataWithContentsOfURL:self.card.photoUrl];
        UIImage *image1 = [[UIImage alloc] initWithData:data];
        
        UIImage *image2 = self.card.alterEgo.superheroineImage;
        
        CGSize size = CGSizeMake(image1.size.width, image1.size.height + image2.size.height);
        
        UIGraphicsBeginImageContext(size);
        [image1 drawInRect:CGRectMake(0,0,size.width, image1.size.height)];
        [image2 drawInRect:CGRectMake(0,image1.size.height,size.width, image2.size.height)];
        
        UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        [self postImage:finalImage withStatus:[NSString stringWithFormat:@"Who is your inspiration? Mine is %@ %@. #vitalvoices #chimeforchange", self.card.displayName, self.card.twitterHandle]];
    } else {
        NSLog(@"nope");
    }
}

- (IBAction)favorite:(id)sender {
    
    [[APIClient sharedClient] favoriteCard:self.card success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
        self.numInspired.text = [NSString stringWithFormat:@"%d", [self.card.numFaves intValue] + 1];
        [self.favorite setSelected:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error recording favorite");
    }];
}

- (IBAction)watchVideo:(id)sender {
    NSLog(@"video clicked: %@", self.card.videoLink);
    
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
                [self.tweet setSelected:YES];
                
                [[APIClient sharedClient] shareCard:self.card success:^(AFHTTPRequestOperation *operation, id response) {
                    NSLog(@"%@", response);
                    
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    NSLog(@"Error recording share");
                }];

                
            }
            else {
                NSLog(@"[ERROR] Server responded: status code %u %@", statusCode,
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
