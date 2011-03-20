//
//  RootViewController.h
//  AUS Weather
//
//  Created by Donny Kurniawan on 1/01/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;
@class FlipsideViewController;

@interface RootViewController : UIViewController {
    UIButton *infoButton;
	UIButton *doneButton;
    MainViewController *mainViewController;
    FlipsideViewController *flipsideViewController;

	NSArray *allWeatherInfo;

	BOOL isNetAvailable; 
	NSMutableString *rawWeatherInfo;
	NSURLConnection *netConnection;
	NSURLRequest *netRequest;
}

@property (nonatomic, retain) IBOutlet UIButton *infoButton;
@property (nonatomic, retain) IBOutlet UIButton *doneButton;
@property (nonatomic, retain) MainViewController *mainViewController;
@property (nonatomic, retain) FlipsideViewController *flipsideViewController;

- (IBAction)toggleView;
- (NSString *)findWeatherInfoOf:(NSString *)city inState:(NSString *)state;
- (void)displayWeatherInfo:(NSString *)wInfo;

@end
