//
//  RestaurantsViewController.m
//  PFC
//
//  Created by Felipe Rasinhas on 4/30/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#include "RestaurantsViewController.h"

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
    [self prettify:self.fastFoodOutlet];
    [self prettify:self.restaurantsOutlet];
    [self prettify:self.barsOutlet];
    [self.neighTextField setDelegate:self];
    
    NSDictionary *restaurant_preferences = [[[NSUserDefaults standardUserDefaults] valueForKey:@"preferences"] valueForKey:@"restaurant"];
    
    [self.neighTextField setText: [restaurant_preferences valueForKey:@"neighbourhood"]];
    self.priceLabel.text = [restaurant_preferences valueForKey:@"price"];
    self.priceSlider.value = self.priceLabel.text.length;
    
    NSString *v = [[NSString alloc] initWithString: [restaurant_preferences valueForKey:@"type"]];
    if ([v isEqualToString:@"fastfood"]) {
        [self changeFastFood:self];
    }
    if ([v isEqualToString:@"restaurants"]) {
        [self changeRestaurants:self];
    }
    if ([v isEqualToString:@"bars"]) {
        [self changeBars:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)changeFastFood:(id)sender {
    [self changeColor:self.fastFoodOutlet];
}

- (IBAction)changeRestaurants:(id)sender {
    [self changeColor:self.restaurantsOutlet];
}

- (IBAction)changeBars:(id)sender {
    [self changeColor:self.barsOutlet];
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
    NSMutableArray *selected = [[NSMutableArray alloc] init];

    if(self.restaurantsOutlet.selected) {
        [selected addObject:@"Restaurantes"];
    } else if(self.barsOutlet.selected) {
        [selected addObject:@"Bares"];
    } else if(self.fastFoodOutlet.selected) {
        [selected addObject:@"Lanchonetes"];
        [selected addObject:@"Confeitarias"];
    } else {
        errors = [NSString stringWithFormat:@"%@\nPlease select at least one type of shop.", errors];
    }
    
    // TODO : server filter
    if([ errors isEqualToString:@"" ]) {
        NSDictionary *query = @{
                                @"db": @"visitar-rio",
                                @"dataset": @"onde-comer",
                                @"query_dict":@{
                                        @"neighbourhood": self.neighTextField.text,
                                        },
                                @"extras":@{
                                        @"price": self.priceLabel.text,
                                        @"type": selected,
                                        },
                                };
        [self makeRequest:query];
    } else {
        [self showError:errors];
    }

}
@end
