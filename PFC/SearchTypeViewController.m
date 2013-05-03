//
//  SearchTypeViewController.m
//  PFC
//
//  Created by Felipe Rasinhas on 4/30/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import "SearchTypeViewController.h"
#import "UtilitiesViewController.h"
#import "RestaurantsViewController.h"
#import "SportsViewController.h"

@interface SearchTypeViewController ()

@end

@implementation SearchTypeViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)utilitiesView:(id)sender {
    UIViewController *utilities = [[UtilitiesViewController alloc] initWithNibName:@"UtilitiesViewController" bundle:nil];
    [self presentViewController:utilities animated:YES completion:nil];
}

- (IBAction)restaurantsView:(id)sender {
    UIViewController *restaurants = [[RestaurantsViewController alloc] initWithNibName:@"RestaurantsViewController" bundle:nil];
    [self presentViewController:restaurants animated:YES completion:nil];
}

- (IBAction)sportsView:(id)sender {
    UIViewController *sports = [[SportsViewController alloc] initWithNibName:@"SportsViewController" bundle:nil];
    [self presentViewController:sports animated:YES completion:nil];
}

- (IBAction)cultureView:(id)sender {
}

- (IBAction)returnMenu:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
