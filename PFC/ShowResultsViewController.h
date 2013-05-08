//
//  ShowResultsViewController.h
//  PFC
//
//  Created by Felipe Rasinhas on 5/7/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowResultsViewController : UITableViewController

@property (strong, nonatomic) NSArray *results;
- (IBAction)back:(id)sender;

@end
