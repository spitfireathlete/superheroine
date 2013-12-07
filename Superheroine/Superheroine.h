//
//  Superheroine.h
//  Superheroine
//
//  Created by Nidhi Kulkarni on 12/6/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "RestObject.h"
#import "Superpower.h"

@interface Superheroine : RestObject

@property (nonatomic, strong) NSString *objectId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *bio;
@property (nonatomic, strong) NSString *displayName;

@property (nonatomic, strong) NSArray *superpowers;
@property (nonatomic, strong) UIImage *superheroineImage;

+ (NSMutableArray *)superheroinesFromArray:(NSArray *)array;

@end
