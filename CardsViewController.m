//
//  CardsViewController.m
//  Superheroine
//
//  Created by Erin Parker on 12/6/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "CardsViewController.h"
#import "SWRevealViewController.h"

@interface CardsViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *menuButton;
@end

@implementation CardsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.menuButton setTarget:self.revealViewController];
    [self.menuButton setAction:@selector(revealToggle:)];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

@end
