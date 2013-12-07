//
//  SuperHeroineViewController.m
//  Superheroine
//
//  Created by Erin Parker on 12/7/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "SuperHeroineViewController.h"
#import "HeroineProfileTableViewCell.h"
#import "ComicBookSquareTableViewCell.h"
#import "Superheroine.h" 
#import "Superpower.h"

@interface SuperHeroineViewController ()

@end

@implementation SuperHeroineViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HeroineProfileTableViewCell" bundle:nil] forCellReuseIdentifier:@"profilecell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ComicBookSquareTableViewCell" bundle:nil] forCellReuseIdentifier:@"comiccell"];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *firstRow = [NSIndexPath indexPathForRow:0 inSection:0];
    if ([indexPath isEqual:firstRow]) {
        HeroineProfileTableViewCell *headerCell = (HeroineProfileTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"profilecell"];
        NSArray *components = [self.superheroine.displayName componentsSeparatedByString:@"\""];
        
        headerCell.fullName.text = components[0];
        headerCell.title.text = components[1];
        
        headerCell.twitterHandle.text = @"";
        headerCell.heroinePhoto.image = self.superheroine.superheroineImage;
        return headerCell;
    }
    
    NSIndexPath *row2 = [NSIndexPath indexPathForRow:1 inSection:0];
    if ([indexPath isEqual:row2]) {
        ComicBookSquareTableViewCell *comicCell = (ComicBookSquareTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"comiccell"];
        comicCell.sectionTitle.text = @"BIOGRAPHY";
        comicCell.sectionText.text = self.superheroine.bio;
        return comicCell;
        
    }
    

    ComicBookSquareTableViewCell *comicCell = (ComicBookSquareTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"comiccell"];

    comicCell.sectionTitle.text = @"SUPERPOWERS";
    NSLog(@"%@", [[self.superheroine.superpowers objectAtIndex:0] objectForKey:@"name"]);


    comicCell.sectionText.text = [NSString stringWithFormat:@"%@: %@",[[self.superheroine.superpowers objectAtIndex:0] objectForKey:@"name"], [[self.superheroine.superpowers objectAtIndex:1] objectForKey:@"description"]];
    return comicCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *firstRow = [NSIndexPath indexPathForRow:0 inSection:0];
    if ([indexPath isEqual:firstRow]) {
        return 200;
    }
    
    return 175;
    
}

@end
