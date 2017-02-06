//
//  Menu.m
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Menu.h"
#import "NUCalViewController.h"

@implementation Menu

@synthesize timer;

extern NUCalViewController *mainController;

int count;
int loopCount;
//NSTimer timer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [iv_header release];

    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


//- (void)updateCounter:(NSTimer *)theTimer {
//	count ++;
//    
//    NSLog(@"count:%i",count);
//
//    
//    if(count == 1){
////        [self addfoodAnimation];
//        [self foodlistAnimation];
//        [self historyAnimation];
//        [self intakeAnimation];
//    }
//    else if (count == 2){
//        [self addfoodAnimation];
////        [self foodlistAnimation];
//        [self historyAnimation];
//        [self intakeAnimation];
//        
//    }
//    else if (count == 3){
//        [self addfoodAnimation];
//        [self foodlistAnimation];
////        [self historyAnimation];
//        [self intakeAnimation];
//    }
//    else if (count >= 4){
//        [self addfoodAnimation];
//        [self foodlistAnimation];
//        [self historyAnimation];
////        [self intakeAnimation];
//        count = 0;
//    }
//}
//
//- (void) loopCounter:(NSTimer *)timer{
//    
//    loopCount ++;
//    
//    NSLog(@"wt?:%i",loopCount);
//    
//    if(loopCount == 1){
////    [v_addfood setHidden:YES];
//        [[im_addfood superview] sendSubviewToBack:im_addfood]; 
//        [im_addfood setFrame:CGRectMake(640, 439, 320, 41)];
//    }
//    else if(loopCount == 2){
////    [v_foodlist setHidden:YES];
//        [[im_foodlist superview] sendSubviewToBack:im_foodlist]; 
//        [im_foodlist setFrame:CGRectMake(640, 439, 320, 41)];
//    }
//    else if(loopCount == 3){
////    [v_history setHidden:YES];
//        [[im_history superview] sendSubviewToBack:im_history]; 
//        [im_history setFrame:CGRectMake(640, 439, 320, 41)];
//    }
//    else if(loopCount >= 4){
////    [v_intake setHidden:YES];
//        [[im_intake superview] sendSubviewToBack:im_intake];
//        [im_intake setFrame:CGRectMake(640, 439, 320, 41)];
//        loopCount = 0;
//    }
//    
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    currentView = NULL;
    
    count = 0;
    
    NSString *view2 = @"";
    NSString *isHidden = @"YES";
    NSString *mode = @"";
	NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", mode, @"mode", isHidden, @"isHidden", nil];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
    if([[Language currentLanguage] isEqualToString:@"en"]){
        [iv_header setImage:[UIImage imageNamed:@"main_header"]];
        [b_addFood setImage:[UIImage imageNamed:@"btn_addfood"] forState:UIControlStateNormal];
        [b_foodList setImage:[UIImage imageNamed:@"btn_foodlist"] forState:UIControlStateNormal];
        [b_intake setImage:[UIImage imageNamed:@"btn_intake"] forState:UIControlStateNormal];
        [b_history setImage:[UIImage imageNamed:@"btn_history"] forState:UIControlStateNormal];
        [b_profile setImage:[UIImage imageNamed:@"btn_profile"] forState:UIControlStateNormal];
        [b_setting setImage:[UIImage imageNamed:@"btn_setting"] forState:UIControlStateNormal];
    }
    else if([[Language currentLanguage] isEqualToString:@"zh"]){
        [iv_header setImage:[UIImage imageNamed:@"main_header_tc"]];
        [b_addFood setImage:[UIImage imageNamed:@"btn_addfood_tc"] forState:UIControlStateNormal];
        [b_foodList setImage:[UIImage imageNamed:@"btn_foodlist_tc"] forState:UIControlStateNormal];
        [b_intake setImage:[UIImage imageNamed:@"btn_intake_tc"] forState:UIControlStateNormal];
        [b_history setImage:[UIImage imageNamed:@"btn_history_tc"] forState:UIControlStateNormal];
        [b_profile setImage:[UIImage imageNamed:@"btn_profile_tc"] forState:UIControlStateNormal];
        [b_setting setImage:[UIImage imageNamed:@"btn_setting_tc"] forState:UIControlStateNormal];
    }
    else if([[Language currentLanguage] isEqualToString:@"sc"]){
        [iv_header setImage:[UIImage imageNamed:@"main_header_sc"]];
        [b_addFood setImage:[UIImage imageNamed:@"btn_addfood_sc"] forState:UIControlStateNormal];
        [b_foodList setImage:[UIImage imageNamed:@"btn_foodlist_sc"] forState:UIControlStateNormal];
        [b_intake setImage:[UIImage imageNamed:@"btn_intake_sc"] forState:UIControlStateNormal];
        [b_history setImage:[UIImage imageNamed:@"btn_history_sc"] forState:UIControlStateNormal];
        [b_profile setImage:[UIImage imageNamed:@"btn_profile_sc"] forState:UIControlStateNormal];
        [b_setting setImage:[UIImage imageNamed:@"btn_setting_sc"] forState:UIControlStateNormal];
    }
    
    currentBanner = 0;
    [self bannerControl];
    
    // add IPHONE5 support by CSA 4 - 9.6.2014
    [self move_all_buttons];
    
    // [im_addfood setImage:[UIImage imageNamed:[Language getText:@"sugar_pic"]]];
    // [im_addfood setFrame:CGRectMake(-1, 480-41+88, 322, 41)];
    
    // [UIView beginAnimations:@"BannerFadeOut" context:NULL];
    // [UIView setAnimationDuration:10];
    // [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    // [im_addfood setFrame:CGRectMake(-321, 480-41+88, 322, 41)];
    // [UIView commitAnimations];
    

    
