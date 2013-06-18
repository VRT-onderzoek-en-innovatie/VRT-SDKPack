//
//  Route.h
//  
//
//  Created by Martijn Vandenberghe on 18/06/13.
//  Copyright (c) 2013 ikbenmartijn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Route : NSObject <NSCoding> {
    NSString *code;
    NSString *details;
    NSString *from;
    NSString *in;
    NSString *road;
    NSString *roadFrom;
    NSString *roadTo;
    NSString *to;
}

@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *details;
@property (nonatomic, copy) NSString *from;
@property (nonatomic, copy) NSString *in;
@property (nonatomic, copy) NSString *road;
@property (nonatomic, copy) NSString *roadFrom;
@property (nonatomic, copy) NSString *roadTo;
@property (nonatomic, copy) NSString *to;

+ (Route *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;
- (id)initWithRoute:(NSDictionary*)route;

@end
