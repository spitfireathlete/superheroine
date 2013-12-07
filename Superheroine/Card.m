//
//  Card.m
//  Superheroine
//
//  Created by Nidhi Kulkarni on 12/6/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "Card.h"
#import "Superheroine.h"

@implementation Card

- (id) initWithDictionary:(NSDictionary *)data {
    if (self = [super initWithDictionary:data]) {
        self.alterEgo = [[Superheroine alloc] initWithDictionary:[self valueOrNilForKeyPath:@"superheroine"]];
        self.objectId = [self valueOrNilForKeyPath:@"id"];
    }
    return self;
}

+ (NSMutableArray *) cardsFromArray:(NSArray *) array {
    NSMutableArray *cards = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [cards addObject:[[Card alloc] initWithDictionary:params]];
    }
    return cards;
}

@end
