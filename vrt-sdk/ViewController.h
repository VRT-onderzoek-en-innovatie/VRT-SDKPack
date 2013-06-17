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
    VRTTrafficManager *trafficManager;
}

@property (nonatomic, strong) VRTTrafficManager *trafficManager;

@end
