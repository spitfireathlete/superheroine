//
//  HeroineProfileTableViewCell.m
//  Superheroine
//
//  Created by Erin Parker on 12/6/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "HeroineProfileTableViewCell.h"

@implementation HeroineProfileTableViewCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        
    }
    
    return self;
}
- (void) setSelected:(BOOL) selected animated:(BOOL) animated {
    
}

- (IBAction)tweet:(id)sender {
    
}

- (IBAction)favorite:(id)sender {
}

- (IBAction)watchVideo:(id)sender {
    NSLog(@"I was clicked: %@", self.card.videoLink);
    [[UIApplication sharedApplication] openURL:self.card.videoLink];
}
@end
