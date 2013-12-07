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
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *bio;
@property (nonatomic, strong) NSString *facts;
@property (nonatomic, strong) NSString *advice;
@property (nonatomic, strong) NSString *goals;
@property (nonatomic, strong) NSString *quotes;
@property (nonatomic, strong) NSString *numFaves;
@property (nonatomic, strong) NSString *numShares;
@property (nonatomic, strong) NSArray *videos;
@property (nonatomic, strong) NSURL *videoLink;
@property (nonatomic, strong) NSString *twitterHandle;

@property (nonatomic, strong) Superheroine *alterEgo;

+ (NSMutableArray *)cardsFromArray:(NSArray *)array;

@end
