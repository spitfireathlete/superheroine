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
#import "SuperheroineViewController.h"

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
    
    self.tableView.delegate = self;
    self.tableView.dataSource  = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CardTableViewCell" bundle:nil] forCellReuseIdentifier:@"cardcell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CardTableViewCell *cell = (CardTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cardcell"];
    cell.fullName.text = @"Sara Blakely";
    cell.title.text = @"Founder and CEO of Spanx";
    cell.numFavorites.text = @"222,222";
    cell.numShares.text = @"123,234";
    return cell;
}
µ
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    [self performSegueWithIdentifier:@"showheroine" sender:nil];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 275;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showheroine"]){

    }
}

@end
