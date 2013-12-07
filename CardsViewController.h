//
//  CardsViewController.h
//  Superheroine
//
//  Created by Erin Parker on 12/6/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
