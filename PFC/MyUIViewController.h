//
//  MyUIViewController.h
//  PFC
//
//  Created by Felipe Rasinhas on 5/2/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"
#import <QuartzCore/QuartzCore.h>
#import "ShowResultViewController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "JSON.h"

@interface MyUIViewController : UIViewController <ASIHTTPRequestDelegate>

- (BOOL) isValid: (UITextField *) textField;
- (void) showError:(NSString *) errorMessage;
- (void) makeRequest:(NSDictionary *) args;
- (void)prettify:(UIButton *)button;
- (void)changeColor:(UIButton *)button ofIndex:(int)index;
- (void)notImplementedError;
@property (weak,nonatomic) NSString *NeighbourhoodErrorMessage;

@end
