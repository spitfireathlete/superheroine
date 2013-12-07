//
//  RestObject.m
//  Superheroine
//
//  Created by Nidhi Kulkarni on 12/6/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "RestObject.h"

@implementation RestObject

- (id)initWithDictionary:(NSDictionary *)data {
    if (self = [super init]) {
        _data = data;
    }
    
    return self;
}

- (id)objectForKey:(id)key {
    return [_data objectForKey:key];
}

- (id)valueOrNilForKeyPath:(NSString *)keyPath {
    return [_data valueForKeyPath:keyPath];
}

@end
