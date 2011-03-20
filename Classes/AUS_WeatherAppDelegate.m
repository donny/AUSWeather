//
//  AUS_WeatherAppDelegate.m
//  AUS Weather
//
//  Created by Donny Kurniawan on 1/01/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "AUS_WeatherAppDelegate.h"
#import "RootViewController.h"

@implementation AUS_WeatherAppDelegate

@synthesize window;
@synthesize rootViewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    [window addSubview:[rootViewController view]];
    [window makeKeyAndVisible];
}

- (void)dealloc {
    [rootViewController release];
    [window release];
    [super dealloc];
}

@end