//    timer =  [NSTimer scheduledTimerWithTimeInterval:10.0f
//                                                 target:self
//                                               selector:@selector(updateCounter:)
//                                               userInfo:nil
//                                             repeats:YES];
//    
//    loopTimer = [NSTimer scheduledTimerWithTimeInterval:10.0f
//                                                 target:self
//                                               selector:@selector(loopCounter:)
//                                               userInfo:nil
//                                                repeats:YES];
    
//    im_addfood.animationImages = [NSArray arrayWithObjects:
//                                 [UIImage imageNamed:@"banner_addfood.png"],
//                                 [UIImage imageNamed:@"banner_foodlist.png"],
//                                 [UIImage imageNamed:@"banner_history.png"], 
//                                 [UIImage imageNamed:@"banner_intake.png"],nil];
//    
//    im_addfood.animationDuration = 10.00; //1 second
//    im_addfood.animationRepeatCount = 0; //infinite
//    
//    [im_addfood startAnimating];

}

- (void)viewDidUnload
{
    [iv_header release];
    iv_header = nil;
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)setMode:(int)mode{
    // NSLog(@"mode = %i", mode);
}

- (IBAction) buttonPressed:(id)button
{
    NSString *view = @"";
    NSString *mode = @"-1";
    NSString *index = @"0";
    
    currentView = @"other";
    
    if (button == b_addFood)
    {
        view = @"AddEditFood";
    }
    else if (button == b_foodList)
    {
        view = @"FoodList";
    }
    else if (button == b_intake)
    {
        view = @"MyIntake";
        if([[mainController.currentProfile getIntakeList] count] == 0){
            NuCalAlert *noIntakeAlert = [[NuCalAlert alloc]initWithTitle:nil Subtitle:[Language getText:@"alert_nofood_select"] CancelButtonTitle:[Language getText:@"ok"] ButtonTitle:nil];
            [noIntakeAlert setSubTitleFont:[UIFont systemFontOfSize:16]];
            [noIntakeAlert show];
            [noIntakeAlert release];
            return;
        }
        else if([[mainController.currentProfile getIntakeHistoryList] count] >= 30){
            NuCalAlert *tooManyIntakeAlert = [[NuCalAlert alloc]initWithTitle:nil Subtitle:[Language getText:@"alert_too_many_food"] CancelButtonTitle:[Language getText:@"no"] ButtonTitle:[NSMutableArray arrayWithObject:[Language getText:@"yes"]]];
            [tooManyIntakeAlert setSubTitleFont:[UIFont systemFontOfSize:16]];
            [tooManyIntakeAlert setTag:2];
            [tooManyIntakeAlert setDelegate:self];
            [tooManyIntakeAlert show];
            [tooManyIntakeAlert release];
            return;
        }
    }
    else if (button == b_history)
    {
        view = @"MyIntakeHistory";
        
//        if([[mainController.currentProfile getIntakeHistoryList] count] >= 30){
//            NuCalAlert *tooManyIntakeAlert = [[NuCalAlert alloc]initWithTitle:nil Subtitle:[Language getText:@"alert_too_many_food"] CancelButtonTitle:[Language getText:@"no"] ButtonTitle:[NSMutableArray arrayWithObject:[Language getText:@"yes"]]];
//            [tooManyIntakeAlert setSubTitleFont:[UIFont systemFontOfSize:16]];
//            [tooManyIntakeAlert show];
//            [tooManyIntakeAlert release];
//            return;
//        }
        
        
    }
    else if (button == b_about)
    {
        view = @"About";
    }
    else if (button == b_profile)
    {
        view = @"UserProfile";
//        view = @"ChooseUser";
        index = [NSString stringWithFormat:@"%li", (long)[Tool getDefaultProfile]];
    }
    else if (button == b_setting)
    {
        NuCalAlert *changeLanguage = [[NuCalAlert alloc]initWithTitle:nil Subtitle:[Language getText:@"alert_select_language"] CancelButtonTitle:nil ButtonTitle:[NSMutableArray arrayWithObjects:@"English", @"繁體中文", @"简体中文",nil]];
        [changeLanguage show];
        [changeLanguage setDelegate:self];
        [changeLanguage setTag:1];
        [changeLanguage release];
        return;
    }
    else if (button == b_introduction)
    {
        view = @"Introduction";
    }
    
    [timer invalidate];
    timer = nil;
    
    [loopTimer invalidate];
    loopTimer = nil;
    
    [self.view.layer removeAllAnimations];
    
//    
//    [self stopAnimation];
    
	NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", mode, @"mode", index, @"index", nil];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
}

