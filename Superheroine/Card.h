//
//  Card.h
//  Superheroine
//
//  Created by Nidhi Kulkarni on 12/6/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "RestObject.h"
#import "Superheroine.h"

@interface Card : RestObject

@property (nonatomic, strong) NSString *objectId;
@property (nonatomic, strong) Superheroine *alterEgo;

+ (NSMutableArray *)cardsFromArray:(NSArray *)array;

@end
