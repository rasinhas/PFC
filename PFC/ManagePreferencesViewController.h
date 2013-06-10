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

@interface ManagePreferencesViewController : MyUIViewController <UITextFieldDelegate>
- (IBAction)cancel:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *utilityNeighTextField;
@property (weak, nonatomic) IBOutlet UITextField *restaurantNeighTextField;
@property (weak, nonatomic) IBOutlet UITextField *restaurantPriceTextField;
@property (weak, nonatomic) IBOutlet UITextField *restaurantTypeTextField;
@property (weak, nonatomic) IBOutlet UITextField *innNeighTextField;
@property (weak, nonatomic) IBOutlet UITextField *innPriceTextField;
@property (weak, nonatomic) IBOutlet UITextField *entertainmentNeighTextField;
@property (weak, nonatomic) IBOutlet UITextField *entertainmentPriceTextField;
@property (strong, nonatomic) NSDictionary *preferences;
- (IBAction)savePreferences:(id)sender;

@end
