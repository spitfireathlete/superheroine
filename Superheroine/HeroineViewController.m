//
//  HeroineViewController.m
//  Superheroine
//
//  Created by Erin Parker on 12/5/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "HeroineViewController.h"
#import "HeroineProfileTableViewCell.h"
#import "ComicBookSquareTableViewCell.h"
#import "Card.h"

@interface HeroineViewController ()

@end

@implementation HeroineViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
        
    [self.tableView registerNib:[UINib nibWithNibName:@"HeroineProfileTableViewCell" bundle:nil] forCellReuseIdentifier:@"profilecell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ComicBookSquareTableViewCell" bundle:nil] forCellReuseIdentifier:@"comiccell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *firstRow = [NSIndexPath indexPathForRow:0 inSection:0];
    if ([indexPath isEqual:firstRow]) {
        HeroineProfileTableViewCell *headerCell = (HeroineProfileTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"profilecell"];

        headerCell.fullName.text = self.selectedCard.name;
        headerCell.title.text = self.selectedCard.title;
        headerCell.twitterHandle.text = self.selectedCard.twitterHandle;
        headerCell.numInspired.text = [NSString stringWithFormat:@"%@", self.selectedCard.numFaves];
        return headerCell;
    }
    
    NSIndexPath *row2 = [NSIndexPath indexPathForRow:1 inSection:0];
    if ([indexPath isEqual:row2]) {
        ComicBookSquareTableViewCell *comicCell = (ComicBookSquareTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"comiccell"];
        comicCell.sectionTitle.text = @"BIOGRAPHY";
        comicCell.sectionText.text = self.selectedCard.bio;
        return comicCell;
        
    }
    
    NSIndexPath *row3 = [NSIndexPath indexPathForRow:2 inSection:0];
    if ([indexPath isEqual:row3]) {
        ComicBookSquareTableViewCell *comicCell = (ComicBookSquareTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"comiccell"];
        comicCell.sectionTitle.text = @"DID YOU KNOW?";
        comicCell.sectionText.text = self.selectedCard.facts;
        return comicCell;
    }
    
    NSIndexPath *row4 = [NSIndexPath indexPathForRow:3 inSection:0];
    if ([indexPath isEqual:row4]) {
        ComicBookSquareTableViewCell *comicCell = (ComicBookSquareTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"comiccell"];
        comicCell.sectionTitle.text = @"LIFE ADVICE FROM OUR HEROINE";
        comicCell.sectionText.text = self.selectedCard.advice;
        return comicCell;
    }
    

    ComicBookSquareTableViewCell *comicCell = (ComicBookSquareTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"comiccell"];
    comicCell.sectionTitle.text = @"HOW SHE ACHIEVED A TOUGH GOAL";
    comicCell.sectionText.text = self.selectedCard.goals;
    return comicCell;

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
