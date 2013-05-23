//
//  RestaurantsViewController.h
//  PFC
//
//  Created by Felipe Rasinhas on 4/30/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyUIViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface RestaurantsViewController : MyUIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *baconOutlet;
@property (weak, nonatomic) IBOutlet UIButton *fastFoodOutlet;
@property (weak, nonatomic) IBOutlet UIButton *restaurantsOutlet;
@property (weak, nonatomic) IBOutlet UIButton *barsOutlet;
- (IBAction)changeBacon:(id)sender;
- (IBAction)changeFastFood:(id)sender;
- (IBAction)changeRestaurants:(id)sender;
- (IBAction)changeBars:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *neighTextField;
@property (weak, nonatomic) IBOutlet UISlider *priceSlider;
- (IBAction)setValue:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
- (IBAction)back:(id)sender;
- (IBAction)search:(id)sender;

@end
