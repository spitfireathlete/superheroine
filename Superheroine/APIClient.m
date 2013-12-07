//
//  APIClient.m
//  Superheroine
//
//  Created by Nidhi Kulkarni on 12/6/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "APIClient.h"
#import "AFURLResponseSerialization.h"
#import "AFHTTPRequestOperationManager.h"
#import "CredentialStore.h"

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

- (void) getAllCardsOnSuccess:(void (^)(AFHTTPRequestOperation *operation, id response))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager GET:[NSString stringWithFormat:@"%@api/cards.json", BASE_URL] parameters:[self setAuthToken:nil] success:success failure:failure];
    
}

- (void) getAllSuperheroinesOnSuccess:(void (^)(AFHTTPRequestOperation *operation, id response))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager GET:[NSString stringWithFormat:@"%@api/superheroines.json", BASE_URL] parameters:[self setAuthToken:nil] success:success failure:failure];
    
}

- (void) favoriteCard:(Card *) card success:(void (^)(AFHTTPRequestOperation *operation, id response)) success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager PUT:[NSString stringWithFormat:@"%@api/api/cards/%@/favorite", BASE_URL, card.objectId] parameters:[self setAuthToken:nil] success:success failure:failure];
    
}

- (void) shareCard:(Card *) card success:(void (^)(AFHTTPRequestOperation *operation, id response)) success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager PUT:[NSString stringWithFormat:@"%@api/api/cards/%@/share", BASE_URL, card.objectId] parameters:[self setAuthToken:nil] success:success failure:failure];
    
}

- (void) createCard:(Card *) card withImage:(NSString *)imageString withAlterEgo:(Superheroine*) superheroine success:(void (^)(AFHTTPRequestOperation *operation, id response)) success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager POST:[NSString stringWithFormat:@"%@api/api/cards", BASE_URL] parameters:[self setAuthToken:@{@"photoData": imageString, @"superheroine_name":superheroine.name}] success:success failure:failure];
    
}

- (NSDictionary *) setAuthToken: (NSDictionary *) params {
    NSMutableDictionary *paramsWithAuth = [[NSMutableDictionary alloc] initWithDictionary: params];

    [paramsWithAuth setObject:@"ztF8CSsD-yJeDQs8sMcf" forKey:@"auth_token"];
//    CredentialStore *creds = [[CredentialStore alloc] init];
//    [paramsWithAuth setObject:[creds authToken] forKey:@"auth_token"];


// Nidhi Token
//    [paramsWithAuth setObject:@"1hxcxs5zaENK6bvj3rxF" forKey:@"auth_token"];
//    CredentialStore *creds = [[CredentialStore alloc] init];
//    [paramsWithAuth setObject:[creds authToken] forKey:@"auth_token"];
    return paramsWithAuth;

}

@end
