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

- (void)doeIets:(NSString*)adres {
    VRTDataSource *databron = [[VRTDataSource alloc] init];
    [databron setDelegate:self];
    [databron haalDataOpVanAdres:@"http://services.vrt.be/traffic/events"];
}

- (void)gafDataTerug:(NSData *)data {    
    NSDictionary *jsonObject=[NSJSONSerialization
                              JSONObjectWithData:data
                              options:NSJSONReadingMutableLeaves
                              error:nil];
    
    NSLog(@"%@", jsonObject);
}

@end
