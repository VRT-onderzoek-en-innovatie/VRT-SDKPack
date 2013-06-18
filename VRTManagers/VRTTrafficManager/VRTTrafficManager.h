//
//  VRTTrafficManager.h
//  vrt-sdk
//
//  Created by Martijn Vandenberghe on 17/06/13.
//  Copyright (c) 2013 Martijn Vandenberghe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VRTDataSource.h"

#import "TrafficEvent.h"

@class VRTTrafficManager;

@protocol VRTTrafficManagerDelegate <NSObject>

@optional
- (void)haaldeEventsOp:(NSMutableArray*)trafficEvents; //NSObject moet VRTTrafficEvents worden, ofzo

@end

@interface VRTTrafficManager : NSObject<VRTTrafficManagerDelegate, VRTDataSourceDelegate> {
    VRTDataSource *dataSource;
}

@property (nonatomic, strong) id <VRTTrafficManagerDelegate> delegate;

@property (nonatomic, strong) VRTDataSource *dataSource;

- (void)haalAlleEventsOp;

@end