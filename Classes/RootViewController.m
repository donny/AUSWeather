//
//  RootViewController.m
//  AUS Weather
//
//  Created by Donny Kurniawan on 1/01/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "RootViewController.h"
#import "MainViewController.h"
#import "FlipsideViewController.h"

@implementation RootViewController

@synthesize infoButton;
@synthesize doneButton;
@synthesize mainViewController;
@synthesize flipsideViewController;

- (void)viewDidLoad {
    [super viewDidLoad];

	[doneButton removeFromSuperview];
	
    MainViewController *viewController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
    self.mainViewController = viewController;
    [viewController release];
    [self.view insertSubview:mainViewController.view belowSubview:infoButton];
	
	isNetAvailable = NO;
	NSURL *url = [NSURL URLWithString:@"ftp://ftp2.bom.gov.au/anon/gen/fwo/IDA00001.dat"];	
	rawWeatherInfo = [[NSMutableString alloc] initWithCapacity:5000];
	netRequest = [[NSURLRequest alloc] initWithURL:url];
	netConnection = [[NSURLConnection alloc] initWithRequest:netRequest
													delegate:self startImmediately:YES];
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	NSString *state = [standardUserDefaults objectForKey:@"State"];
	NSString *city = [standardUserDefaults objectForKey:@"City"];
	
	if (state == nil || city == nil) {
		state = @"VIC";
		city = @"Melbourne";
		[standardUserDefaults setObject:state forKey:@"State"];
		[standardUserDefaults setObject:city forKey:@"City"];
		[standardUserDefaults synchronize];
	}

	mainViewController.mvCity.text = city;
	mainViewController.mvIssueInfo.text = @"Updating ...";
	
	
	// Increase the touchable area on the Info button, so it's easier to press.
	CGRect newInfoButtonRect = CGRectMake(infoButton.frame.origin.x-25, 
										  infoButton.frame.origin.y-25,
										  infoButton.frame.size.width+50, 
										  infoButton.frame.size.height+50);
	[infoButton setFrame:newInfoButtonRect];
}

- (void)loadFlipsideViewController {
    FlipsideViewController *viewController = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
    self.flipsideViewController = viewController;
    [viewController release];    
}

- (IBAction)toggleView {    
    if (flipsideViewController == nil) {
        [self loadFlipsideViewController];
    }
    
    UIView *mainView = mainViewController.view;
    UIView *flipsideView = flipsideViewController.view;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationTransition:([mainView superview] ? UIViewAnimationTransitionFlipFromRight : UIViewAnimationTransitionFlipFromLeft)
						   forView:self.view cache:YES];
    
    if ([mainView superview] != nil) {
        [flipsideViewController viewWillAppear:YES];
        [mainViewController viewWillDisappear:YES];
		
        [mainView removeFromSuperview];
        [infoButton removeFromSuperview];
        [self.view addSubview:flipsideView];
        [self.view insertSubview:doneButton aboveSubview:flipsideView];
        
		[mainViewController viewDidDisappear:YES];
        [flipsideViewController viewDidAppear:YES];
    } else {
        [mainViewController viewWillAppear:YES];
        [flipsideViewController viewWillDisappear:YES];
        
		[flipsideView removeFromSuperview];
        [doneButton removeFromSuperview];
        [self.view addSubview:mainView];
        [self.view insertSubview:infoButton aboveSubview:mainView];
        
		[flipsideViewController viewDidDisappear:YES];
        [mainViewController viewDidAppear:YES];
		
		NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
		NSString *state = [flipsideViewController getSelectedState];
		NSString *city = [flipsideViewController getSelectedCity];
		
		if (standardUserDefaults) {
			[standardUserDefaults setObject:state forKey:@"State"];
			[standardUserDefaults setObject:city forKey:@"City"];
			[standardUserDefaults synchronize];
		}
		
		if (isNetAvailable) {
			NSString *result = [self findWeatherInfoOf:city inState:state];
			[self displayWeatherInfo:result];
		} else {
			mainViewController.mvCity.text = city;
			mainViewController.mvIssueInfo.text = @"Update Failed";
		}
	}
    [UIView commitAnimations];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)dealloc {
	[rawWeatherInfo release];	
	[netRequest release];
	[netConnection release];
	
	if (isNetAvailable)
		[allWeatherInfo release];
	
    [infoButton release];
	[doneButton release];
    [mainViewController release];
    [flipsideViewController release];
    [super dealloc];
}

- (NSString *)findWeatherInfoOf:(NSString *)city inState:(NSString *)state {
	NSString *result;
	
	NSString *searchTerm;

	if ([state isEqualToString:@"ACT"]) {
		searchTerm = [[NSString alloc] initWithFormat:@"#%@#%@#", city, @"NSW"];
	} else {
		searchTerm = [[NSString alloc] initWithFormat:@"#%@#%@#", city, state];
	}
	
	for (NSString *str in allWeatherInfo) {
		BOOL match = ([str rangeOfString:searchTerm].location != NSNotFound);
		if (match) {
			result = str;
			break;
		}
	}

	[searchTerm release];
	return result;
}

