//
//  MainViewController.h
//  AUS Weather
//
//  Created by Donny Kurniawan on 1/01/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController {
	IBOutlet UILabel *mvCity;
	IBOutlet UILabel *mvState;
	IBOutlet UILabel *mvForecastDate;
	IBOutlet UILabel *mvIssueInfo;
	
	IBOutlet UILabel *mvMin0;
	IBOutlet UILabel *mvMax0;
	IBOutlet UILabel *mvForecast0;
	IBOutlet UILabel *mvDate0;
	
	IBOutlet UILabel *mvMin1;
	IBOutlet UILabel *mvMax1;
	IBOutlet UILabel *mvForecast1;
	IBOutlet UILabel *mvDate1;
	
	IBOutlet UILabel *mvMin2;
	IBOutlet UILabel *mvMax2;
	IBOutlet UILabel *mvForecast2;
	IBOutlet UILabel *mvDate2;
	
	IBOutlet UILabel *mvMin3;
	IBOutlet UILabel *mvMax3;
	IBOutlet UILabel *mvForecast3;
	IBOutlet UILabel *mvDate3;
	
	IBOutlet UILabel *mvMin4;
	IBOutlet UILabel *mvMax4;
	IBOutlet UILabel *mvForecast4;
	IBOutlet UILabel *mvDate4;
}

@property (nonatomic, retain) UILabel *mvCity;
@property (nonatomic, retain) UILabel *mvState;
@property (nonatomic, retain) UILabel *mvForecastDate;
@property (nonatomic, retain) UILabel *mvIssueInfo;

@property (nonatomic, retain) UILabel *mvMin0;
@property (nonatomic, retain) UILabel *mvMax0;
@property (nonatomic, retain) UILabel *mvForecast0;
@property (nonatomic, retain) UILabel *mvDate0;

@property (nonatomic, retain) UILabel *mvMin1;
@property (nonatomic, retain) UILabel *mvMax1;
@property (nonatomic, retain) UILabel *mvForecast1;
@property (nonatomic, retain) UILabel *mvDate1;

@property (nonatomic, retain) UILabel *mvMin2;
@property (nonatomic, retain) UILabel *mvMax2;
@property (nonatomic, retain) UILabel *mvForecast2;
@property (nonatomic, retain) UILabel *mvDate2;

@property (nonatomic, retain) UILabel *mvMin3;
@property (nonatomic, retain) UILabel *mvMax3;
@property (nonatomic, retain) UILabel *mvForecast3;
@property (nonatomic, retain) UILabel *mvDate3;

@property (nonatomic, retain) UILabel *mvMin4;
@property (nonatomic, retain) UILabel *mvMax4;
@property (nonatomic, retain) UILabel *mvForecast4;
@property (nonatomic, retain) UILabel *mvDate4;

@end
