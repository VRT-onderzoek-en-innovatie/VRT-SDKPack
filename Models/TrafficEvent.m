//
//  TrafficEvent.m
//  
//
//  Created by Martijn Vandenberghe on 18/06/13.
//  Copyright (c) 2013 ikbenmartijn. All rights reserved.
//

#import "TrafficEvent.h"

#import "Route.h"

@implementation TrafficEvent

@synthesize route;
@synthesize type;

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.route forKey:@"route"];
    [encoder encodeObject:self.type forKey:@"type"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super init])) {
        self.route = [decoder decodeObjectForKey:@"route"];
        self.type = [decoder decodeObjectForKey:@"type"];
    }
    return self;
}

- (id)initWithEvent:(NSDictionary*)event {
    if (self = [super init]) {
        [self setType:[event objectForKey:@"type"]];
        
        Route *eventRoute = [[Route alloc] initWithRoute:[event objectForKey:@"route"]];
        [self setRoute:eventRoute];
    }
    
    return self;
}

+ (TrafficEvent *)instanceFromDictionary:(NSDictionary *)aDictionary {

    TrafficEvent *instance = [[TrafficEvent alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (void)setValue:(id)value forKey:(NSString *)key {

    if ([key isEqualToString:@"route"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.route = [Route instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


@end
