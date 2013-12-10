//
//  CardsViewController.m
//  Superheroine
//
//  Created by Erin Parker on 12/6/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "CardsViewController.h"
#import "SWRevealViewController.h"
#import "CardTableViewCell.h"
#import "HeroineViewController.h"
#import "APIClient.h"
#import "Card.h"
#import "UIImageView+AFNetworking.h"

@interface CardsViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *menuButton;
@property (strong, nonatomic) NSMutableArray *allCards;

@end

@implementation CardsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.menuButton setTarget:self.revealViewController];
    [self.menuButton setAction:@selector(revealToggle:)];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.tableView.delegate = self;
    self.tableView.dataSource  = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CardTableViewCell" bundle:nil] forCellReuseIdentifier:@"cardcell"];
    
    // Main Navigation Bar
    self.title = @"SUPERHEROINE JUSTICE LEAGUE";
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.102 green:0.102 blue:0.102 alpha:1]]; /*#1a1a1a*/
    
    [self.navigationController.navigationBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                                      [UIColor whiteColor], NSForegroundColorAttributeName,
                                                                      [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:16.0f], NSFontAttributeName, nil]];
    
    [self.navigationController.navigationBar setTranslucent:NO];

    [[APIClient sharedClient] getAllCardsOnSuccess:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
        self.allCards = [Card cardsFromArray:response];
        
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error retrieving all cards from the API");
    }];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.allCards count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CardTableViewCell *cell = (CardTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cardcell"];
    Card *card = [self.allCards objectAtIndex:indexPath.row];
    
    cell.fullName.text = card.displayName;
    cell.title.text = card.title;
    cell.numFavorites.text = [NSString stringWithFormat:@"%@", card.numFaves];
    cell.numShares.text = [NSString stringWithFormat:@"%@", card.numShares];
    // original code:     [cell.profilePicture setImageWithURL:card.photoUrl];
    
    // iOS Demo Code Only
    NSIndexPath *firstRow = [NSIndexPath indexPathForRow:0 inSection:0];
    if ([indexPath isEqual:firstRow]) {
        [cell.profilePicture setImage:[UIImage imageNamed:@"Esraa.png"]];
    }
    
    NSIndexPath *secondRow = [NSIndexPath indexPathForRow:1 inSection:0];
    if ([indexPath isEqual:secondRow]) {
        [cell.profilePicture setImage:[UIImage imageNamed:@"Fernanda.png"]];
    }

    NSIndexPath *thirdRow = [NSIndexPath indexPathForRow:2 inSection:0];
    if ([indexPath isEqual:thirdRow]) {
        [cell.profilePicture setImage:[UIImage imageNamed:@"Michele.png"]];
    }
    
    NSIndexPath *fourthRow = [NSIndexPath indexPathForRow:3 inSection:0];
    if ([indexPath isEqual:fourthRow]) {
        [cell.profilePicture setImage:[UIImage imageNamed:@"Hafsat.png"]];
    }
    
    NSIndexPath *fifthRow = [NSIndexPath indexPathForRow:4 inSection:0];
    if ([indexPath isEqual:fifthRow]) {
        [cell.profilePicture setImage:[UIImage imageNamed:@"MeganQuinn.png"]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    [self performSegueWithIdentifier:@"showheroine" sender:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 210;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showheroine"]){
        HeroineViewController *vc = [segue destinationViewController];
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        Card *card = [self.allCards objectAtIndex:path.row];
        NSLog(@"Selected Card: %@", card.name);
        vc.selectedCard = card;
    }
}

@end
