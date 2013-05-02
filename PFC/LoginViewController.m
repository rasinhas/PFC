//
//  LoginViewController.m
//  PFC
//
//  Created by Felipe Rasinhas on 3/5/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterFormViewController.h"
#import "MainViewController.h"

@interface LoginViewController () {
    
}

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.userText setDelegate:self];
    [self.passText setDelegate:self];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender
{
    //_greetingLabel.text = [NSString stringWithFormat:@"Hello %@", _userText.text];
    //TODO: validacao
    UIViewController *main = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    [self presentViewController:main animated:YES completion:nil];
}

- (IBAction)registerUser:(id)sender
{
    UIViewController *registerForm = [[RegisterFormViewController alloc] initWithNibName:@"RegisterFormViewController" bundle:nil];
    [self presentViewController:registerForm animated:YES completion:nil];
}

@end
