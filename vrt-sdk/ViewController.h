//
//  ViewController.h
//  vrt-sdk
//
//  Created by Martijn Vandenberghe on 17/06/13.
//  Copyright (c) 2013 Martijn Vandenberghe. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VRTTrafficManager.h"

@interface ViewController : UIViewController {
    VRTTrafficManager *VRTtraffic;
}

@property (nonatomic, strong) VRTTrafficManager *VRTTraffic;

@end
