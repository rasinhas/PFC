//
//  MapViewAnnotation.h
//  PFC
//
//  Created by Felipe Rasinhas on 5/8/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapViewAnnotation : NSObject <MKAnnotation>

@property (nonatomic,copy) NSString *title;
@property (nonatomic,readonly) CLLocationCoordinate2D coordinate;

- (id)initWithTitle: (NSString *)ttl andCoordinate: (CLLocationCoordinate2D)c2d;

@end