-(void)NuAlertView:(NuCalAlert *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    NSString *view;
    
    currentView = @"other";
    
    if(alertView.tag == 1){
        view = @"Menu";
        
        if(buttonIndex == 0){
            [Language saveCurrentLanguage:@"en"];
        }
        else if(buttonIndex == 1){
            [Language saveCurrentLanguage:@"zh"];
        }
        else if(buttonIndex == 2){
            [Language saveCurrentLanguage:@"sc"];
        }
    }
    else //if(alertView.tag == 2)
    {
       
        if(buttonIndex == 0)
        {
             view = @"MyIntakeHistory";
        }
        else
        {
             view = @"Menu";
        }
        
    }
    
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view",@"-1", @"mode", nil];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
}

//-(void) bannerAnimation{
//    int bannerX;
//    
//    bannerX = v_banner.frame.origin.x - 320;
//    
//    [UIView beginAnimations:nil context:NULL];
//	[UIView setAnimationDuration:0.4];
//	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//	[UIView setAnimationBeginsFromCurrentState:NO];
//	[v_banner setFrame:CGRectMake(bannerX, 439, 1280, 41)];
//	[UIView commitAnimations];
//}


//- (void) addfoodAnimation
//{
//    int addfoodX;
//    
//    addfoodX = im_addfood.frame.origin.x - 320;
//    
//    [UIImageView beginAnimations:NULL context:NULL];
//    [UIImageView setAnimationDuration:10];
//    [UIImageView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIImageView setAnimationBeginsFromCurrentState:NO];
//
//    [im_addfood setFrame:CGRectMake(addfoodX, 439, 320, 41)];
//}
//
//- (void) foodlistAnimation{
//    int foodlistX;
//    
//    foodlistX = im_foodlist.frame.origin.x -320;
//    
//    [UIImageView beginAnimations:NULL context:NULL];
//    [UIImageView setAnimationDuration:10];
//    [UIImageView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIImageView setAnimationBeginsFromCurrentState:NO];
//    
//    [im_foodlist setFrame:CGRectMake(foodlistX, 439, 320, 41)];
//}
//
//- (void) historyAnimation{
//    int historyX;
//    
//    historyX = im_history.frame.origin.x - 320;
//    
//    [UIImageView beginAnimations:NULL context:NULL];
//    [UIImageView setAnimationDuration:10];
//    [UIImageView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIImageView setAnimationBeginsFromCurrentState:NO]; 
//    
//    [im_history setFrame:CGRectMake(historyX, 439, 320, 41)];
//}
//
//- (void) intakeAnimation{
//    int intakeX;
//    
//    intakeX = im_intake.frame.origin.x - 320;
//    
//    [UIImageView beginAnimations:NULL context:NULL];
//    [UIImageView setAnimationDuration:10];
//    [UIImageView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIImageView setAnimationBeginsFromCurrentState:NO];
//    
//    [im_intake setFrame:CGRectMake(intakeX, 439, 320, 41)];
//}

