//
//  MapViewController.m
//  PFC
//
//  Created by Felipe Rasinhas on 5/8/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#include "MapViewController.h"

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
    // TODO - tentar colocar a posicao do usuário e a do local na mesma tela no mapa (arrumar distancia)
    CLLocationCoordinate2D location;
    CLLocationCoordinate2D userLocation = [[self.mapView userLocation] coordinate];
    CLLocationCoordinate2D centerLocation;
    location.longitude = [[self.data valueForKey:@"longitude"] doubleValue];
    location.latitude = [[self.data valueForKey:@"latitude"] doubleValue];
    centerLocation.latitude = (location.latitude+userLocation.latitude)/2.0;
    centerLocation.longitude = (location.longitude+userLocation.longitude)/2.0;
    MapViewAnnotation *newAnnotation = [[MapViewAnnotation alloc] initWithTitle:[self.data objectForKey:@"name"] andCoordinate:location];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location,3000,3000);
    [self.mapView setRegion:region animated:YES];
    [self.mapView selectAnnotation:newAnnotation animated:YES];
    [self.mapView addAnnotation:newAnnotation];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
{
    MKAnnotationView *annotationView = [views objectAtIndex:0];
    id <MKAnnotation> mp = [annotationView annotation];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mp coordinate],500,500);
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
