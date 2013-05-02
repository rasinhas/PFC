//
//  RegisterFormViewController.h
//  PFC
//
//  Created by Felipe Rasinhas on 4/1/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyUIViewController.h"

@interface RegisterFormViewController : MyUIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *loginField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *confirmField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
- (IBAction)createUser:(id)sender;
- (IBAction)textFieldFinishedWithKeyBoard:(id)sender;
- (IBAction)cancel:(id)sender;



@end
