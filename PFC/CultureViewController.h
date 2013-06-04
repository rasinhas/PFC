//
//  CultureViewController.h
//  PFC
//
//  Created by Felipe Rasinhas on 5/3/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyUIViewController.h"

@interface CultureViewController : MyUIViewController <UITextFieldDelegate>
- (IBAction)back:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *neighTextField;

@end
