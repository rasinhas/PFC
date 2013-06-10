//
//  ManagePreferencesViewController.m
//  PFC
//
//  Created by Jonathan Carvalhosa on 6/10/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import "ManagePreferencesViewController.h"

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
    [self.utilityNeighTextField setDelegate:self];
    [self.restaurantNeighTextField setDelegate:self];
    [self.restaurantPriceTextField setDelegate:self];
    [self.restaurantTypeTextField setDelegate:self];
    [self.innNeighTextField setDelegate:self];
    [self.innPriceTextField setDelegate:self];
    [self.entertainmentNeighTextField setDelegate:self];
    [self.entertainmentPriceTextField setDelegate:self];
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

@end
