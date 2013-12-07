//
//  SuperheroineListViewController.m
//  Superheroine
//
//  Created by Nidhi Kulkarni on 12/7/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "SuperheroineListViewController.h"
#import "Superheroine.h"
#import "APIClient.h"

@interface SuperheroineListViewController ()

@property (strong, nonatomic) NSIndexPath *selectedIndex;


@end

@implementation SuperheroineListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [[APIClient sharedClient] getAllSuperheroinesOnSuccess:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
        self.superheroines = [Superheroine superheroinesFromArray:response];
        
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error retrieving all superheroines from the API");
    }];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.superheroines count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SuperheroineCell" forIndexPath:indexPath];
    
    Superheroine *superheroine = [self.superheroines objectAtIndex:indexPath.row];
    cell.textLabel.text = superheroine.displayName;
    cell.imageView.image = [UIImage imageNamed:@"Supergirl.png"];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:NO];
    

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:self.selectedIndex];
    
    if ([indexPath isEqual:self.selectedIndex]) {
        // deselect cell
        cell.accessoryType = UITableViewCellAccessoryNone;
        self.selected = nil;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UserDeselectedSuperheroine"
    object:nil];
    } else {
        // select new cell, deselected previous
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        selectedCell.accessoryType = UITableViewCellAccessoryNone;
        self.selectedIndex = indexPath;
        self.selected = [self.superheroines objectAtIndex:indexPath.row];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UserSelectedSuperheroine"
                                                            object:self.selected];
    }
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
