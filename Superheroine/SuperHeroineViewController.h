//
//  SuperHeroineViewController.h
//  Superheroine
//
//  Created by Erin Parker on 12/7/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Superheroine.h"
#import "Superpower.h"

@interface SuperHeroineViewController : UITableViewController 
@property (strong, nonatomic) Superheroine *superheroine;
@property (strong, nonatomic) Superpower *superpower;
@end
