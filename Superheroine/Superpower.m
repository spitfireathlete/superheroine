//
//  Superpower.m
//  Superheroine
//
//  Created by Nidhi Kulkarni on 12/6/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "Superpower.h"

@implementation Superpower

- (id) initWithDictionary:(NSDictionary *)data {
    if (self = [super initWithDictionary:data]) {
        NSLog(@"%@", data);

    }
    return self;
}

+ (NSMutableArray *)superpowersFromArray:(NSArray *)array {
    NSMutableArray *powers = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [powers addObject:[[Superpower alloc] initWithDictionary:params]];
    }
    return powers;
}

@end
