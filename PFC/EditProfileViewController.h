//
//  EditProfileViewController.h
//  PFC
//
//  Created by Felipe Rasinhas on 4/1/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyUIViewController.h"

@interface EditProfileViewController : MyUIViewController <UITextFieldDelegate>
- (IBAction)saveProfile:(id)sender;
- (IBAction)cancel:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *oldPassField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *confirmField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;

@end
