//
//  SearchTypeViewController.h
//  PFC
//
//  Created by Felipe Rasinhas on 4/30/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyUIViewController.h"
#import "UtilitiesViewController.h"
#import "RestaurantsViewController.h"
#import "SportsViewController.h"

@interface SearchTypeViewController : MyUIViewController
- (IBAction)utilitiesView:(id)sender;
- (IBAction)restaurantsView:(id)sender;
- (IBAction)sportsView:(id)sender;
- (IBAction)cultureView:(id)sender;
- (IBAction)returnMenu:(id)sender;

@end
