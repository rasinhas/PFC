//
//  UtilitiesViewController.m
//  PFC
//
//  Created by Felipe Rasinhas on 4/30/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import "UtilitiesViewController.h"

@interface UtilitiesViewController ()

@end

@implementation UtilitiesViewController

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
    [self.neighTextField setDelegate:self];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (BOOL) isValid {
    if([self.neighTextField.text isEqualToString:@""]) {
        return NO;
    } else {
        return YES;
    }
    
}

- (void) showError {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter the desired search Neighbourhood" delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil];
    [alert show];
}

- (IBAction)policeFilter:(id)sender {
    if([self isValid]) {
        
    } else {
        [self showError];
    }
}

- (IBAction)firemanFilter:(id)sender {
    if([self isValid]) {
        
    } else {
        [self showError];
    }
}

- (IBAction)hospitalFilter:(id)sender {
    if([self isValid]) {
        
    } else {
        [self showError];
    }
}


@end
