//
//  UserProfile.m
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UserProfile.h"
#import "NUCalViewController.h"

extern NUCalViewController *mainController;

@implementation UserProfile
@synthesize b_photo;

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
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"updateProfileImage" object:nil];
    [currentProfile release];
    [lbl_star_name release];
    [lbl_star_weight release];
    [lbl_star_height release];
    [lbl_daily release];
    [tf_energy release];
    [v_BMI release];
    [lbl_kacl_unit release];
    [v_tf_energy release];
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeImagePicker) name:@"backButton" object:nil];
    
//    asian = true;
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];
    
    [sl_age setMinimumTrackImage:[[UIImage imageNamed:@"slider_on.png"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [sl_age setThumbImage: [UIImage imageNamed:@"slider_pointer.png"] forState:UIControlStateNormal];
    NSString *view2 = [Language getText:@"user_profile"];
//    @"User Profile";
    NSString *isHidden = @"NO";
    NSString *buttonMode = @"userhome";
    
    [l_name setText:[Language getText:@"name"]];
    [l_gender setText:[Language getText:@"gender"]];
    [b_female setTitle:[Language getText:@"female"] forState:UIControlStateNormal];
    [b_female setTitle:[Language getText:@"female"] forState:UIControlStateSelected];
    [b_male setTitle:[Language getText:@"male"] forState:UIControlStateNormal];
    [b_male setTitle:[Language getText:@"male"] forState:UIControlStateSelected];
    
    [l_weight setText:[Language getText:@"weight"]];
    [b_lbs setTitle:[Language getText:@"lbs"] forState:UIControlStateNormal];
    [b_lbs setTitle:[Language getText:@"lbs"] forState:UIControlStateSelected];
    [b_kg setTitle:[Language getText:@"kg"] forState:UIControlStateNormal];
    [b_kg setTitle:[Language getText:@"kg"] forState:UIControlStateSelected];
    
    [l_height setText:[Language getText:@"height"]];
    [tf_height_ft setPlaceholder:[Language getText:@"ft"]];
    [tf_height_inch setPlaceholder:[Language getText:@"inch"]];
    [b_ft setTitle:[Language getText:@"ft"] forState:UIControlStateNormal];
    [b_ft setTitle:[Language getText:@"ft"] forState:UIControlStateSelected];
    [b_m setTitle:[Language getText:@"m"] forState:UIControlStateNormal];
    [b_m setTitle:[Language getText:@"m"] forState:UIControlStateSelected];
    
    [l_age setText:[Language getText:@"age"]];
    [l_years setText:[Language getText:@"years"]];
    
    [l_activity setText:[Language getText:@"al"]];
    
    [lbl_daily setText:[Language getText:@"daily_energy"]];
    [lbl_kacl_unit setText:[Language getText:@"kcal"]];
    [lbl_cal_bmi setText:[Language getText:@"cal_bmi"]];
    
    if([[Language currentLanguage] isEqualToString:@"en"]){
        [b_al_low setImage:[UIImage imageNamed:@"btn_pal_low_off"] forState:UIControlStateNormal];
        [b_al_low setImage:[UIImage imageNamed:@"btn_pal_low_on"] forState:UIControlStateSelected];
        [b_al_mid setImage:[UIImage imageNamed:@"btn_pal_medium_off"] forState:UIControlStateNormal];
        [b_al_mid setImage:[UIImage imageNamed:@"btn_pal_medium_on"] forState:UIControlStateSelected];
        [b_al_high setImage:[UIImage imageNamed:@"btn_pal_high_off"] forState:UIControlStateNormal];
        [b_al_high setImage:[UIImage imageNamed:@"btn_pal_high_on"] forState:UIControlStateSelected];
        [b_cal setImage:[UIImage imageNamed:@"btn_asian"] forState:UIControlStateNormal];
        [b_nonAsian setImage:[UIImage imageNamed:@"btn_nonasian"] forState:UIControlStateNormal];
        [im_ruler setImage:[UIImage imageNamed:@"balance_asian_on"]];
    }
    else if([[Language currentLanguage] isEqualToString:@"zh"]){
        [b_al_low setImage:[UIImage imageNamed:@"btn_pal_low_tc_off"] forState:UIControlStateNormal];
        [b_al_low setImage:[UIImage imageNamed:@"btn_pal_low_tc_on"] forState:UIControlStateSelected];
        [b_al_mid setImage:[UIImage imageNamed:@"btn_pal_medium_tc_off"] forState:UIControlStateNormal];
        [b_al_mid setImage:[UIImage imageNamed:@"btn_pal_medium_tc_on"] forState:UIControlStateSelected];
        [b_al_high setImage:[UIImage imageNamed:@"btn_pal_high_tc_off"] forState:UIControlStateNormal];
        [b_al_high setImage:[UIImage imageNamed:@"btn_pal_high_tc_on"] forState:UIControlStateSelected];
        [b_cal setImage:[UIImage imageNamed:@"btn_asian_tc"] forState:UIControlStateNormal];
        [b_nonAsian setImage:[UIImage imageNamed:@"btn_nonasian_tc"] forState:UIControlStateNormal];
        CGPoint tmpCentre = b_cal.center;
//        [b_cal setFrame:CGRectMake(0, 0, 168, 35)];
//        [b_cal setCenter:tmpCentre];
        
        [im_ruler setImage:[UIImage imageNamed:@"balance_asian_on"]];
    }
    else if([[Language currentLanguage] isEqualToString:@"sc"]){
        [b_al_low setImage:[UIImage imageNamed:@"btn_pal_low_tc_off"] forState:UIControlStateNormal];
        [b_al_low setImage:[UIImage imageNamed:@"btn_pal_low_tc_on"] forState:UIControlStateSelected];
        [b_al_mid setImage:[UIImage imageNamed:@"btn_pal_medium_tc_off"] forState:UIControlStateNormal];
        [b_al_mid setImage:[UIImage imageNamed:@"btn_pal_medium_tc_on"] forState:UIControlStateSelected];
        [b_al_high setImage:[UIImage imageNamed:@"btn_pal_high_tc_off"] forState:UIControlStateNormal];
        [b_al_high setImage:[UIImage imageNamed:@"btn_pal_high_tc_on"] forState:UIControlStateSelected];
        [b_cal setImage:[UIImage imageNamed:@"btn_asian_sc"] forState:UIControlStateNormal];
        [b_nonAsian setImage:[UIImage imageNamed:@"btn_nonasian_sc"] forState:UIControlStateNormal];
        CGPoint tmpCentre = b_cal.center;
//        [b_cal setFrame:CGRectMake(0, 0, 168, 35)];
//        [b_cal setCenter:tmpCentre];
        
        [im_ruler setImage:[UIImage imageNamed:@"balance_asian_on"]];
    }
//    NSMutableArray *temp = [Tool getProfile:1];
    
    // add IPHONE support by CSA4 - 9.6.2014
    [self show_v_holder];
    
    if ([mainController firstRun] == YES || [mainController newUser] == YES)
    {
        if ([[Tool getProfile] count] == 0)
        {
            buttonMode = @"";
            view2 = [Language getText:@"add_user"];
        }
        
        // original code - 31.5.2014 - by csa 4
        // [v_BMI setFrame:CGRectMake(0, 480, 320, 120)];
        
        // code - add iphone5 support by csa4 - 5.6.2014
        [self hide_v_BMI];
        
        [lbl_daily setAlpha:0];
        [lbl_kacl_unit setAlpha:0];
        [v_tf_energy setAlpha:0];
        age = 28;
        b_al_low.selected = YES;
    }
    else
    {
        [self initWithProfile:mainController.currentProfile];
        age = (int)[sl_age value];
        [l_year setText:[NSString stringWithFormat:@"%d", age]];
        [b_al_low setEnabled:YES];
        [b_al_mid setEnabled:YES];
        [b_al_high setEnabled:YES];
        if(age >= 60 && age <=69){
            if(b_al_high.selected){
                b_al_high.selected = false;
                b_al_mid.selected = true;
            }
            [b_al_high setEnabled:FALSE];
        }
        if(age >= 70 && age <=79){
            if(b_al_high.selected){
                b_al_high.selected = false;
                b_al_mid.selected = true;
            }
            [b_al_high setEnabled:FALSE];
        }
        if(age >= 80){
            if(b_al_high.selected){
                b_al_high.selected = false;
                b_al_low.selected = true;
            }
            if(b_al_mid.selected){
                b_al_mid.selected = false;
                b_al_low.selected = true;
            }
            [b_al_mid setEnabled:FALSE];
            [b_al_high setEnabled:FALSE];
        }
        
        // original code - 31.5.2014 - by csa 4
        // [v_BMI setFrame:CGRectMake(0, 359, 320, 120)];
        
        // code - add iphone5 support by csa4 - 5.6.2014
        [self show_v_BMI];
        
    } // if end
    
    
	NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
}

- (void)viewDidUnload
{
    [lbl_star_name release];
    lbl_star_name = nil;
    [lbl_star_weight release];
    lbl_star_weight = nil;
    [lbl_star_height release];
    lbl_star_height = nil;
    [lbl_daily release];
    lbl_daily = nil;
    [tf_energy release];
    tf_energy = nil;
    [v_BMI release];
    v_BMI = nil;
    [lbl_kacl_unit release];
    lbl_kacl_unit = nil;
    [v_tf_energy release];
    v_tf_energy = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)setMode:(int)mode
{
    
}

- (void)setIndex : (NSInteger) index
{
    currentProfileIndex = index;
}

#pragma mark - Textfield Delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *temp = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if(textField != tf_name && [temp length] >0){
        NSCharacterSet *numberSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
        NSString *trimmed = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        NSRange matchRange = [trimmed rangeOfCharacterFromSet:numberSet];
        BOOL isNumeric = matchRange.location == 0 && matchRange.length == trimmed.length && trimmed.length > 0;
        return isNumeric;
    }
    else{
        return true;
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if(textField == tf_energy){
        [UIImageView beginAnimations:@"wholeViewFLY" context:nil];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationFinished:finished:context:)];
        [self.view setFrame:CGRectMake(0, -120, 320, 480)];
        [UIView commitAnimations];
    }
}

