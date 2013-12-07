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
    } else {
        NSLog(@"nope");
    }
}

- (IBAction)favorite:(id)sender {
}

- (IBAction)watchVideo:(id)sender {
}
@end
