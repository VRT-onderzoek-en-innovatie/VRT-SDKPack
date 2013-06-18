//
//  Route.m
//  
//
//  Created by Martijn Vandenberghe on 18/06/13.
//  Copyright (c) 2013 ikbenmartijn. All rights reserved.
//

#import "Route.h"

@implementation Route

@synthesize code;
@synthesize details;
@synthesize from;
@synthesize in;
@synthesize road;
@synthesize roadFrom;
@synthesize roadTo;
@synthesize to;

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.code forKey:@"code"];
    [encoder encodeObject:self.details forKey:@"details"];
    [encoder encodeObject:self.from forKey:@"from"];
    [encoder encodeObject:self.in forKey:@"in"];
    [encoder encodeObject:self.road forKey:@"road"];
    [encoder encodeObject:self.roadFrom forKey:@"roadFrom"];
    [encoder encodeObject:self.roadTo forKey:@"roadTo"];
    [encoder encodeObject:self.to forKey:@"to"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super init])) {
        self.code = [decoder decodeObjectForKey:@"code"];
        self.details = [decoder decodeObjectForKey:@"details"];
        self.from = [decoder decodeObjectForKey:@"from"];
        self.in = [decoder decodeObjectForKey:@"in"];
        self.road = [decoder decodeObjectForKey:@"road"];
        self.roadFrom = [decoder decodeObjectForKey:@"roadFrom"];
        self.roadTo = [decoder decodeObjectForKey:@"roadTo"];
        self.to = [decoder decodeObjectForKey:@"to"];
    }
    return self;
}

- (id)initWithRoute:(NSDictionary*)route {
    if (self = [super init]) {
        [self setCode:[route objectForKey:@"code"]];
        [self setDetails:[route objectForKey:@"details"]];        
        [self setIn:[route objectForKey:@"in"]];
        [self setRoad:[route objectForKey:@"road"]];
        [self setRoadFrom:[route objectForKey:@"roadFrom"]];
        [self setRoadTo:[route objectForKey:@"roadTo"]];
        if([[route objectForKey:@"from"] count]) {
            [self setFrom:[[[route objectForKey:@"from"] objectAtIndex:0] objectForKey:@"city"]]; //Zit in een aparte array die nog eens een KV-pair bevat >> uithalen wegens nutteloze overhead
        }
        else {
            [self setFrom:nil];
        }
        
        if([[route objectForKey:@"to"] count]) {
            [self setTo:[[[route objectForKey:@"to"] objectAtIndex:0] objectForKey:@"city"]]; //Zit in een aparte array die nog eens een KV-pair bevat >> uithalen wegens nutteloze overhead
        }
        else {
            [self setTo:nil];
        }
    }
    
    return self;
}

+ (Route *)instanceFromDictionary:(NSDictionary *)aDictionary {

    Route *instance = [[Route alloc] init];
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
    [super setValue:value forKey:key];
}


@end