- (void) textFieldDidEndEditing:(UITextField *)textField
{
    [self checkValid];
    if(textField == tf_energy){
        [currentProfile setEnergyRequirment:[tf_energy.text intValue]];
        [mainController.currentProfile updateProfile:currentProfile];
        [self storeProfile:mainController.currentProfile];
    }
    if (textField == tf_height_inch) {
        if ([[tf_height_inch text] floatValue] >= 12)
        {
            float dividend = 0;
            float quotient = 0;
            float remainder = 0;
            
            dividend = [[tf_height_inch text] floatValue];
            quotient = floorf(dividend / 12.0);
            remainder = dividend - quotient*12.0;
            
            [tf_height_inch setText:[NSString stringWithFormat:@"%0.0f", roundf(remainder)]];
            [tf_height_ft setText:[NSString stringWithFormat:@"%0.0f", roundf([tf_height_ft.text floatValue])  + quotient]];
        }
    }
    
    // original code - 31.5.2014
    // [self.view setFrame:CGRectMake(0, 0, 320, 480)];
    // add IPHONE support by CSA4 - 9.6.2014
    [self show_v_self];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if(textField == tf_energy){
        [currentProfile setEnergyRequirment:[tf_energy.text intValue]];
        [mainController.currentProfile updateProfile:currentProfile];
        [self storeProfile:mainController.currentProfile];
    }
    // original code - 31.5.2014
    // [self.view setFrame:CGRectMake(0, 0, 320, 480)];
    // add IPHONE support by CSA4 - 9.6.2014
    [self show_v_self];
    return YES;
}

