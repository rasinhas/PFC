//
//  SportsViewController.h
//  PFC
//
//  Created by Felipe Rasinhas on 5/3/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyUIViewController.h"

@interface SportsViewController : MyUIViewController <UITextFieldDelegate>
- (IBAction)theaterFilter:(id)sender;
- (IBAction)nightFilter:(id)sender;
- (IBAction)artsFilter:(id)sender;
- (IBAction)freeTimeFilter:(id)sender;
- (IBAction)back:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *neighTextField;
@property (weak, nonatomic) IBOutlet UISlider *priceSlider;
- (IBAction)setValue:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
