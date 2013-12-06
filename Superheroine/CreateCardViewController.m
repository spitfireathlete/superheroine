//
//  CreateCardViewController.m
//  Superheroine
//
//  Created by Erin Parker on 12/5/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "CreateCardViewController.h"
#import "SWRevealViewController.h"

@interface CreateCardViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *menuButton;
@end

@implementation CreateCardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.menuButton setTarget:self.revealViewController];
    [self.menuButton setAction:@selector(revealToggle:)];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}


@end
