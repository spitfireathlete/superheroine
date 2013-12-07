//
//  APIClient.m
//  Superheroine
//
//  Created by Nidhi Kulkarni on 12/6/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "APIClient.h"

@implementation APIClient

static NSString * const BASE_URL = @"http://localhost:3000/";

+ (APIClient *)sharedClient {
    static APIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURL *baseURL = [NSURL URLWithString:BASE_URL];
        
        _sharedClient = [[APIClient alloc] initWithBaseURL:baseURL sessionConfiguration:nil];
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
        
    });
    
    return _sharedClient;
}

@end