//- (void) stopAnimation
//{
//    [im_addfood stopAnimating];
//    [im_foodlist stopAnimating];
//    [im_history stopAnimating];
//    [im_intake stopAnimating];
//}


- (void) bannerControl {
//    NSArray *bannerArray = [NSArray arrayWithObjects:[Language getText:@"bread"],[Language getText:@"chips"],[Language getText:@"milk"],[Language getText:@"oil"],[Language getText:@"salt"],[Language getText:@"sugar_pic"], nil];
    
    [im_addfood setImage:[UIImage imageNamed:[Language getText:@"sugar_pic"]]];
    // old code - 5.12.2014
    // [im_addfood setFrame:CGRectMake(-1, 439, 322, 41)];
    // [im_addfood setFrame:CGRectMake(-1, 439+88, 322, 41)];
    [self show_view:im_addfood:-1];

    NSArray *bannerArray = [NSArray arrayWithObjects:[Language getText:@"sugar_pic"],[Language getText:@"oil"],[Language getText:@"salt"],[Language getText:@"milk"],[Language getText:@"bread"],[Language getText:@"chips"], nil];
    
    currentBanner++;
    if (currentBanner >= [bannerArray count])
    {
        currentBanner = 0 ;
    }
    
    UIImageView *bannerView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[bannerArray objectAtIndex:currentBanner]]];
    
    // old code - 5.12.2014
    // [bannerView setFrame:CGRectMake(320, 439+88, 320, 41)];
    // [bannerView setFrame:CGRectMake(320, 439+88, 320, 41)];
    // code - add iphone5 support - by csa4 - 15.5.2014
    [self show_view:bannerView:320];

    
    [self.view addSubview:bannerView];     
    if(currentView == NULL)
    {
        [self fadeInAnimation:bannerView];
    }
    [bannerView release];
    
    [UIView beginAnimations:@"BannerFadeOut" context:NULL];
    [UIView setAnimationDuration:10];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    // old code - 5.12.2014
    // [im_addfood setFrame:CGRectMake(-321, 439, 320, 41)];
    // [im_addfood setFrame:CGRectMake(-321, 439+88, 320, 41)];
    // add iphone5 support - by csa4 - 15.5.2014
    [self show_view:im_addfood:-320];
    
    [UIView commitAnimations];

    
} // bannerControl