#pragma mark - Button handler

- (IBAction) photoButton:(id)button
{
    imagePicker = [[UIImagePickerController alloc] init];
	imagePicker.delegate = self;

    if (button == b_photo)
    {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    }
    [self presentModalViewController:imagePicker animated:NO];
    
//    NSString *view2 = [Language getText:@"user_profile"];
    NSString *view2 = [Language getText:@"profile_pic"];
    NSString *isHidden = @"NO";
    NSString *buttonMode = @"profileback";
    
	NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//	[picker dismissModalViewControllerAnimated:NO];
    
    CGSize picSize = CGSizeMake(50, 50);
    
    profile_pic = [self imageWithImage:[info objectForKey:@"UIImagePickerControllerOriginalImage"] scaledToSize:picSize] ;

    [b_photo setImage:profile_pic forState:UIControlStateNormal];
    
    if (mainController.firstRun != YES && mainController.newUser != YES)
    {
        [currentProfile setProfilePic:profile_pic];
        [Tool setDefaultProfile:currentProfileIndex];
        [mainController.currentProfile updateProfile:currentProfile];
        [self storeProfile:mainController.currentProfile];
    }
    
    NSString *view2 = [Language getText:@"user_profile"];
    NSString *isHidden = @"NO";
    
    NSString *buttonMode;
    if (mainController.firstRun)
        buttonMode = @"null";
    else
        buttonMode = @"userhome";
    
	NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
    
    [picker dismissModalViewControllerAnimated:NO];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];
    // original code - 31.5.2014
    // [self.view setFrame:CGRectMake(0, 0, 320, 480)];
    // add IPHONE support by CSA4 - 9.6.2014
    [self show_v_self];

}

