//
//  SuperheroineListViewController.h
//  Superheroine
//
//  Created by Nidhi Kulkarni on 12/7/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Superheroine.h"

@interface SuperheroineListViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *superheroines;
@property (strong, nonatomic) Superheroine *selected;

@end
