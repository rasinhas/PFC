//
//  EditProfileViewController.m
//  PFC
//
//  Created by Felipe Rasinhas on 4/1/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import "EditProfileViewController.h"
#import "JSON.h"
#import "ASIHTTPRequest.h"

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController

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
    [self.oldPassField setDelegate:self];
    [self.passwordField setDelegate:self];
    [self.confirmField setDelegate:self];
    [self.emailField setDelegate:self];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveProfile:(id)sender {
    //TODO: validacao e conexao com nosso servidor
    if(![_passwordField.text isEqualToString: _confirmField.text])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The password confirmation and password are different. Please correct it." delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        NSString *server = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"Server IP"];
        NSString *full_url = [NSString stringWithFormat:@"http://%@:8000/webservice/edit_profile/", server];
        
        NSURL *url = [NSURL URLWithString:[full_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        ASIFormDataRequest *request = [ ASIFormDataRequest requestWithURL:url];
        [request setRequestMethod:@"POST"];
        [request setDelegate:self];
        [request addRequestHeader:@"X-Requested-With" value:@"XMLHttpRequest"];
        NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
        [request setPostValue:[data stringForKey:@"username"] forKey:@"username"];
        [request setPostValue:self.oldPassField forKey:@"old_password"];
        [request setPostValue:self.passwordField.text forKey:@"new_password"];
        [request setPostValue:self.emailField.text forKey:@"email"];
        
        [request startSynchronous];
        if([[[[request responseString] JSONValue] valueForKey:@"success"] boolValue] == YES) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Profile updated" message:@"The profile was successfully updated" delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil];
            [alert show];
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The old password does not match with your current password." delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil];
            [alert show];
        }
    }

}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
