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


@interface APIClient : AFHTTPSessionManager

+ (APIClient *)sharedClient;

@end
