//
//  FlipsideViewController.m
//  AUS Weather
//
//  Created by Donny Kurniawan on 1/01/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "FlipsideViewController.h"

@implementation FlipsideViewController

@synthesize wPickerView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		
		states = [NSArray arrayWithObjects:@"ACT", @"NSW", @"NT", @"QLD", @"SA", @"TAS", @"VIC", @"WA", nil];
		[states retain];
		
		wPickerViewArray = [[NSMutableArray alloc] initWithCapacity:8];
		
		[wPickerViewArray insertObject:[NSArray arrayWithObjects:
										@"Canberra", @"Tuggeranong",
										nil] atIndex:0];
		
		[wPickerViewArray insertObject:[NSArray arrayWithObjects:
										@"Armidale", @"Batemans Bay", @"Bathurst", @"Bega", @"Bourke", @"Bowral", @"Broken Hill", @"Cabramurra", 
										@"Cape Byron", @"Cobar", @"Coffs Harbour", @"Cooma", @"Deniliquin", @"Dubbo", @"Forster", @"Glen Innes", @"Gosford", 
										@"Goulburn", @"Grafton", @"Griffith", @"Inverell", @"Ivanhoe", @"Katoomba", @"Kempsey", @"Lismore", @"Lithgow", 
										@"Liverpool", @"Lord Howe Island", @"Maitland and Cessnock", @"Merimbula", @"Moree", @"Mudgee", @"Narrabri", 
										@"Newcastle", @"Norfolk Island", @"Nowra", @"Orange", @"Parkes", @"Parramatta", @"Penrith", @"Perisher Valley", 
										@"Port Macquarie", @"Richmond", @"Scone", @"Singleton", @"Springwood", @"Sydney", @"Tamworth", @"Taree", 
										@"Terrey Hills", @"Thredbo", @"Wagga Wagga", @"Wollongong", @"Young",
										nil] atIndex:1];
		
		[wPickerViewArray insertObject:[NSArray arrayWithObjects:
										@"Alice Springs", @"Alyangula", @"Borroloola", @"Darwin", @"Darwin Rural", @"Jabiru", @"Katherine", @"Lajamanu", 
										@"Maningrida", @"Nhulunbuy", @"Pirlangimpi", @"Tennant Creek", @"Wadeye", @"Yuendumu", @"Yulara",
										nil] atIndex:2];
		
		[wPickerViewArray insertObject:[NSArray arrayWithObjects:
										@"Ayr / Home Hill", @"Biloela", @"Bowen", @"Brisbane", @"Brisbane Bayside", @"Bundaberg", @"Cairns", @"Charleville", 
										@"Charters Towers", @"Clermont", @"Cooktown", @"Dalby", @"Emerald", @"Gladstone", @"Gold Coast", @"Goondiwindi", 
										@"Gympie", @"Hervey Bay", @"Ingham", @"Innisfail", @"Ipswich", @"Kingaroy", @"Longreach", @"Mackay", @"Mareeba", 
										@"Maryborough", @"Moranbah", @"Mount Isa", @"Normanton", @"Rockhampton", @"Roma", @"Sunshine Coast", 
										@"Thursday Island", @"Toowoomba", @"Townsville", @"Warwick", @"Weipa", @"Winton", @"Yeppoon", 
										nil] atIndex:3];
		
		[wPickerViewArray insertObject:[NSArray arrayWithObjects:
										@"Adelaide", @"Ceduna", @"Clare", @"Coober Pedy", @"Coonawarra", @"Elizabeth", @"Keith", @"Kingscote", @"Kyancutta", 
										@"Leigh Creek", @"Maitland", @"Mount Barker", @"Mount Gambier", @"Murray Bridge", @"Naracoorte", @"Noarlunga", 
										@"Nuriootpa", @"Port Augusta", @"Port Lincoln", @"Port Pirie", @"Renmark", @"Robe", @"Roxby Downs", @"Victor Harbor", 
										@"Whyalla", @"Woomera", @"Wudinna", 
										nil] atIndex:4];
		
		[wPickerViewArray insertObject:[NSArray arrayWithObjects:
										@"Devonport", @"Hobart", @"Launceston", @"St Helens", @"Strahan Town", @"Swansea", 
										nil] atIndex:5];
		
		[wPickerViewArray insertObject:[NSArray arrayWithObjects:
										@"Airey's Inlet", @"Albury / Wodonga", @"Ararat", @"Avalon", @"Bairnsdale", @"Ballarat", @"Beechworth", @"Benalla", 
										@"Bendigo", @"Cape Nelson", @"Cape Otway", @"Casterton", @"Castlemaine", @"Cerberus", @"Colac", @"Combienbar", 
										@"Corryong", @"Cranbourne", @"Dartmouth", @"Echuca", @"Edi Upper", @"Gabo Island", @"Geelong", @"Gelantipy", 
										@"Hamilton", @"Heywood", @"Horsham", @"Kerang", @"Kilmore Gap", @"Kyabram", @"Lake Eildon", @"Lakes Entrance", 
										@"Latrobe Valley", @"Laverton", @"Longerenong", @"Mallacoota", @"Maryborough", @"Melbourne", @"Mildura", @"Moorabbin", 
										@"Mornington Peninsula", @"Mortlake", @"Mount Buller", @"Mount Dandenong", @"Mount Hotham", @"Mount Moornapa", 
										@"Mount Nowa Nowa", @"Nhill", @"Noojee", @"Omeo", @"Orbost", @"Ouyen", @"Phillip Island", @"Point Hicks", 
										@"Point Wilson", @"Port Fairy", @"Portland", @"Redesdale", @"Rhyll", @"Rutherglen", @"Sale", @"Scoresby", @"Seymour", 
										@"Sheoaks", @"Shepparton", @"Stawell", @"Strathbogie", @"Swan Hill", @"Tatura", @"Tullamarine", @"Walpeup", @"Wangaratta", 
										@"Warracknabeal", @"Warrnambool", @"Watsonia", @"Weeaproinah", @"Wilson's Promontory", @"Wonthaggi", @"Yarra Glen", 
										@"Yarrawonga", 
										nil] atIndex:6];
		
		[wPickerViewArray insertObject:[NSArray arrayWithObjects:
										@"Albany", @"Argyle", @"Augusta", @"Bridgetown", @"Broome", @"Bunbury", @"Busselton", @"Carnarvon", 
										@"Christmas Island", @"Cocos Island", @"Collie", @"Dalwallinu", @"Denham", @"Derby", @"Esperance", @"Eucla", 
										@"Exmouth", @"Fitzroy Crossing", @"Geraldton", @"Halls Creek", @"Kalbarri", @"Kalgoorlie", @"Kalumburu", @"Karratha", 
										@"Katanning", @"Kununurra", @"Lake Grace", @"Laverton", @"Leinster", @"Leonora", @"Mandurah", @"Manjimup", @"Marble Bar", 
										@"Margaret River", @"Meekatharra", @"Merredin", @"Moora", @"Morawa", @"Narrogin", @"Newman", @"Norseman", @"Northam", 
										@"Onslow", @"Paraburdoo", @"Perth", @"Port Hedland", @"Ravensthorpe", @"Roebourne", @"Tom Price", @"Wyndham", 
										nil] atIndex:7];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
	
	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	NSString *state = nil;
	NSString *city = nil;
	
	state = [standardUserDefaults objectForKey:@"State"];
	city = [standardUserDefaults objectForKey:@"City"];
		
	if (state == nil || city == nil) {
		state = @"VIC";
		city = @"Melbourne";
		[standardUserDefaults setObject:state forKey:@"State"];
		[standardUserDefaults setObject:city forKey:@"City"];
		[standardUserDefaults synchronize];
	}
	
	//NSUInteger stateIndex = [states indexOfObject:state];
	//NSUInteger cityIndex = [[wPickerViewArray objectAtIndex:stateIndex] indexOfObject:city];

	// Apple bug?
	
	//[wPickerView selectRow:stateIndex inComponent:0 animated:NO];
	//[wPickerView selectRow:cityIndex inComponent:1 animated:NO];

	[wPickerView selectRow:0 inComponent:0 animated:NO];
	[wPickerView selectRow:0 inComponent:1 animated:NO];
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
	[wPickerView release];
	[wPickerViewArray release];
	[states release];
    [super dealloc];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	if (component == 0) {
		return [wPickerViewArray count];
	} else {
		return [[wPickerViewArray objectAtIndex:[pickerView selectedRowInComponent:0]] count];
	}
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	if (component == 0) {
		[pickerView reloadComponent:1];
	}
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	if (component == 0) {
		return [states objectAtIndex:row];
	} else {
		return [[wPickerViewArray objectAtIndex:[wPickerView selectedRowInComponent:0]] objectAtIndex:row];
	}
	
	return nil;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
	switch (component) {
		case 0: return 70;
		case 1: return 200;
	}
	
	return 0;
}

- (NSString *)getSelectedState {
	return [states objectAtIndex:[wPickerView selectedRowInComponent:0]];
}

- (NSString *)getSelectedCity {
	return [[wPickerViewArray objectAtIndex:[wPickerView selectedRowInComponent:0]] objectAtIndex:[wPickerView selectedRowInComponent:1]];
}

@end
