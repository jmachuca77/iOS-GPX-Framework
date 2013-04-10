//
//  GPXExtensions.m
//  GPX Framework
//
//  Created by NextBusinessSystem on 12/04/06.
//  Copyright (c) 2012 NextBusinessSystem Co., Ltd. All rights reserved.
//

#import "GPXExtensions.h"
#import "GPXElementSubclass.h"


@interface GPXExtensions()
@property (nonatomic, strong) NSString *heartRateString;
@property (nonatomic, strong) NSString *cadenceString;
@property (nonatomic, strong) NSString *distanceString;
@end


@implementation GPXExtensions

@synthesize heartRate = _heartRate;
@synthesize cadence = _cadence;
@synthesize distance = _distance;


- (NSNumber *)heartRate
{
    return [NSNumber numberWithFloat:[GPXType decimal:_heartRateString]];
}

- (void)setHeartRate:(NSNumber *)heartRate
{
    _heartRateString = [NSString stringWithFormat:@"%d", [heartRate integerValue]];
}

- (NSNumber *)cadence
{
    return [NSNumber numberWithFloat:[GPXType decimal:_cadenceString]];
}

- (void)setCadence:(NSNumber *)cadence
{
    _cadenceString = [NSString stringWithFormat:@"%d", [cadence integerValue]];
}

- (NSNumber *)distance
{
    return [NSNumber numberWithFloat:[GPXType decimal:_distanceString]];
}

- (void)setDistance:(NSNumber *)distance
{
    _distanceString = [GPXType valueForDecimal:[distance floatValue]];
}


#pragma mark - Instance

- (id)initWithXMLElement:(GPXXMLElement *)element parent:(GPXElement *)parent
{
    self = [super initWithXMLElement:element parent:parent];
    if (self) {
        _heartRateString = [self textForSingleChildElementNamed:@"gpxdata:hr" xmlElement:element];
        _cadenceString = [self textForSingleChildElementNamed:@"gpxdata:cadence" xmlElement:element];
        _distanceString = [self textForSingleChildElementNamed:@"gpxdata:distance" xmlElement:element];
    }
    return self;
}


#pragma mark - Public methods



#pragma mark - tag

+ (NSString *)tagName
{
    return @"extensions";
}


#pragma mark - GPX

- (void)addChildTagToGpx:(NSMutableString *)gpx indentationLevel:(NSInteger)indentationLevel
{
    [super addChildTagToGpx:gpx indentationLevel:indentationLevel];
    [self gpx:gpx addPropertyForValue:_heartRateString tagName:@"gpxdata:hr" indentationLevel:indentationLevel];
    [self gpx:gpx addPropertyForValue:_cadenceString tagName:@"gpxdata:cadence" indentationLevel:indentationLevel];
    [self gpx:gpx addPropertyForValue:_distanceString tagName:@"gpxdata:distance" indentationLevel:indentationLevel];

}

@end
