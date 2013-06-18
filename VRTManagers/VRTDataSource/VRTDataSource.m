//
//  VRTDataSource.m
//  vrt-sdk
//
//  Created by Martijn Vandenberghe on 17/06/13.
//  Copyright (c) 2013 Martijn Vandenberghe. All rights reserved.
//

#import "VRTDataSource.h"

@implementation VRTDataSource

@synthesize delegate;

@synthesize antwoordData;

- (void)haalDataOpVanAdres:(NSString*)adres metHeader:(NSString*)header {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:adres]];
    [request setValue:header forHTTPHeaderField:@"Accept"];
    [request setValue:header forHTTPHeaderField:@"Content-Type"];
    
    NSURLConnection *connection = [[NSURLConnection alloc] init];
    (void)[connection initWithRequest:request delegate:self];
}

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    antwoordData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [antwoordData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //Antwoorddata is vol
    if ([self.delegate respondsToSelector:@selector(verbinding:GafDataTerug:)]) {
        [self.delegate verbinding:connection GafDataTerug:antwoordData];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    //Fail in verbinding
}

@end
