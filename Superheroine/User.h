//
//  User.h
//  Superheroine
//
//  Created by Nidhi Kulkarni on 12/6/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "RestObject.h"

@interface User : RestObject

+ (User *)currentUser;
+ (void)setCurrentUser:(User *) currentUser;
+ (BOOL)userHasAccessToTwitter;

@end
