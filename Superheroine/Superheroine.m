//
//  Superheroine.m
//  Superheroine
//
//  Created by Nidhi Kulkarni on 12/6/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "Superheroine.h"
#import "Superpower.h"

@implementation Superheroine

- (id) initWithDictionary:(NSDictionary *)data {
    if (self = [super initWithDictionary:data]) {
        NSArray *powers = [self valueOrNilForKeyPath:@"superpowers"];
        self.superpowers = [Superpower superpowersFromArray:powers];
        self.objectId = [self valueOrNilForKeyPath:@"id"];
        self.name = [self valueOrNilForKeyPath:@"display_name"];
        self.bio = [self valueOrNilForKeyPath:@"bio"];
    }
    return self;
}

+ (NSMutableArray *) superheroinesFromArray:(NSArray *)array {
    NSMutableArray *superheroines = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [superheroines addObject:[[Superheroine alloc] initWithDictionary:params]];
    }
    return superheroines;
}

@end
