//
//  CreateCardViewController.h
//  Superheroine
//
//  Created by Erin Parker on 12/5/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Card;

@protocol CardCreationDelegate <NSObject>
- (void) cardCreationViewControllerDismissed: (Card *)card;
@end

@interface CreateCardViewController : UIViewController <UIScrollViewDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    __unsafe_unretained id myDelegate;
}

@property (nonatomic, assign) id <CardCreationDelegate> myDelegate;

@end
