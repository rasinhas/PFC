//
//  MyUIViewController.h
//  PFC
//
//  Created by Felipe Rasinhas on 5/2/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyUIViewController : UIViewController

- (BOOL) isValid: (UITextField *) textField;
- (void) showNeighbourhoodError;
- (void)prettify:(UIButton *)button;
- (void)changeColor:(UIButton *)button ofIndex:(int)index;

@end
