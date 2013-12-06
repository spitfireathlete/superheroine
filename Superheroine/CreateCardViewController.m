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
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;

@end

@implementation CreateCardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.menuButton setTarget:self.revealViewController];
    [self.menuButton setAction:@selector(revealToggle:)];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 910)];
    

    self.label1.autoresizingMask = UIViewAutoresizingNone;

    self.label2.autoresizingMask = UIViewAutoresizingNone;
    
    [self.contentView addSubview:self.label1];
    [self.contentView addSubview:self.label2];
    
    self.scrollView.delegate = self;
    [self.scrollView setScrollEnabled:YES];

    [self.scrollView setContentSize:CGSizeMake(320, 910)];
    [self.scrollView addSubview:self.contentView];
    [self.view addSubview:self.scrollView];
    
}


@end
