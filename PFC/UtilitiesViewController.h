//
//  UtilitiesViewController.h
//  PFC
//
//  Created by Felipe Rasinhas on 4/30/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyUIViewController.h"

@interface UtilitiesViewController : MyUIViewController <UITextFieldDelegate>

- (IBAction)back:(id)sender;
- (IBAction)policeFilter:(id)sender;
- (IBAction)firemanFilter:(id)sender;
- (IBAction)hospitalFilter:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *neighTextField;


@end
