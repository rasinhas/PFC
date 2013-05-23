//
//  ShowResultViewController.h
//  PFC
//
//  Created by Felipe Rasinhas on 5/8/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyUIViewController.h"
#import "TDBadgedCell/TDBadgedCell.h"
#import "MapViewController.h"

@interface ShowResultViewController : MyUIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSArray *results;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UITableView *resultsTable;
- (IBAction)back:(id)sender;


@end
