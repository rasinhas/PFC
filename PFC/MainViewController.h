//
//  MainViewController.h
//  PFC
//
//  Created by Felipe Rasinhas on 4/1/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyUIViewController.h"

@interface MainViewController : MyUIViewController
- (IBAction)editProfile:(id)sender;
- (IBAction)managePreferences:(id)sender;
- (IBAction)search:(id)sender;
- (IBAction)logout:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *greetingLabel;



@end
