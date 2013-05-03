//
//  RestaurantsViewController.m
//  PFC
//
//  Created by Felipe Rasinhas on 4/30/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import "RestaurantsViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface RestaurantsViewController ()

@end

@implementation RestaurantsViewController

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
    [self prettify:self.baconOutlet];
    [self prettify:self.fastFoodOutlet];
    [self prettify:self.restaurantsOutlet];
    [self prettify:self.barsOutlet];
    [self.neighTextField setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)changeBacon:(id)sender {
    [self changeColor:self.baconOutlet ofIndex:0];
}

- (IBAction)changeFastFood:(id)sender {
    [self changeColor:self.fastFoodOutlet ofIndex:1];
}

- (IBAction)changeRestaurants:(id)sender {
    [self changeColor:self.restaurantsOutlet ofIndex:2];
}

- (IBAction)changeBars:(id)sender {
    [self changeColor:self.barsOutlet ofIndex:3];
}
- (IBAction)setValue:(id)sender {
    int range = (int)(self.priceSlider.value+0.5);
    self.priceSlider.value = range;
    NSString *text;
    switch (range) {
        case 1:
            text = @"$";
            break;
        case 2:
            text = @"$$";
            break;
        case 3:
            text = @"$$$";
            break;
        default:
            break;
    };
    self.priceLabel.text = text;
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)search:(id)sender {
    NSString *errors = @"";
    if([self isValid:self.neighTextField]){
        
    } else {
        errors = [NSString stringWithFormat:@"%@\n%@", errors, self.NeighbourhoodErrorMessage];
    }
    
    if(self.baconOutlet.selected) {
    } else if(self.restaurantsOutlet.selected) {
    } else if(self.barsOutlet.selected) {
    } else if(self.fastFoodOutlet.selected) {
    } else {
        errors = [NSString stringWithFormat:@"%@\nPlease select at least one type of shop.", errors];
    }
    
    if([ errors isEqualToString:@"" ]) {
        //TODO:Integração
    } else {
        [self showError:errors];
    }
}
@end
