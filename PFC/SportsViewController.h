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
- (IBAction)footballFilter:(id)sender;
- (IBAction)basketballFilter:(id)sender;
- (IBAction)volleyBallFilter:(id)sender;
- (IBAction)olympicFilter:(id)sender;
- (IBAction)back:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *neighTextField;

@end
