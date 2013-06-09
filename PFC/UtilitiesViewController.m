//
//  UtilitiesViewController.m
//  PFC
//
//  Created by Felipe Rasinhas on 4/30/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#include "UtilitiesViewController.h"

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
    NSDictionary *preferences = [[NSUserDefaults standardUserDefaults] valueForKey:@"preferences"];
    [self.neighTextField setText: [[preferences valueForKey:@"utility"] valueForKey:@"neighbourhood"]];

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


- (IBAction)policeFilter:(id)sender {
    NSDictionary *query = @{
        @"db": @"infraestruturas",
        @"dataset": @"delegacias-policiais",
        @"query_dict":@{
            @"neighbourhood": self.neighTextField.text,
        },
        @"extras": @{},
    };
    [self makeRequest:query];
}

- (IBAction)firemanFilter:(id)sender {
    NSDictionary *query = @{
        @"db": @"infraestruturas",
        @"dataset": @"corpos-bombeiros",
        @"query_dict":@{
            @"neighbourhood": self.neighTextField.text,
        },
        @"extras": @{},
    };
    [self makeRequest:query];

}

- (IBAction)hospitalFilter:(id)sender {
    NSDictionary *query = @{
        @"db": @"infraestruturas",
        @"dataset": @"unidades-saude",
        @"query_dict":@{
            @"neighbourhood": self.neighTextField.text,
        },
        @"extras": @{},
    };
    [self makeRequest:query];
}

@end
