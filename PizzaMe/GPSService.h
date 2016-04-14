//
//  GPSService.h
//  PizzaMe
//
//  Created by Md Adit Hasan on 4/4/16.
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@protocol GPSServiceDelegate <NSObject>

-(void)didSendPlaceMark:(CLPlacemark *)placemark;

@end

@interface GPSService : NSObject

+ (GPSService *)shareGPSService;

@property (nonatomic, strong) CLLocationManager* locationManager;

@property (nonatomic, strong) NSString *postCode;

@property (nonatomic, strong) NSString *city;

@property (nonatomic, strong) NSString *street;

@property (nonatomic, strong) NSString *state;

@property (weak, nonatomic) id <GPSServiceDelegate> delegate;

@end
