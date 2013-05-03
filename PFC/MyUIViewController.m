//
//  MyUIViewController.m
//  PFC
//
//  Created by Felipe Rasinhas on 5/2/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import "MyUIViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MyUIViewController ()

@end

@implementation MyUIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    //Declarando mensagens de erro
    self.neighbourhoodErrorMessage = @"Please enter the desired search Neighbourhood.";
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL) isValid:(UITextField *)textField
{
    if([textField.text isEqualToString:@""]) {
        return NO;
    } else {
        return YES;
    }
    
}

- (void) showError:(NSString *)errorMessage
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:errorMessage delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil];
    [alert show];
}

- (void)changeColor:(UIButton *)button ofIndex:(int)index
{
    button.selected = 1-button.selected;
    if (button.selected) {
        [self setNegativeButtonColor:button];
    } else {
        [self setDefaultButtonColor:button];
    }
}

- (void) setDefaultButtonColor:(UIButton *)button
{
    button.layer.backgroundColor = [UIColor whiteColor].CGColor;
    [button setTitleColor:[UIColor colorWithRed:(50.0/255) green:(79.0/255) blue:(133.0/255) alpha:1.0] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:(50.0/255) green:(79.0/255) blue:(133.0/255) alpha:1.0] forState:UIControlStateHighlighted];
}

- (void) setNegativeButtonColor:(UIButton *)button
{
    button.layer.backgroundColor = [UIColor colorWithRed:(50.0/255) green:(79.0/255) blue:(133.0/255) alpha:1.0].CGColor;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void)prettify:(UIButton *)button
{
    button.layer.borderWidth = 0.5f;
    button.layer.cornerRadius = 10.0f;
    button.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    [self setDefaultButtonColor:button];
}

- (BOOL) shouldAutorotate
{
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
