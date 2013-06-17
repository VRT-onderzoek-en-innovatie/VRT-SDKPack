//
//  VRTTrafficManager.m
//  vrt-sdk
//
//  Created by Martijn Vandenberghe on 17/06/13.
//  Copyright (c) 2013 Martijn Vandenberghe. All rights reserved.
//

#import "VRTTrafficManager.h"

@implementation VRTTrafficManager

@synthesize delegate;

@synthesize dataSource;

- (id)init {
    if (self = [super init]) {
        dataSource = [[VRTDataSource alloc] init];
        [dataSource setDelegate:self];
    }
    
    return self;
}

- (void)haalAlleEventsOp {
    [dataSource haalDataOpVanAdres:@"http://services.vrt.be/traffic/events" metHeader:@"application/vnd.traffic.vrt.be.events_1.0+json"];
}

- (void)gafDataTerug:(NSData *)data {    
    NSDictionary *antwoord=[NSJSONSerialization
                              JSONObjectWithData:data
                              options:NSJSONReadingMutableLeaves
                              error:nil];
    
    //Geef de data terug aan wie ze nodig heeft
    if ([self.delegate respondsToSelector:@selector(haaldeEventsOp:)]) {
        [self.delegate haaldeEventsOp:antwoord];
    }
}

@end
