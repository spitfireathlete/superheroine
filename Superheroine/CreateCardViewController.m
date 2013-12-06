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

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;

@property (strong, nonatomic) IBOutlet UILabel *twitter;
@property (strong, nonatomic) IBOutlet UITextField *twitterTextField;

@property (strong, nonatomic) IBOutlet UILabel *biography;
@property (strong, nonatomic) IBOutlet UITextField *biographyTextField;

@property (strong, nonatomic) IBOutlet UILabel *interestingFact;
@property (strong, nonatomic) IBOutlet UITextField *interestingFactTextField;

@property (strong, nonatomic) IBOutlet UILabel *quote;
@property (strong, nonatomic) IBOutlet UITextField *quoteTextField;

@property (strong, nonatomic) IBOutlet UILabel *goal;
@property (strong, nonatomic) IBOutlet UITextField *goalTextField;

@property (strong, nonatomic) IBOutlet UILabel *videoLink;
@property (strong, nonatomic) IBOutlet UITextField *videoLinkTextField;

@property (strong, nonatomic) IBOutlet UIButton *chooseSuperheroineButton;

@property (strong, nonatomic) IBOutlet UIButton *addPhotoButton;

@property (strong, nonatomic) IBOutlet UIButton *saveButton;


@end

@implementation CreateCardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.menuButton setTarget:self.revealViewController];
    [self.menuButton setAction:@selector(revealToggle:)];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 930)];
    
    [self.contentView addSubview:self.name];
    [self.contentView addSubview:self.nameTextField];
    
    [self.contentView addSubview:self.twitter];
    [self.contentView addSubview:self.twitterTextField];
    
    [self.contentView addSubview:self.biography];
    [self.contentView addSubview:self.biographyTextField];
    
    [self.contentView addSubview:self.interestingFact];
    [self.contentView addSubview:self.interestingFactTextField];
    
    [self.contentView addSubview:self.quote];
    [self.contentView addSubview:self.quoteTextField];
    
    [self.contentView addSubview:self.goal];
    [self.contentView addSubview:self.goalTextField];
    
    [self.contentView addSubview:self.videoLink];
    [self.contentView addSubview:self.videoLinkTextField];
    
    [self.contentView addSubview:self.chooseSuperheroineButton];
    
    [self.contentView addSubview:self.addPhotoButton];
    
    [self.contentView addSubview:self.saveButton];
    
    
    self.scrollView.delegate = self;
    [self.scrollView setScrollEnabled:YES];

    [self.scrollView setContentSize:CGSizeMake(320, 930)];
    [self.scrollView addSubview:self.contentView];
    
    [self.view addSubview:self.scrollView];
    
}

@end
