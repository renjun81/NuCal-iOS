//
//  Introduction.m
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Introduction.h"
#import "NUCalViewController.h"

extern NUCalViewController *mainController;

@implementation Introduction
@synthesize img_help;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        [self.view addSubview:sv_content];
    }
    return self;
}

- (void)dealloc
{
    [img_help release];
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
    
    
    // code - original - 4/5/2014
    NSString *view2 = [Language getText:@"help"];
//    @"Help";
    NSString *isHidden = @"NO";
    NSString *buttonMode = @"";
    
    if ([mainController firstRun] == NO)
    {
        buttonMode = @"home";
    }
    
	NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
    
    if(mainController.firstRun == NO){
        // hide button (b_profile) - setHidden:YES
        [b_profile setHidden:YES];
        
        // if the device is iPhone3GS or 4/4S, extra_height = 0
        // if the device is iPhone5 or 5C/5S, extra_height = 88, so we need to draw a longer scroll view
        if (IS_IPHONE5()) {
            int extra = 88;
            [sv_content setFrame:CGRectMake(0, 48, 320, 480-47 + extra)];
        } else {
            [sv_content setFrame:CGRectMake(0, 48, 320, 480-47)];
        } // if end
        
        // set content now ...
        if([[Language currentLanguage]isEqualToString:@"en"]){
            [img_help setImage:[UIImage imageNamed:@"help"]];
            [img_help setFrame:CGRectMake(0, 0, 320, 2000)];
            [sv_content setContentSize:CGSizeMake(320, 2050)];
        }
        else if([[Language currentLanguage]isEqualToString:@"zh"]){
            [img_help setImage:[UIImage imageNamed:@"help_tc"]];
            [img_help setFrame:CGRectMake(0, 0, 320, 2000)];
            [sv_content setContentSize:CGSizeMake(320, 1550)];
        }
        else if([[Language currentLanguage]isEqualToString:@"sc"]){
            [img_help setImage:[UIImage imageNamed:@"help_sc"]];
            [img_help setFrame:CGRectMake(0, 0, 320, 2000)];
            [sv_content setContentSize:CGSizeMake(320, 1550)];
        }
    }
    else{ // this is the first run of mainController.
        // show button (b_profile) - setHidden:NO
        if([[Language currentLanguage]isEqualToString:@"en"]){
            [img_help setImage:[UIImage imageNamed:@"help"]];
            [img_help setFrame:CGRectMake(0, 0, 320, 2000)];
            [sv_content setContentSize:CGSizeMake(320, 2050)];
            [b_profile setImage:[UIImage imageNamed:@"btn_firstprofile"] forState:UIControlStateNormal];
        }
        else if([[Language currentLanguage]isEqualToString:@"zh"]){
            [img_help setImage:[UIImage imageNamed:@"help_tc"]];
            [img_help setFrame:CGRectMake(0, 0, 320, 2000)];
            [sv_content setContentSize:CGSizeMake(320, 1550)];
            [b_profile setImage:[UIImage imageNamed:@"btn_firstprofile_tc"] forState:UIControlStateNormal];
        }
        else if([[Language currentLanguage]isEqualToString:@"sc"]){
            [img_help setImage:[UIImage imageNamed:@"help_sc"]];
            [img_help setFrame:CGRectMake(0, 0, 320, 2000)];
            [sv_content setContentSize:CGSizeMake(320, 1550)];
            [b_profile setImage:[UIImage imageNamed:@"btn_firstprofile_sc"] forState:UIControlStateNormal];
        }
    }

}

- (void)viewDidUnload
{
    [self setImg_help:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    // return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return NO;
}

- (void)setMode:(int)mode{
    
}

- (void) buttonHandler:(UIButton*)button
{
    if (button == b_profile)
    {
        NSString *view = @"UserProfile";
        NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
    }
}

@end
