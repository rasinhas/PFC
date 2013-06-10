//
//  ManagePreferencesViewController.m
//  PFC
//
//  Created by Jonathan Carvalhosa on 6/10/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#include "ManagePreferencesViewController.h"

@interface ManagePreferencesViewController ()

@end

@implementation ManagePreferencesViewController

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
    self.utilityNeighTextField.delegate = self;
    self.restaurantNeighTextField.delegate = self;
    self.restaurantPriceTextField.delegate = self;
    self.restaurantTypeTextField.delegate = self;
    self.innNeighTextField.delegate = self;
    self.innPriceTextField.delegate = self;
    self.entertainmentNeighTextField.delegate = self;
    self.entertainmentPriceTextField.delegate = self;
    
    
    self.preferences = [[NSUserDefaults standardUserDefaults] valueForKey:@"preferences"];
    self.utilityNeighTextField.text = [[self.preferences objectForKey:@"utility"] valueForKey:@"neighbourhood"];
    self.restaurantNeighTextField.text = [[self.preferences objectForKey:@"restaurant"] valueForKey:@"neighbourhood"];
    self.restaurantPriceTextField.text = [[self.preferences objectForKey:@"restaurant"] valueForKey:@"price"];
    self.restaurantTypeTextField.text = [[self.preferences objectForKey:@"restaurant"] valueForKey:@"type"];
    self.innNeighTextField.text = [[self.preferences objectForKey:@"inn"] valueForKey:@"neighbourhood"];
    self.innPriceTextField.text = [[self.preferences objectForKey:@"inn"] valueForKey:@"price"];
    self.entertainmentNeighTextField.text = [[self.preferences objectForKey:@"entertainment"] valueForKey:@"neighbourhood"];
    self.entertainmentPriceTextField.text = [[self.preferences objectForKey:@"entertainment"] valueForKey:@"price"];

    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)savePreferences:(id)sender {
    self.preferences = @{
        @"utility": @{
            @"neighbourhood": self.utilityNeighTextField.text,
        },
        @"restaurant": @{
            @"neighbourhood": self.restaurantNeighTextField.text,
            @"price": self.restaurantPriceTextField.text,
            @"type": self.restaurantTypeTextField.text,
        },
        @"inn": @{
            @"neighbourhood": self.innNeighTextField.text,
            @"price": self.innPriceTextField.text,
        },
        @"entertainment": @{
            @"neighbourhood": self.entertainmentNeighTextField.text,
            @"price": self.entertainmentPriceTextField.text,
        },
    };
    
    NSString *server = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"Server IP"];
    NSString *full_url = [NSString stringWithFormat:@"http://%@:8000/webservice/save_preferences/", server];
    
    NSURL *url = [NSURL URLWithString:[full_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    ASIFormDataRequest *request = [ ASIFormDataRequest requestWithURL:url];
    [request setRequestMethod:@"POST"];
    [request setDelegate:self];
    [request addRequestHeader:@"X-Requested-With" value:@"XMLHttpRequest"];
    [request setPostValue:[self.preferences JSONRepresentation] forKey:@"preferences"];
    [request setPostValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"uid"] forKey:@"uid"];
    [request startAsynchronous];
}

-(void) requestFailed:(ASIHTTPRequest *)request
{
    [self showError:@"Network connection problem."];
}

-(void) requestFinished:(ASIHTTPRequest *)request
{
    if([[[[request responseString] JSONValue] valueForKey:@"success"] boolValue] == YES) {
        [[NSUserDefaults standardUserDefaults] setValue:self.preferences forKey:@"preferences"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Preference Update" message:@"Your preferences were successfully updated" delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil];
        [alert show];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self showError:@"Internal Server Error."];
    }
    
}

@end
