//
//  SportsViewController.m
//  PFC
//
//  Created by Felipe Rasinhas on 5/3/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import "SportsViewController.h"

@interface SportsViewController ()

@end

@implementation SportsViewController

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

- (IBAction)footballFilter:(id)sender {
    if([self isValid:self.neighTextField]) {
        
    } else {
        [self showError:self.NeighbourhoodErrorMessage];
    }
}

- (IBAction)basketballFilter:(id)sender {
    if([self isValid:self.neighTextField]) {
        
    } else {
        [self showError:self.NeighbourhoodErrorMessage];
    }
}

- (IBAction)volleyBallFilter:(id)sender {
    if([self isValid:self.neighTextField]) {
        
    } else {
        [self showError:self.NeighbourhoodErrorMessage];
    }
}

- (IBAction)olympicFilter:(id)sender {
    if([self isValid:self.neighTextField]) {
        
    } else {
        [self showError:self.NeighbourhoodErrorMessage];
    }
}


- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end