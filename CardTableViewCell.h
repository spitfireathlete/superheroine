//
//  CardTableViewCell.h
//  Superheroine
//
//  Created by Erin Parker on 12/6/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *fullName;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *numFavorites;
@property (strong, nonatomic) IBOutlet UILabel *numShares;

@end
