//
//  TrafficEvent.h
//  
//
//  Created by Martijn Vandenberghe on 18/06/13.
//  Copyright (c) 2013 ikbenmartijn. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Route;

@interface TrafficEvent : NSObject <NSCoding> {
    Route *route;
    NSString *type;
}

@property (nonatomic, strong) Route *route;
@property (nonatomic, copy) NSString *type;

+ (TrafficEvent *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;
- (id)initWithEvent:(NSDictionary*)event;

@end
