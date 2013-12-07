//
//  HeroineProfileTableViewCell.h
//  Superheroine
//
//  Created by Erin Parker on 12/6/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"

@interface HeroineProfileTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *heroinePhoto;
@property (strong, nonatomic) IBOutlet UIButton *tweet;
@property (strong, nonatomic) IBOutlet UIButton *favorite;
@property (strong, nonatomic) IBOutlet UILabel *fullName;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *twitterHandle;
@property (strong, nonatomic) IBOutlet UILabel *numInspired;
@property (strong, nonatomic) IBOutlet UIButton *watchVideo;

@property (strong, nonatomic) Card *card;

- (IBAction)tweet:(id)sender;
- (IBAction)favorite:(id)sender;
- (IBAction)watchVideo:(id)sender;

@end
