//
//  MapViewController.m
//  PFC
//
//  Created by Felipe Rasinhas on 5/8/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import "MapViewController.h"
#import "MapViewAnnotation.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CLLocationCoordinate2D location;
    location.longitude = [[self.data valueForKey:@"longitude"] doubleValue];
    location.latitude = [[self.data valueForKey:@"latitude"] doubleValue];
    MapViewAnnotation *newAnnotation = [[MapViewAnnotation alloc] initWithTitle:[self.data objectForKey:@"name"] andCoordinate:location];
    [self.mapView addAnnotation:newAnnotation];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
{
    MKAnnotationView *annotationView = [views objectAtIndex:0];
    id <MKAnnotation> mp = [annotationView annotation];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mp coordinate],100,100);
    [mv setRegion:region animated:YES];
    [mv selectAnnotation:mp animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
