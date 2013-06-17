//
//  VRTDataSource.h
//  vrt-sdk
//
//  Created by Martijn Vandenberghe on 17/06/13.
//  Copyright (c) 2013 Martijn Vandenberghe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VRTDataSource;

@protocol VRTDataSourceDelegate<NSObject>

@required
- (void)gafDataTerug:(NSData*)data;

@end

@interface VRTDataSource : NSObject<NSURLConnectionDelegate> {
    NSMutableData *antwoordData;
}

@property (nonatomic, strong) id <VRTDataSourceDelegate> delegate;

@property (nonatomic, strong) NSMutableData *antwoordData;

- (void)haalDataOpVanAdres:(NSString*)adres;

@end
