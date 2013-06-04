//
//  SportsViewController.m
//  PFC
//
//  Created by Felipe Rasinhas on 5/3/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#include "SportsViewController.h"

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

- (IBAction)theaterFilter:(id)sender {
    NSDictionary *query = @{
                            @"db": @"visitar-rio",
                            @"dataset": @"o-que-fazer",
                            @"query_dict":@{
                                    @"neighbourhood": self.neighTextField.text,
                                    },
                            @"extras": @{
                                        @"type": @[@"Teatro",],
                                        @"price": self.priceLabel.text,
                                    },
                            };
    [self makeRequest:query];
}

- (IBAction)nightFilter:(id)sender {
    NSDictionary *query = @{
                            @"db": @"visitar-rio",
                            @"dataset": @"o-que-fazer",
                            @"query_dict":@{
                                        @"neighbourhood": self.neighTextField.text,
                                    },
                            @"extras": @{
                                        @"type": @[@"Shows", @"Para Dan"],
                                        @"price": self.priceLabel.text,
                                    },
                            };
    [self makeRequest:query];
}

- (IBAction)artsFilter:(id)sender {
    NSDictionary *query = @{
                            @"db": @"visitar-rio",
                            @"dataset": @"o-que-fazer",
                            @"query_dict":@{
                                        @"neighbourhood": self.neighTextField.text,
                                    },
                            @"extras": @{
                                        @"type": @[ @"Artes"],
                                        @"price": self.priceLabel.text,
                                    },
                            };
    [self makeRequest:query];
}

- (IBAction)freeTimeFilter:(id)sender {
    NSDictionary *query = @{
                            @"db": @"visitar-rio",
                            @"dataset": @"o-que-fazer",
                            @"query_dict":@{
                                    @"neighbourhood": self.neighTextField.text,
                                    },
                            @"extras": @{
                                        @"type": @[@"Rio com", @"Compras", @"Culturais"],
                                        @"remove_type": @[@"Artes", @"Teatro"],
                                        @"price": self.priceLabel.text,
                                    },
                            };
    [self makeRequest:query];
}


- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end