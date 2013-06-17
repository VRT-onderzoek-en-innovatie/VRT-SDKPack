//
//  VRTTrafficManager.h
//  vrt-sdk
//
//  Created by Martijn Vandenberghe on 17/06/13.
//  Copyright (c) 2013 Martijn Vandenberghe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VRTDataSource.h"

@class VRTTrafficManager;

@protocol VRTTrafficManagerDelegate <NSObject>

@optional

@end

@interface VRTTrafficManager : NSObject<VRTTrafficManagerDelegate, VRTDataSourceDelegate>

@property (nonatomic, strong) id <VRTTrafficManagerDelegate> delegate;

- (void)doeIets:(NSString*)adres;

@end