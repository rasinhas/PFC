//
//  CultureViewController.m
//  PFC
//
//  Created by Felipe Rasinhas on 5/3/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#include "CultureViewController.h"

@interface CultureViewController ()

@end

@implementation CultureViewController

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

- (IBAction)hotelFilter:(id)sender {
    NSDictionary *query = @{
                            @"db": @"visitar-rio",
                            @"dataset": @"onde-dormir",
                            @"query_dict":@{
                                    @"neighbourhood": self.neighTextField.text,
                                    },
                            @"extras": @{
                                    @"type": @[@"Hot",],
                                    @"price": self.priceLabel.text,
                                    },
                            };
    [self makeRequest:query];
}

- (IBAction)hostelFilter:(id)sender {
    NSDictionary *query = @{
                            @"db": @"visitar-rio",
                            @"dataset": @"onde-dormir",
                            @"query_dict":@{
                                    @"neighbourhood": self.neighTextField.text,
                                    },
                            @"extras": @{
                                    @"type": @[@"Host",],
                                    @"price": self.priceLabel.text,
                                    },
                            };
    [self makeRequest:query];
}

- (IBAction)bebFilter:(id)sender {
    NSDictionary *query = @{
                            @"db": @"visitar-rio",
                            @"dataset": @"onde-dormir",
                            @"query_dict":@{
                                    @"neighbourhood": self.neighTextField.text,
                                    },
                            @"extras": @{
                                    @"type": @[@"Cama",],
                                    @"price": self.priceLabel.text,
                                    },
                            };
    [self makeRequest:query];
}

- (IBAction)innFilter:(id)sender {
    NSDictionary *query = @{
                            @"db": @"visitar-rio",
                            @"dataset": @"onde-dormir",
                            @"query_dict":@{
                                    @"neighbourhood": self.neighTextField.text,
                                    },
                            @"extras": @{
                                    @"type": @[@"Pousada",],
                                    @"price": self.priceLabel.text,
                                    },
                            };
    [self makeRequest:query];
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
