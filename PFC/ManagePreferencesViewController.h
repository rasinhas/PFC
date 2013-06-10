//
//  ManagePreferencesViewController.h
//  PFC
//
//  Created by Jonathan Carvalhosa on 6/10/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "JSON.h"
#import "MyUIViewController.h"

@interface ManagePreferencesViewController : MyUIViewController <ASIHTTPRequestDelegate, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
- (IBAction)cancel:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *utilityNeighTextField;
@property (weak, nonatomic) IBOutlet UITextField *restaurantNeighTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *restaurantPriceControlField;

@property (weak, nonatomic) IBOutlet UITextField *restaurantTypeTextField;
@property (weak, nonatomic) IBOutlet UITextField *innNeighTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *innPriceControlField;

@property (weak, nonatomic) IBOutlet UITextField *entertainmentNeighTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *entertainmentPriceControlField;

@property (strong, nonatomic) NSDictionary *preferences;
- (IBAction)savePreferences:(id)sender;

@property (weak, nonatomic) IBOutlet UIPickerView *typePicker;

@property (strong, nonatomic) NSArray *restaurant_types;
- (IBAction)enableRestaurantTypes:(id)sender;

@end