- (void) fadeInAnimation:(UIImageView*)animateView {
    
    // old code - 5.12.2014
    // [animateView setFrame:CGRectMake(320, 439, 320, 41)];
    // [animateView setFrame:CGRectMake(320, 439+88, 320, 41)];
    // add iphone5 support - by csa4 - 15.5.2014
    [self show_view:animateView:320];
    
    [UIView beginAnimations:@"BannerFadeIn" context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:10];
    [UIView setAnimationDidStopSelector:@selector(fadeOutAnimation)];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    // old code - 5.12.2014
    // [animateView setFrame:CGRectMake(0, 439, 320, 41)];
    // [animateView setFrame:CGRectMake(0, 439+88, 320, 41)];
    // add iphone5 support - by csa4 - 15.5.2014
    [self show_view:animateView:0];
    
    // old code - 5.12.2014
    [UIView commitAnimations];
    currentBannerView = animateView;
} // fadeInAnimation

- (void) fadeOutAnimation {
    [UIView beginAnimations:@"BannerFadeOut" context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:10];
    [UIView setAnimationWillStartSelector:@selector(bannerControl)];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];

    // old code - 5.12.2014
    // [currentBannerView setFrame:CGRectMake(-320, 439, 320, 41)];
    // [currentBannerView setFrame:CGRectMake(-320, 439+88, 320, 41)];
    // add iphone5 support - by csa4 - 15.5.2014
    [self show_view:currentBannerView:-320];
    
    [UIView commitAnimations];
    currentBannerView = nil;
    
} // fadeOutAnimation


// add IPHONE5 support by CSA 4 - 9.6.2014
- (void) show_view: (UIView*)im :(int) x {
    int extra = 0;
    if (IS_IPHONE5()) {
        extra = 88;
    } // if end
    [im setFrame:CGRectMake(x,439+extra,320,41)];
} // show_im_view


- (void) move_view: (UIView*)v : (int) idistance {
    if (idistance > 0) {
        // move the button if need
        CGRect tmp1 = v.frame;
        tmp1.origin.y += idistance; // increase view size by 88
        v.frame = tmp1;
        
        // debug
        NSInteger tag = v.tag;
        int y = v.frame.origin.y;
        NSString *a = [[NSString alloc] initWithFormat:@"UIButton tag%ld, move %d from y=%d to %d", (long)tag, idistance, y-idistance, y];
        NSLog(@"--- %@", a);
        [a release];
    } // if extra end
} // end

- (void) move_all_buttons {
    int delta = 0;
    
    if (IS_IPHONE5()) {
        delta = OFFSET1;
    } // if end;
    
    if (delta > 0) {
        // row 2 button move by delta
        [self move_view:b_addFood:delta];
        [self move_view:b_foodList:delta];
        
        // row 3 button move by 2*delta
        [self move_view:b_intake:delta*2];    
        [self move_view:b_history:delta*2];
        
        // row 4 button move by 3*delta
        [self move_view:b_about:delta*3];
        [self move_view:b_profile:delta*3];
        [self move_view:b_setting:delta*3];
        [self move_view:b_introduction:delta*3];
        
        // row 5 button move by 4*delta
        [self move_view:im_bg:delta*4];
        
        /*
         // row 2 button move by delta
         [self move_view:b_addFood:delta];
         // [self move_view:b_foodList:delta];
         
         // row 3 button move by 2*delta
         [self move_view:b_intake:delta*2];
         [self move_view:b_history:delta*2];
         
         // row 4 button move by 3*delta
         [self move_view:b_about:delta*3];
         // [self move_view:b_profile:delta*3];
         [self move_view:b_setting:delta*3];
         [self move_view:b_introduction:delta*3];
         
         // row 5 button move by 4*delta
         // [self move_view:im_bg:delta*4];
        */
    } // if delta end
} // if end

@end
