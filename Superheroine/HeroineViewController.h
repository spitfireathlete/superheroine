//
//  HeroineViewController.h
//  Superheroine
//
//  Created by Erin Parker on 12/5/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroineViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end
