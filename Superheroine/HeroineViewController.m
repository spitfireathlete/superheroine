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
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *firstRow = [NSIndexPath indexPathForRow:0 inSection:0];
    if ([indexPath isEqual:firstRow]) {
        HeroineProfileTableViewCell *headerCell = (HeroineProfileTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"profilecell"];
        headerCell.fullName.text = @"KARA ZOREL";
        return headerCell;
    }
    
    ComicBookSquareTableViewCell *comicCell = (ComicBookSquareTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"comiccell"];
    comicCell.sectionTitle.text = @"BIOGRAPHY";
    return comicCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

@end
