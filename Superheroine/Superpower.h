//
//  Superpower.h
//  Superheroine
//
//  Created by Nidhi Kulkarni on 12/6/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "RestObject.h"

@interface Superpower : RestObject

@property (nonatomic, strong) NSString *objectId;

+ (NSMutableArray *)superpowersFromArray:(NSArray *)array;

@end