- (void)displayWeatherInfo:(NSString *)wInfo {
	NSArray *wSingleInfo = [wInfo componentsSeparatedByString:@"#"];
	
	NSString *iCity = [wSingleInfo objectAtIndex:1];
	NSString *iState = [wSingleInfo objectAtIndex:2];
	NSString *iForecastDate = [wSingleInfo objectAtIndex:3];
	NSString *iIssueDate = [wSingleInfo objectAtIndex:4];
	NSString *iIssueTime = [wSingleInfo objectAtIndex:5];
	
	NSString *iMin0 = [wSingleInfo objectAtIndex:6];
	NSString *iMax0 = [wSingleInfo objectAtIndex:7];	
	NSString *iMin1 = [wSingleInfo objectAtIndex:8];
	NSString *iMax1 = [wSingleInfo objectAtIndex:9];
	NSString *iMin2 = [wSingleInfo objectAtIndex:10];
	NSString *iMax2 = [wSingleInfo objectAtIndex:11];
	NSString *iMin3 = [wSingleInfo objectAtIndex:12];
	NSString *iMax3 = [wSingleInfo objectAtIndex:13];
	NSString *iMin4 = [wSingleInfo objectAtIndex:14];
	NSString *iMax4 = [wSingleInfo objectAtIndex:15];
	
	NSString *iForecast0 = [wSingleInfo objectAtIndex:22];
	NSString *iForecast1 = [wSingleInfo objectAtIndex:23];
	NSString *iForecast2 = [wSingleInfo objectAtIndex:24];
	NSString *iForecast3 = [wSingleInfo objectAtIndex:25];
	NSString *iForecast4 = [wSingleInfo objectAtIndex:26];

	mainViewController.mvCity.text = iCity;
	mainViewController.mvState.text = iState;
	mainViewController.mvForecastDate.text = iForecastDate;
	
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"EEEE"];

	NSTimeInterval secondsPerDay = 24 * 60 * 60;
	NSDate *today = [NSDate date];
	
	NSString *iDate0 = [dateFormatter stringFromDate:today];
	NSString *iDate1 = [dateFormatter stringFromDate:[today addTimeInterval:(1 * secondsPerDay)]];
	NSString *iDate2 = [dateFormatter stringFromDate:[today addTimeInterval:(2 * secondsPerDay)]];
	NSString *iDate3 = [dateFormatter stringFromDate:[today addTimeInterval:(3 * secondsPerDay)]];
	NSString *iDate4 = [dateFormatter stringFromDate:[today addTimeInterval:(4 * secondsPerDay)]];

	if ([iForecast0 length] != 0)
		mainViewController.mvDate0.text = iDate0;
	else
		mainViewController.mvDate0.text = nil;
	
	if ([iForecast1 length] != 0)
		mainViewController.mvDate1.text = iDate1;
	else
		mainViewController.mvDate1.text = nil;

	if ([iForecast2 length] != 0)
		mainViewController.mvDate2.text = iDate2;
	else
		mainViewController.mvDate2.text = nil;
	
	if ([iForecast3 length] != 0)
		mainViewController.mvDate3.text = iDate3;
	else
		mainViewController.mvDate3.text = nil;
	
	if ([iForecast4 length] != 0)
		mainViewController.mvDate4.text = iDate4;
	else
		mainViewController.mvDate4.text = nil;

	mainViewController.mvMin0.text = iMin0;
	mainViewController.mvMax0.text = iMax0;
	mainViewController.mvForecast0.text = iForecast0;
	
	mainViewController.mvMin1.text = iMin1;
	mainViewController.mvMax1.text = iMax1;
	mainViewController.mvForecast1.text = iForecast1;
	
	mainViewController.mvMin2.text = iMin2;
	mainViewController.mvMax2.text = iMax2;
	mainViewController.mvForecast2.text = iForecast2;
	
	mainViewController.mvMin3.text = iMin3;
	mainViewController.mvMax3.text = iMax3;
	mainViewController.mvForecast3.text = iForecast3;
	
	mainViewController.mvMin4.text = iMin4;
	mainViewController.mvMax4.text = iMax4;
	mainViewController.mvForecast4.text = iForecast4;
	
	NSString *iDYear = [iIssueDate substringWithRange:NSMakeRange(0, 4)];
	NSString *iDMonth = [iIssueDate substringWithRange:NSMakeRange(4, 2)];
	NSString *iDDay = [iIssueDate substringWithRange:NSMakeRange(6, 2)];
	NSString *iTHour = [iIssueTime substringWithRange:NSMakeRange(0, 2)];
	NSString *iTMinute = [iIssueTime substringWithRange:NSMakeRange(2, 2)];
	//NSString *iTSecond = [iIssueTime substringWithRange:NSMakeRange(4, 2)];

	NSString *iInfo;
	iInfo = [[NSString alloc] initWithFormat:@"Issued at %@:%@ on %@/%@/%@", 
			 iTHour, iTMinute, iDDay, iDMonth, iDYear];
	
	mainViewController.mvIssueInfo.text = iInfo;
	
	[iInfo release];
	[dateFormatter release];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	NSString *dataString = [NSString stringWithUTF8String:[data bytes]];
	if (dataString != nil)
		[rawWeatherInfo appendString:dataString];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
	mainViewController.mvIssueInfo.text = @"Update Failed";
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cannot Update"
													message:@"AUS Weather cannot update because it is not connected to the Internet." 
												   delegate:nil 
										  cancelButtonTitle:@"OK" 
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
	isNetAvailable = YES;
	allWeatherInfo = [[rawWeatherInfo componentsSeparatedByString:@"\n"] retain];

	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	NSString *state = [standardUserDefaults objectForKey:@"State"];
	NSString *city = [standardUserDefaults objectForKey:@"City"];
	
	NSString *result = [self findWeatherInfoOf:city inState:state];
	[self displayWeatherInfo:result];
}

@end
