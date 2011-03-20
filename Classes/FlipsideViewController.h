//
//  FlipsideViewController.h
//  AUS Weather
//
//  Created by Donny Kurniawan on 1/01/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlipsideViewController : UIViewController {
	IBOutlet UIPickerView *wPickerView;
	NSMutableArray *wPickerViewArray;
	NSArray *states;
}

@property (nonatomic, retain) UIPickerView *wPickerView;

- (NSString *)getSelectedState;
- (NSString *)getSelectedCity;

@end
