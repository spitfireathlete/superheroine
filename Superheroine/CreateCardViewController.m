//
//  CreateCardViewController.m
//  Superheroine
//
//  Created by Erin Parker on 12/5/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "CreateCardViewController.h"
#import "SWRevealViewController.h"
#import "APIClient.h"
#import "Card.h"
#import "Superheroine.h"

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


@property (strong, nonatomic) UIImage *imagePicked;
@property (strong, nonatomic) Card *card;
@property (strong, nonatomic) Superheroine *superheroine;

- (IBAction)addPhotoAction:(id)sender;
- (IBAction)createCardAction:(id)sender;

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

- (IBAction)addPhotoAction:(id)sender {
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    cameraUI.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    // Displays a control that allows the user to choose picture or
    // movie capture, if both are available:
    cameraUI.mediaTypes =
    [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    cameraUI.allowsEditing = NO;
    
    cameraUI.delegate = self;
    
    [self presentViewController:cameraUI animated:YES completion:nil];

}

- (IBAction)createCardAction:(id)sender {
    NSData *imageData = [NSData dataWithData:UIImageJPEGRepresentation(self.imagePicked, .1)];
    NSString *imageAsbase64String = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    NSLog(@"%@", imageAsbase64String);

    self.card = [[Card alloc] initWithDictionary:@{@"name":self.name.text,
                                                   @"bio":self.biography.text,
                                                   @"facts":self.interestingFact.text,
                                                   @"quote":self.quote.text,
                                                   @"goals":self.goal.text,
                                                   @"video_link":self.videoLink.text,
                                                   @"twitter_handle":self.twitter.text}];
    
    
    [[APIClient sharedClient] createCard:(Card *)self.card withImage:imageAsbase64String withAlterEgo:self.superheroine success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
}


- (void) imagePickerController: (UIImagePickerController *) picker didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    NSLog(@"%@", mediaType);
    UIImage *originalImage = (UIImage *) [info objectForKey:
                                          UIImagePickerControllerOriginalImage];
    self.imagePicked = originalImage;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
