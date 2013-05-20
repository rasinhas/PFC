//
//  RestaurantsViewController.m
//  PFC
//
//  Created by Felipe Rasinhas on 4/30/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import "RestaurantsViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "SearchTypeViewController.h"

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
    NSString *query2 = @"";
    
    if([self isValid:self.neighTextField] == NO){
        errors = [NSString stringWithFormat:@"%@\n%@", errors, self.NeighbourhoodErrorMessage];
    } else {
        if(self.baconOutlet.selected) {
            query2 = @"bacon";
        } else if(self.restaurantsOutlet.selected) {
            query2 = @"restaurants";
        } else if(self.barsOutlet.selected) {
            query2 = @"bars";
        } else if(self.fastFoodOutlet.selected) {
            query2 = @"fastfood";
        } else {
            errors = [NSString stringWithFormat:@"%@\nPlease select at least one type of shop.", errors];
        }
    }
    
    // TODO : server filter
    if([ errors isEqualToString:@"" ]) {
        NSDictionary *query = @{
                                @"db": @"visitar-rio",
                                @"dataset": @"onde-comer",
                                @"query_dict":@{
                                        @"neighbourhood": self.neighTextField.text,
                                        },
                                };
        [self showResults: [self getResults:query]];
    } else {
        [self showError:errors];
    }

}
@end
