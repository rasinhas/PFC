//
//  LoginViewController.m
//  PFC
//
//  Created by Felipe Rasinhas on 3/5/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#include "LoginViewController.h"


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
    NSString *server = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"Server IP"];
    NSString *full_url = [NSString stringWithFormat:@"http://%@:8000/webservice/login/", server];
    
    NSURL *url = [NSURL URLWithString:[full_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    ASIFormDataRequest *request = [ ASIFormDataRequest requestWithURL:url];
    [request setRequestMethod:@"POST"];
    [request setDelegate:self];
    [request addRequestHeader:@"X-Requested-With" value:@"XMLHttpRequest"];
    [request setPostValue:self.userText.text forKey:@"username"];
    [request setPostValue:self.passText.text forKey:@"password"];
    [request startAsynchronous];
}


- (void) requestFailed:(ASIHTTPRequest *)request
{
    [self showError:@"Network connection problem."];
}

- (void) requestFinished:(ASIHTTPRequest *)request
{
    if ([[[[request responseString] JSONValue] valueForKey:@"success"] boolValue] == YES) {
        
        UIViewController *main = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
        NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
        NSDictionary *response = [[request responseString] JSONValue];
        int uid = [[ response valueForKey:@"uid"] integerValue];
        NSDictionary *preferences = [response valueForKey:@"preferences"];
        [data setObject:self.userText.text forKey:@"username"];
        [data setInteger:uid forKey:@"uid"];
        [data setObject:preferences forKey:@"preferences"];
        [self presentViewController:main animated:YES completion:nil];
        
    } else {
        [self showError: @"Invalid username and password."];
    }
}


- (IBAction)registerUser:(id)sender
{
    UIViewController *registerForm = [[RegisterFormViewController alloc] initWithNibName:@"RegisterFormViewController" bundle:nil];
    [self presentViewController:registerForm animated:YES completion:nil];
}

@end
