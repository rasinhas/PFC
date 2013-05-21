//
//  LoginViewController.h
//  PFC
//
//  Created by Felipe Rasinhas on 3/5/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyUIViewController.h"

@interface LoginViewController : MyUIViewController <UITextFieldDelegate>
- (IBAction)login:(id)sender;
- (IBAction)registerUser:(id)sender;



@property (weak, nonatomic) IBOutlet UITextField *passText;
@property (weak, nonatomic) IBOutlet UITextField *userText;

@end
