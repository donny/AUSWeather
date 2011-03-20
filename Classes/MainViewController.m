//
//  MainViewController.m
//  AUS Weather
//
//  Created by Donny Kurniawan on 1/01/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"

@implementation MainViewController

@synthesize mvCity;
@synthesize mvState;
@synthesize mvForecastDate;
@synthesize mvIssueInfo;
@synthesize mvMin0;
@synthesize mvMax0;
@synthesize mvForecast0;
@synthesize mvDate0;
@synthesize mvMin1;
@synthesize mvMax1;
@synthesize mvForecast1;
@synthesize mvDate1;
@synthesize mvMin2;
@synthesize mvMax2;
@synthesize mvForecast2;
@synthesize mvDate2;
@synthesize mvMin3;
@synthesize mvMax3;
@synthesize mvForecast3;
@synthesize mvDate3;
@synthesize mvMin4;
@synthesize mvMax4;
@synthesize mvForecast4;
@synthesize mvDate4;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}

/*
 For getting the Default.png image
- (void)viewDidLoad {
    [super viewDidLoad];
	
	mvCity.hidden = YES;
	mvState.hidden = YES;
	mvForecastDate.hidden = YES;
	mvIssueInfo.hidden = YES;
	mvMin0.hidden = YES;
	mvMax0.hidden = YES;
	mvForecast0.hidden = YES;
	mvDate0.hidden = YES;
	mvMin1.hidden = YES;
	mvMax1.hidden = YES;
	mvForecast1.hidden = YES;
	mvDate1.hidden = YES;
	mvMin2.hidden = YES;
	mvMax2.hidden = YES;
	mvForecast2.hidden = YES;
	mvDate2.hidden = YES;
	mvMin3.hidden = YES;
	mvMax3.hidden = YES;
	mvForecast3.hidden = YES;
	mvDate3.hidden = YES;
	mvMin4.hidden = YES;
	mvMax4.hidden = YES;
	mvForecast4.hidden = YES;
	mvDate4.hidden = YES;
}
*/

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
	[mvCity release];
	[mvState release];
	[mvForecastDate release];
	[mvIssueInfo release];
	[mvMin0 release];
	[mvMax0 release];
	[mvForecast0 release];
	[mvDate0 release];
	[mvMin1 release];
	[mvMax1 release];
	[mvForecast1 release];
	[mvDate1 release];
	[mvMin2 release];
	[mvMax2 release];
	[mvForecast2 release];
	[mvDate2 release];
	[mvMin3 release];
	[mvMax3 release];
	[mvForecast3 release];
	[mvDate3 release];
	[mvMin4 release];
	[mvMax4 release];
	[mvForecast4 release];	
	[mvDate4 release];
    [super dealloc];
}

@end