- (void) refreshPage
{
    NSDictionary* dictionaryProfile = [NSDictionary dictionaryWithObjectsAndKeys: @"UserProfile", @"view",@"-1", @"mode", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionaryProfile];
}
//
- (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

//- (void)updateProfileImageHandler:(NSNotification *)notification
//{
//    NSDictionary* userInfo = [notification userInfo];
//	UIImage *profilePic = [userInfo objectForKey:@"image"];
////    [b_photo setImage:profilePic forState:UIControlStateNormal];
//    [b_photo setBackgroundImage:profilePic forState:UIControlStateNormal];
//}

- (IBAction) genderButton:(id)button
{
    if (button == b_male)
    {
        [b_male setSelected:YES];
        [b_female setSelected:NO];
        gender = MALE;
    }
    else if (button == b_female)
    {
        [b_male setSelected:NO];
        [b_female setSelected:YES];
        gender = FEMALE;
    }
}
- (IBAction) weightButton:(id)button
{
    if (button == b_lbs)
    {
        if ([[tf_weight text] length] > 0 && [b_kg isSelected])
        {
            [tf_weight setText:[NSString stringWithFormat:@"%.2f", [NuFormula KGTolbs:[[tf_weight text] floatValue]]]];
        }
        
        [b_lbs setSelected:YES];
        [b_kg setSelected:NO];
        weightType = LBS;

    }
    else if (button == b_kg)
    {
        if ([[tf_weight text] length] > 0 && [b_lbs isSelected])
        {
            [tf_weight setText:[NSString stringWithFormat:@"%.2f", [NuFormula lbsToKG:[[tf_weight text] floatValue]]]];
        }
        
        [b_lbs setSelected:NO];
        [b_kg setSelected:YES];
        weightType = KG;
    }
}
- (IBAction) heightButton:(id)button
{
    if (button == b_ft)
    {
        [b_ft setSelected:YES];
        [b_m setSelected:NO];
        heightType = FT;
        [v_heightInput_ft setHidden:NO];
        [v_heightInput_m setHidden:YES];
        
        if ([[tf_height text]length] >0)
        {
            NSMutableArray *unit = [NuFormula MToft:[[tf_height text]floatValue]];
            if ([unit count]>1)
            {
                [tf_height_ft setText:[NSString stringWithFormat:@"%0.0f",roundf([[unit objectAtIndex:0] floatValue])]];
                [tf_height_inch setText:[NSString stringWithFormat:@"%0.0f",roundf([[unit objectAtIndex:1] floatValue])]];
            }
        }
    }
    else if (button == b_m)
    {
        [b_ft setSelected:NO];
        [b_m setSelected:YES];
        heightType = METER;
        [v_heightInput_ft setHidden:YES];
        [v_heightInput_m setHidden:NO];
        
        if ([[tf_height_ft text] length] > 0 || [[tf_height_inch text] length] > 0)
        {
            [tf_height setText:[NSString stringWithFormat:@"%0.2f", [NuFormula ftToM:[[tf_height_ft text] floatValue] Inch:[[tf_height_inch text] floatValue]]]];
        }
    }
}
- (IBAction) ageButton:(id)button
{
    if (button == b_ageNeg)
    {
        if (age > [sl_age minimumValue])
        age--;
        
    }
    else if (button == b_agePlus)
    {
        if (age < [sl_age maximumValue])
        age++;
    }
    [l_year setText:[NSString stringWithFormat:@"%d", age]];
    [sl_age setValue:age animated:YES];
    [b_al_low setEnabled:YES];
    [b_al_mid setEnabled:YES];
    [b_al_high setEnabled:YES];
    if(age >= 60 && age <=69){
        if(b_al_high.selected){
            b_al_high.selected = false;
            b_al_mid.selected = true;
        }
        [b_al_high setEnabled:FALSE];
    }
    if(age >= 70 && age <=79){
        if(b_al_high.selected){
            b_al_high.selected = false;
            b_al_mid.selected = true;
        }
        [b_al_high setEnabled:FALSE];
    }
    if(age >= 80){
        if(b_al_high.selected){
            b_al_high.selected = false;
            b_al_low.selected = true;
        }
        if(b_al_mid.selected){
            b_al_mid.selected = false;
            b_al_low.selected = true;
        }
        [b_al_mid setEnabled:FALSE];
        [b_al_high setEnabled:FALSE];
    }
}

- (IBAction) ageSliderValueChanged:(id)slider
{
    age = (int)[sl_age value];
    [l_year setText:[NSString stringWithFormat:@"%d", age]];
    [b_al_low setEnabled:YES];
    [b_al_mid setEnabled:YES];
    [b_al_high setEnabled:YES];
    if(age >= 60 && age <=69){
        if(b_al_high.selected){
            b_al_high.selected = false;
            b_al_mid.selected = true;
        }
        [b_al_high setEnabled:FALSE];
    }
    if(age >= 70 && age <=79){
        if(b_al_high.selected){
            b_al_high.selected = false;
            b_al_mid.selected = true;
        }
        [b_al_high setEnabled:FALSE];
    }
    if(age >= 80){
        if(b_al_high.selected){
            b_al_high.selected = false;
            b_al_low.selected = true;
        }
        if(b_al_mid.selected){
            b_al_mid.selected = false;
            b_al_low.selected = true;
        }
        [b_al_mid setEnabled:FALSE];
        [b_al_high setEnabled:FALSE];
    }
}

- (IBAction) actLevelButton:(id)button
{
    NSArray *btnArray = [NSArray arrayWithObjects:b_al_low,b_al_mid,b_al_high, nil];
    
    for (UIButton *b in btnArray)
    {
        [b setSelected:NO];
    }
    
    if (button == b_al_low)
    {
        [b_al_low setSelected:YES];
        activityLv = AL_LOW;
    }
    else if (button == b_al_mid)
    {
        [b_al_mid setSelected:YES];
        activityLv = AL_MEDIUM;
    }
    else if (button == b_al_high)
    {
        [b_al_high setSelected:YES];
        activityLv = AL_HIGH;
    }
}

- (void) setRulerImage
{
    if (asian == ASIAN)
    {
        if([[Language currentLanguage] isEqualToString:@"en"])
        {
            [im_ruler setImage:[UIImage imageNamed:@"balance_asian_on"]];
        }
        else if([[Language currentLanguage] isEqualToString:@"zh"])
        {
            [im_ruler setImage:[UIImage imageNamed:@"balance_asian_on_tc"]];
        }
        else if([[Language currentLanguage] isEqualToString:@"sc"])
        {
            [im_ruler setImage:[UIImage imageNamed:@"balance_asian_on_sc"]];
        }
    }
    else if (asian == NONASIAN)
    {
        if([[Language currentLanguage] isEqualToString:@"en"])
        {
            [im_ruler setImage:[UIImage imageNamed:@"balance_nonasian_on"]];
        }
        else if([[Language currentLanguage] isEqualToString:@"zh"])
        {
            [im_ruler setImage:[UIImage imageNamed:@"balance_nonasian_on_tc"]];
        }
        else if([[Language currentLanguage] isEqualToString:@"sc"])
        {
            [im_ruler setImage:[UIImage imageNamed:@"balance_nonasian_on_sc"]];
        }
    }
}

- (IBAction) calButton:(id)button
{
    
    
    if (button == b_cal)
    {
        asian = ASIAN;
    }
    else if (button == b_nonAsian)
    {
        asian = NONASIAN;
    }
    
    [self setRulerImage];
    
    if ([self checkInput])
  {
      [UIImageView beginAnimations:@"BMIViewAppear" context:nil];
      [UIView setAnimationDuration:1];
      [UIView setAnimationDelegate:self];
      [UIView setAnimationDidStopSelector:@selector(animationFinished:finished:context:)];
      // original code
      // [v_BMI setFrame:CGRectMake(0, 359, 320, 120)];
      // code - add IPHONE support by CSA4 - 5.6.2014
      [self show_v_BMI];
      [UIView commitAnimations];
      
      [self storeProfile:currentProfile];
  }
}

// code - add IPHONE5 support by CSA4 - 5.6.2014
- (void) show_v_self {
    int extra = 0;
    if (IS_IPHONE5()) {
        extra = OFFSET1;
    } // if end
    [self.view setFrame:CGRectMake(0,extra,320,568)];
    
    // debug
    int tag = self.view.tag;
    int h = self.view.frame.size.height;
    int y = self.view.frame.origin.y;
    NSString *a = [[NSString alloc] initWithFormat:@"show_v_self tag%d, y=%d, h=%d, extra=%d", tag, y, h, extra];
    NSLog(@"---%@", a);
    [a release];    
    
} // show_v_self

- (void) show_v_holder {
    int extra = 0;
    if (IS_IPHONE5()) {
        extra = OFFSET1;
    } // if end
    [v_holder setFrame:CGRectMake(0,extra,320,568)];
    
    // debug
    int tag = v_holder.tag;
    int h = v_holder.frame.size.height;
    int y = v_holder.frame.origin.y;
    NSString *a = [[NSString alloc] initWithFormat:@"show_v_holder tag%d, y=%d, h=%d, extra=%d", tag, y, h, extra];
    NSLog(@"---%@", a);
    [a release];
    
} // show_v_holder

- (void) show_v_BMI {
    int extra = 0;
    if (IS_IPHONE5()) {
        extra = OFFSET1;
    } // if end
    NSString *a = [[NSString alloc] initWithFormat:@"show_v_BMI extra=%d", extra];
    NSLog(@"---%@", a);
    [a release];
    
    [v_BMI setFrame:CGRectMake(0,359+extra,320,120)];
    [im_extra setFrame:CGRectMake(0,480+extra, 320,88)];
} // show end

- (void) hide_v_BMI {
    int extra = 0;
    if (IS_IPHONE5()) {
        extra = OFFSET1;
    } // if end
    NSString *a = [[NSString alloc] initWithFormat:@"hide_v_BMI extra=%d", extra];
    NSLog(@"---%@", a);
    [a release];
    
    [v_BMI setFrame:CGRectMake(0,480+extra,320,120)];
    [im_extra setFrame:CGRectMake(0,480+extra, 320,88)];
} // hide end
// code - add IPHONE5 support by CSA4 - 5.6.2014

#pragma mark - Validation

- (BOOL) checkInputedHeight
{
    if ( (b_ft.selected && ([tf_height_ft.text length] == 0 && [tf_height_inch.text length] == 0)) 
        ||
        (b_m.selected && [tf_height.text length]==0)
        )
        return false;
    else
        return true;
}

- (BOOL) checkInput
{
    
    NSString *alertMessage = @"";
    if([tf_name.text length]==0 && [tf_weight.text length]==0 && ![self checkInputedHeight]){
        
        alertMessage = [Language getText:@"alert_profile12"];
        [iv_name setImage:[UIImage imageNamed:@"txtfield_name_error.png"]];
        [lbl_star_name setHidden:NO];
        [iv_weight setImage:[UIImage imageNamed:@"txtfield_weight_error.png"]];
        [lbl_star_weight setHidden:NO];
        [iv_height setImage:[UIImage imageNamed:@"txtfield_weight_error.png"]];
        [lbl_star_height setHidden:NO];
        [iv_height_ft setImage:[UIImage imageNamed:@"txtfield_weight_error.png"]];
        [iv_height_inch setImage:[UIImage imageNamed:@"txtfield_weight_error.png"]];

    }
    if ([tf_name.text length] == 0 && [tf_weight.text length]==0 && [self checkInputedHeight]) {
        
        alertMessage = [Language getText:@"alert_profile8"];
        [iv_name setImage:[UIImage imageNamed:@"txtfield_name_error.png"]];
        [lbl_star_name setHidden:NO];
        [iv_weight setImage:[UIImage imageNamed:@"txtfield_weight_error.png"]];
        [lbl_star_weight setHidden:NO];
    }
    if ([tf_name.text length] == 0 && ![self checkInputedHeight] && [tf_weight.text length]!=0) {
        alertMessage = [Language getText:@"alert_profile9"];
        [iv_name setImage:[UIImage imageNamed:@"txtfield_name_error.png"]];
        [lbl_star_name setHidden:NO];
        [iv_height setImage:[UIImage imageNamed:@"txtfield_weight_error.png"]];
        [lbl_star_height setHidden:NO];
        [iv_height_ft setImage:[UIImage imageNamed:@"txtfield_weight_error.png"]];
        [iv_height_inch setImage:[UIImage imageNamed:@"txtfield_weight_error.png"]];
    }
    if ([tf_weight.text length] == 0 && ![self checkInputedHeight] && [tf_name.text length]!=0) {
        alertMessage = [Language getText:@"alert_profile10"];
        [iv_weight setImage:[UIImage imageNamed:@"txtfield_weight_error.png"]];
        [lbl_star_weight setHidden:NO];
        [iv_height setImage:[UIImage imageNamed:@"txtfield_weight_error.png"]];
        [lbl_star_height setHidden:NO];
        [iv_height_ft setImage:[UIImage imageNamed:@"txtfield_weight_error.png"]];
        [iv_height_inch setImage:[UIImage imageNamed:@"txtfield_weight_error.png"]];
    }
    if ([tf_weight.text length] != 0 && [self checkInputedHeight] && [tf_name.text length]==0) {
        alertMessage = [Language getText:@"alert_profile5"];
        [iv_name setImage:[UIImage imageNamed:@"txtfield_name_error.png"]];
        [lbl_star_name setHidden:NO];
    }
    if ([tf_weight.text length] != 0 && ![self checkInputedHeight] && [tf_name.text length]!=0) {
        alertMessage = [Language getText:@"alert_profile7"];
        [iv_height setImage:[UIImage imageNamed:@"txtfield_weight_error.png"]];
        [lbl_star_height setHidden:NO];
        [iv_height_ft setImage:[UIImage imageNamed:@"txtfield_weight_error.png"]];
        [iv_height_inch setImage:[UIImage imageNamed:@"txtfield_weight_error.png"]];
    }
    if ([tf_weight.text length] == 0 && [self checkInputedHeight] && [tf_name.text length]!=0) {
        alertMessage = [Language getText:@"alert_profile6"];
        [iv_weight setImage:[UIImage imageNamed:@"txtfield_weight_error.png"]];
        [lbl_star_weight setHidden:NO];
    }
    if([alertMessage isEqualToString:@""] == NO){
        NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
        return NO;
    }
    
    BOOL HPass = YES;
    BOOL WPass = YES;
    
    if(heightType == FT){
        if([[tf_height_ft text]floatValue] > [[[NuFormula MToft:3] objectAtIndex:0] floatValue] ){
            HPass = NO;
        }
    }
    if(heightType == METER){
        if([[tf_height text]floatValue] > 3){
            HPass = NO;
        }
    }
    
    if(weightType == LBS){
        if([[tf_weight text]floatValue] > [NuFormula KGTolbs:200]){
            WPass = NO;
        }
    }
    if(weightType == KG){
        if([[tf_weight text]floatValue] > 200){
            WPass = NO;
        }
    }
    
    if(WPass == NO){
        [iv_weight setImage:[UIImage imageNamed:@"txtfield_weight_error.png"]];
        [lbl_star_weight setHidden:NO];
    }
    else{
        [iv_weight setImage:[UIImage imageNamed:@"txtfield_weight.png"]];
        [lbl_star_weight setHidden:YES];
    }
    if(HPass == NO){
        [iv_height_ft setImage:[UIImage imageNamed:@"txtfield_weight_error_short.png"]];
        [iv_height_inch setImage:[UIImage imageNamed:@"txtfield_weight_error_short.png"]];
        [iv_height setImage:[UIImage imageNamed:@"txtfield_weight_error.png"]];
        [lbl_star_height setHidden:NO];
    }
    else{
        [iv_height_ft setImage:[UIImage imageNamed:@"txtfield_weight_short.png"]];
        [iv_height_inch setImage:[UIImage imageNamed:@"txtfield_weight_short.png"]];
        [iv_height setImage:[UIImage imageNamed:@"txtfield_weight.png"]];
        [lbl_star_height setHidden:YES];
    }
    
    if(WPass == NO){
        if(weightType == LBS){
            NSString *alertMessage = [Language getText:@"alert_profile1"];
            NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
        }
        if(weightType == KG){
            NSString *alertMessage = [Language getText:@"alert_profile2"];
            NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
        }
        return NO;
    }
    if(HPass == NO){
        if(heightType == FT){
            NSString *alertMessage = [Language getText:@"alert_profile3"];
            NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
        }
        if(heightType == METER){
            NSString *alertMessage = [Language getText:@"alert_profile4"];
            NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
        }
        return NO;
    }
    
    BOOL result = YES;
    
    if ([[tf_name text] isEqualToString:@""])
    {
        [iv_name setImage:[UIImage imageNamed:@"txtfield_name_error.png"]];
        [lbl_star_name setHidden:NO];
        result = NO;
    }
    else
    {
        if (![self checkName])
        {
            result = NO;
        }
        userName = [tf_name text];
        [lbl_star_name setHidden:YES];
    }
    
    if (b_male.selected)
    {
        gender = MALE;
    }
    else if (b_female.selected)
    {
        gender = FEMALE;
    }
    
    if (b_lbs.selected)
    {
        weightType = LBS;
    }
    else if (b_kg.selected)
    {
        weightType = KG;
    }
    
    if ([[tf_weight text] isEqualToString:@""])
    {
        [iv_weight setImage:[UIImage imageNamed:@"txtfield_weight_error.png"]];
        [lbl_star_weight setHidden:NO];
        result = NO;
    }
    else
    {
        weight = [[tf_weight text] floatValue];
    }
    
    if (b_ft.selected)
    {
        heightType = FT;
        
        
        if ([[tf_height_ft text] isEqualToString:@""] && [[tf_height_inch text] isEqualToString:@""])
        {
            [iv_height_ft setImage:[UIImage imageNamed:@"txtfield_weight_error_short.png"]];
            [iv_height_inch setImage:[UIImage imageNamed:@"txtfield_weight_error_short.png"]];
            [lbl_star_height setHidden:NO];
            result = NO;
        }
        else
        {
            height_ft = [[tf_height_ft text] floatValue];
            height_inch = [[tf_height_inch text] floatValue];
        }
    }
    else if (b_m.selected)
    {
        heightType = METER;
        
        if ([[tf_height text] isEqualToString:@""])
        {
            [iv_height setImage:[UIImage imageNamed:@"txtfield_weight_error.png"]];
            [lbl_star_height setHidden:NO];
            result = NO;
        }
        else
        {
            height = [[tf_height text] floatValue];
        }
    }
    
    if (b_al_low.selected)
    {
        activityLv = AL_LOW;
    }
    else if (b_al_mid.selected)
    {
        activityLv = AL_MEDIUM;
    }
    else if (b_al_high.selected)
    {
        activityLv = AL_HIGH;
    }
    
    if (result == NO)
    {
//        NSString *alertMessage;
//        if([tf_name.text length]==0 && [tf_weight.text length]==0 && [tf_height.text length]==0){
//            alertMessage = @"Please Enter the name, weight and height";
//        }
//        if ([tf_name.text length] == 0 && [tf_weight.text length]==0 && [tf_height.text length]!=0) {
//            alertMessage = @"Please Enter the name and weight";
//        }
//        if ([tf_name.text length] == 0 && [tf_height.text length]==0 && [tf_weight.text length]!=0) {
//            alertMessage = @"Please Enter the name and height";
//        }
//        if ([tf_weight.text length] == 0 && [tf_height.text length]==0 && [tf_name.text length]!=0) {
//            alertMessage = @"Please Enter the weight and height";
//        }
//        if ([tf_weight.text length] != 0 && [tf_height.text length]!=0 && [tf_name.text length]==0) {
//            alertMessage = @"Please Enter the name";
//        }
//        if ([tf_weight.text length] != 0 && [tf_height.text length]==0 && [tf_name.text length]!=0) {
//            alertMessage = @"Please Enter the height";
//        }
//        if ([tf_weight.text length] == 0 && [tf_height.text length]!=0 && [tf_name.text length]!=0) {
//            alertMessage = @"Please Enter the weight";
//        }
//        NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage", nil];
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
    }
    else
    {

        
        NSString *view2 = [Language getText:@"user_profile"];
        NSString *isHidden = @"NO";
        NSString *buttonMode = @"userhome";
        NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
        
        if (currentProfile != nil)
        {
            [currentProfile release];
            currentProfile = nil;
        }
        
        currentProfile = [[Profile alloc] initWithData:[tf_name text] Gender:gender Weight:weight WeightType:weightType Height:height Height_ft:height_ft  Height_inch:height_inch HeightType:heightType Age:age ActivityLv:activityLv EnergyReq:[tf_energy.text intValue] ProfilePic:profile_pic Asian:asian];

        [currentProfile setEnergyRequirment:[NuFormula calEnergyRequirment:currentProfile]];        
        [tf_energy setText:[NSString stringWithFormat:@"%i", currentProfile.energyReq]];
        
//        [currentProfile setFoodList:[Tool getProfileFoodList]];
        if (!mainController.newUser)
        {
            [currentProfile setIntakeList:[mainController.currentProfile getIntakeList]];
            [currentProfile setIntakeHistoryList:[mainController.currentProfile getIntakeHistoryList]];
        }
        else
        {
            [currentProfile setIntakeList:[[[NSMutableArray alloc] init] autorelease]];
            [currentProfile setIntakeHistoryList:[[[NSMutableArray alloc] init] autorelease]];
        }
        
//        [self storeProfile:currentProfile];
    }
    
    return result;
}

- (void) checkValid
{
    if (![[tf_name text] isEqualToString:@""])
    {
        [iv_name setImage:[UIImage imageNamed:@"txtfield_name.png"]];
        [lbl_star_name setHidden:YES];
    }
    
    if (![[tf_weight text] isEqualToString:@""])
    {
        [iv_weight setImage:[UIImage imageNamed:@"txtfield_weight.png"]];
        [lbl_star_weight setHidden:YES];
    }
    
    if (![[tf_height text] isEqualToString:@""])
    {
        [iv_height setImage:[UIImage imageNamed:@"txtfield_weight.png"]];
        [lbl_star_height setHidden:YES];
    }
}

-(BOOL)checkName{
    [iv_name setImage:[UIImage imageNamed:@"txtfield_name.png"]];
    [lbl_star_name setHidden:YES];
    NSArray *currentProfileList = [Tool getProfile];
    
    for(int i = 0; i<[currentProfileList count]; i++){
        if([tf_name.text isEqualToString:[[currentProfileList objectAtIndex:i]userName]] && currentProfileIndex != i){
            //            UIAlertView *nameAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Food has already existed in the database" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            //            [nameAlert show];
            //            [nameAlert release];
            //            NSString *alertMessage = @"Food has already existed in the database";
            NSString *alertMessage = [Language getText:@"alert_name_exist"];
            NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage",[UIFont systemFontOfSize:16], @"alertFont", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
            [iv_name setImage:[UIImage imageNamed:@"txtfield_name_error.png"]];
            [lbl_star_name setHidden:NO];
            return NO;
        }
    }
    return YES;
}

- (void) calBMI
{
    [im_ruler setHidden:NO];
    
    float heightInMeter = 0;
    if (heightType == FT)
    {
        if ([[tf_height_ft text] length] > 0 && [[tf_height_inch text] length] == 0)
        {
            [tf_height_inch setText:@"0"];
        }
        heightInMeter = [NuFormula ftToM:[[tf_height_ft text]floatValue] Inch:[[tf_height_inch text]floatValue]];
    }
    else
        heightInMeter = [[tf_height text] floatValue];
    
    float BMIVal = [NuFormula calBMIFromWeight:[[tf_weight text] floatValue] inType:weightType AndHeight:heightInMeter inType:heightType];
    
    [l_bmi setText:[NSString stringWithFormat:@"BMI: %.01f", BMIVal]];
    NSLog(@"BMIVal = %f", BMIVal);
    
    BMIType = 0;
    
    if(asian == ASIAN){
        if (BMIVal<18.5){
        BMIType=1;
        [im_pointer setImage:[UIImage imageNamed:@"pointer_underweight.png"]];
        
        }
        else if (BMIVal>=23) {
        BMIType=3;
        [im_pointer setImage:[UIImage imageNamed:@"pointer_overweight.png"]];
    
        }
        else {
        BMIType=2;
            
             [im_pointer setImage:[UIImage imageNamed:@"pointer_normal.png"]];
        }
    }
    else if(asian == NONASIAN){
        if (BMIVal<18.5){
            BMIType=1;
            [im_pointer setImage:[UIImage imageNamed:@"pointer_underweight.png"]];
            
            
        }
        else if (BMIVal>=25) {
            BMIType=3;
            [im_pointer setImage:[UIImage imageNamed:@"pointer_overweight.png"]];
            
        }
        else {
            BMIType=2;
            //        NSLog(@"Aisan type = %i", asian);
                [im_pointer setImage:[UIImage imageNamed:@"pointer_normal.png"]];
            }
        
    }
    
    if(BMIVal == 0){
        BMIType = 3;
        [im_pointer setImage:[UIImage imageNamed:@"a.png"]];
    }
    
    [UIImageView beginAnimations:@"PointerMove" context:nil];
    [UIImageView setAnimationDuration:1];
    [UIImageView setAnimationDelegate:self];
    [UIImageView setAnimationDidStopSelector:@selector(animationFinished:finished:context:)];
    
//    float BMIdegree = 17.0 + (BMIVal - 22.0) * (110.0 / 13) ;
    float BMIdegree;
    
    if (asian == ASIAN){
        BMIdegree = 10.0 + (BMIVal - 22.0) * (110.0 / 13.0) ;
    }
    else if (asian == NONASIAN){
        BMIdegree = 10.0 + (BMIVal - 22.0) * (110.0 / 13.0) ;
    }
    
    NSLog(@"val:%f",BMIVal);
    
    
    float rotateDegree = 0;
    NSLog(@"degree = %f", BMIdegree);
    
    if(BMIdegree>=55){
        rotateDegree = 55.0 / 180.0 * 3.14;
    }
    else if(BMIdegree<=-55){
        rotateDegree = -55.0 / 180.0 * 3.14;
    }
    else{
        rotateDegree = BMIdegree / 180.0 * 3.14;
    }
    
    CGAffineTransform rotate = CGAffineTransformMakeRotation(rotateDegree);
    [im_pointer setTransform:rotate];
    [UIImageView commitAnimations];
    

}

#pragma mark - Profile IO

- (void) initWithProfile:(Profile*) profile
{
    if (currentProfile != nil)
    {
        [currentProfile release];
        currentProfile = nil;
    }
    currentProfile = [[Profile alloc] initWithProfile:profile];
    
//    NSLog(@"Count : %i", [[currentProfile getFoodList] count]);
    
    userName = profile.userName;
    [tf_name setText:userName];
    
    gender = profile.gender;
    if (gender == MALE)
    {
        [self genderButton:b_male];
    }
    else if (gender == FEMALE)
    {
        [self genderButton:b_female];
    }
    
    NSLog(@"weight = %.02f", weight);
    weight = profile.weight;
    [tf_weight setText:@""];
    weightType = profile.weightType;
    if (weightType == LBS)
    {
        [self weightButton:b_lbs];
    }
    else if (weightType == KG)
    {
        [self weightButton:b_kg];
    }
    [tf_weight setText:[NSString stringWithFormat:@"%.2f", weight]];
    

    
    height = profile.height;
    height_ft = profile.height_ft;
    height_inch = profile.height_inch;
    
    heightType = profile.heightType;
    if (heightType == FT)
    {
        [self heightButton:b_ft];
        if (height_ft > 0 || height_inch > 0)
        {
            [tf_height_ft setText:[NSString stringWithFormat:@"%.0f", roundf(height_ft)]];
            [tf_height_inch setText:[NSString stringWithFormat:@"%.0f", roundf(height_inch)]];
        }
        else
        {
            [tf_height_ft setText:[NSString stringWithFormat:@"%.2f", height]];
        }

    }
    else if (heightType == METER)
    {
        [self heightButton:b_m];
         [tf_height setText:[NSString stringWithFormat:@"%.2f", height]];
    }
    
    age = profile.age;
    [l_year setText:[NSString stringWithFormat:@"%d", age]];
    [sl_age setValue:age];
    
    activityLv = profile.activityLv;
    if (activityLv == AL_LOW)
    {
        [self actLevelButton:b_al_low];
    }
    else if (activityLv == AL_MEDIUM)
    {
        [self actLevelButton:b_al_mid];
    }
    else if (activityLv == AL_HIGH)
    {
        [self actLevelButton:b_al_high];
    }
    
    [tf_energy setText:[NSString stringWithFormat:@"%i", profile.energyReq]];
    
    asian = profile.asian;
    [self setRulerImage];
    profile_pic = profile.profile_pic;
    
    if(profile_pic != NULL)
    {
        [b_photo setImage:profile_pic forState:UIControlStateNormal];
    }
    else
    {
        [b_photo setImage:[UIImage imageNamed:@"userpic_default"] forState:UIControlStateNormal];
    }
    
    [self calBMI];
}

- (void) storeProfile:(Profile*) profile
{
    NSMutableArray *storeArray = [[NSMutableArray alloc] initWithArray:[Tool getProfile]];
    
    NSLog(@"%i", mainController.newUser);
    if (mainController.firstRun == YES || mainController.newUser == YES || (currentProfileIndex >= [storeArray count]))
    {
        [storeArray addObject:profile];
        [Tool setDefaultProfile:[storeArray count] -1 ];
        currentProfileIndex = [Tool getDefaultProfile];
    }
    else
    {
        [storeArray replaceObjectAtIndex:currentProfileIndex withObject:profile];
        [Tool setDefaultProfile:currentProfileIndex];
    }
    
    [Tool setProfileList:storeArray];
    [storeArray release];
    
    mainController.firstRun = NO;
    mainController.newUser = NO;
    
    [mainController reloadCurrentProfile];
}

-(void)animationFinished:(NSString *)animationID
                finished:(NSNumber *)finished
                 context:(void *)context
{
    if([animationID isEqualToString:@"BMIViewAppear"]){
        [self calBMI];
        [UIImageView beginAnimations:@"BMIViewElementAppear" context:nil];
        [UIView setAnimationDuration:1];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationFinished:finished:context:)];
        // orginal code
        // [v_BMI setFrame:CGRectMake(0, 359, 320, 120)];
        // code - add IPHONE5 support by CSA 4 - 5.6.2014
        [self show_v_BMI];
        
        [lbl_daily setAlpha:1];
        [lbl_kacl_unit setAlpha:1];
        [v_tf_energy setAlpha:1];
        [UIView commitAnimations];
        [currentProfile setEnergyRequirment:[NuFormula calEnergyRequirment:currentProfile]];        
        [tf_energy setText:[NSString stringWithFormat:@"%i", currentProfile.energyReq]];
        if(BMIType == 1 || BMIType == 3){
            NSString *alertMessage = [Language getText:@"alert_profile11"];
            NSLog(@"%@", alertMessage);
            if([[Language currentLanguage] isEqualToString:@"en"]){
                NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage", [UIFont systemFontOfSize:14], @"alertFont", nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
            }
            else{
                NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage", [UIFont systemFontOfSize:15], @"alertFont", nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
            }
        }
    }
}

- (void) closeImagePicker
{
    [imagePicker dismissModalViewControllerAnimated:NO];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];
    [self.view setFrame:CGRectMake(0, 0, 320, 480)];
    
    NSString *view2 = [Language getText:@"user_profile"];
    NSString *isHidden = @"NO";
    NSString *buttonMode = @"userhome";
    
	NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
    
}

@end
