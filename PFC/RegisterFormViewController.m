//
//  RegisterFormViewController.m
//  PFC
//
//  Created by Felipe Rasinhas on 4/1/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import "RegisterFormViewController.h"

@interface RegisterFormViewController ()

@end

@implementation RegisterFormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.confirmField setDelegate:self];
    [self.passwordField setDelegate:self];
    [self.loginField setDelegate:self];
    [self.emailField setDelegate:self];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createUser:(id)sender
{
    //TODO: validacao e conexao com nosso servidor
    if(![_passwordField.text isEqualToString: _confirmField.text])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The password confirmation and password are different. Please correct it." delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"User Registered" message:@"The user was successfully created" delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil];
        [alert show];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)textFieldFinishedWithKeyBoard:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
