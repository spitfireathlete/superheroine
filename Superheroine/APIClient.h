//
//  APIClient.h
//  Superheroine
//
//  Created by Nidhi Kulkarni on 12/6/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"
#import "AFHTTPSessionManager.h"
#import "Card.h"
#import "Superheroine.h"


@interface APIClient : AFHTTPSessionManager

+ (APIClient *)sharedClient;

- (void) getAllCardsOnSuccess:(void (^)(AFHTTPRequestOperation *operation, id response))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure;

- (void) getAllSuperheroinesOnSuccess:(void (^)(AFHTTPRequestOperation *operation, id response))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure;

- (void) favoriteCard:(Card *) card success:(void (^)(AFHTTPRequestOperation *operation, id response)) success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void) shareCard:(Card *) card success:(void (^)(AFHTTPRequestOperation *operation, id response)) success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
