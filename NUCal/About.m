//
//  About.m
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "About.h"


@implementation About
@synthesize img_about;
@synthesize btn_url;

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)dealloc
{
    [img_about release];
    [btn_url release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
    // code - add retina 4 inch support - by csa4 - 16.5.2014
    // if the device is iPhone3GS or 4/4S, extra_height = 0;
    // if the device is iPhone5 or 5C/5S, extra_height = 88, so we need to draw a longer scroll view
    if (IS_IPHONE5()) {
        int extra = 88;
        [sv_content setFrame:CGRectMake(0, 48, 320, 480-47 + extra)];
    } else {
        [sv_content setFrame:CGRectMake(0, 48, 320, 480-47)];
    } // if end

    
    // original code - 5/12/2014
    int en_height  = 3800/2;  // height=3800 for english screen
    int en_height2 = en_height + 800 / 2;  // height=4600
    
    int ch_height  = 2900/2;  // height=2900 for trad. and simpl. chinese screen
    int ch_height2 = ch_height + 500 / 2;  // height=3400
    
    if([[Language currentLanguage]isEqualToString:@"en"]){
        // original code - no privacy policy 
        // [img_about setImage:[UIImage imageNamed:@"about"]];
        // [img_about setFrame:CGRectMake(0, 0, 320, 2000)];
        // [sv_content setContentSize:CGSizeMake(320, 1950)];
        // [btn_url setFrame:CGRectMake(15, 1518, 208, 22)];
        
        // code - add privacy code - by csa4 - 5/12/2014
        [img_about setImage:[UIImage imageNamed:@"about"]];
        [img_about setFrame:CGRectMake(0, 0, 320, en_height2 + 2*50)];
        // [sv_content setContentSize:CGSizeMake(320, en_height2 + 50)];
        [sv_content setContentSize:CGSizeMake(320, en_height2+100)];
        [btn_url setFrame:CGRectMake(15, 1518+60, 208, 22)];

    }
    else if([[Language currentLanguage]isEqualToString:@"zh"]){
        // original code - no privacy policy 
        // [img_about setImage:[UIImage imageNamed:@"about_tc"]];
        // [img_about setFrame:CGRectMake(0, 0, 320, 2000)];
        // [sv_content setContentSize:CGSizeMake(320, 1500)];
        // [btn_url setFrame:CGRectMake(69, 1163, 208, 22)];
        
        // code - add privacy code - by csa4 - 5/12/2014
        [img_about setImage:[UIImage imageNamed:@"about_tc"]];
        [img_about setFrame:CGRectMake(0, 0, 320, ch_height2)];
        // [sv_content setContentSize:CGSizeMake(320, ch_height2 + 50)];
        [sv_content setContentSize:CGSizeMake(320, ch_height2+0)];
        [btn_url setFrame:CGRectMake(69, 1163, 208, 22)];
    }
    else if([[Language currentLanguage]isEqualToString:@"sc"]){
        // original code - no privacy policy 
        // [img_about setImage:[UIImage imageNamed:@"about_sc"]];
        // [img_about setFrame:CGRectMake(0, 0, 320, 2000)];
        // [sv_content setContentSize:CGSizeMake(320, 1500)];
        // [btn_url setFrame:CGRectMake(69, 1163, 208, 22)];
        
        // code - add privacy code - by csa4 - 5/12/2014
        [img_about setImage:[UIImage imageNamed:@"about_sc"]];
        [img_about setFrame:CGRectMake(0, 0, 320, ch_height2)];
        // [sv_content setContentSize:CGSizeMake(320, ch_height2 + 50)];
        [sv_content setContentSize:CGSizeMake(320, ch_height2+0)];
        [btn_url setFrame:CGRectMake(69, 1163, 208, 22)];
    }
    
    NSString *view2 = [Language getText:@"about_nucal"];
    NSString *isHidden = @"NO";
    NSString *buttonMode = @"home";
	NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
}

- (void)viewDidUnload
{
    [self setImg_about:nil];
    [self setBtn_url:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)buttonPressed:(id)button {
    if(button == btn_url){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.nutritionlabel.gov.hk"]]; 
    }
}

- (void)setMode:(int)mode{
    
}
@end
