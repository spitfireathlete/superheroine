//
//  CredentialStore.m
//  Superheroine
//
//  Created by Nidhi Kulkarni on 12/6/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "CredentialStore.h"
#import "SSKeychain.h"

#define SERVICE_NAME @"Superheroine-APIClient"
#define AUTH_TOKEN_KEY @"auth_token"

@implementation CredentialStore

- (NSString *)authToken {
    return [self secureValueForKey:AUTH_TOKEN_KEY];
}

- (void)setAuthToken:(NSString *)authToken {
    
    [self setSecureValue:authToken forKey:AUTH_TOKEN_KEY];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"superheroine-api-token-changed" object:self];
}

- (void)setSecureValue:(NSString *)value forKey:(NSString *)key {
    if (value) {
        [SSKeychain setPassword:value forService:SERVICE_NAME account:key];
    } else {
        [SSKeychain deletePasswordForService:SERVICE_NAME account:key];
    }
}

- (NSString *)secureValueForKey:(NSString *)key {
    return [SSKeychain passwordForService:SERVICE_NAME account:key];
}


@end
