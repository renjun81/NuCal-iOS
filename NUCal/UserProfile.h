//
//  UserProfile.h
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profile.h"
#import "NuFormula.h"
#import "NuCalAlert.h"

@interface UserProfile : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, NuCalAlertDelegate>{
 
    NSInteger currentProfileIndex;
    Profile *currentProfile;
    NSString *userName;
    int gender;
    float weight;
    int weightType;
    float height;
    float height_ft;
    float height_inch;
    int heightType;
    int age;
    int activityLv;
    int energyReq;
    int BMIType;
    int asian;
    
    UIImage *profile_pic;
    IBOutlet UILabel *l_name;
    IBOutlet UITextField *tf_name;
    IBOutlet UIImageView *iv_name;
    IBOutlet UILabel *l_gender;
    IBOutlet UIButton *b_male;
    IBOutlet UIButton *b_female;
    IBOutlet UILabel *l_weight;
    IBOutlet UITextField *tf_weight;
    IBOutlet UIImageView *iv_weight;
    IBOutlet UIButton *b_lbs;
    IBOutlet UIButton *b_kg;
    IBOutlet UILabel *l_height;
    IBOutlet UITextField *tf_height;
    IBOutlet UIImageView *iv_height;
    IBOutlet UIButton *b_ft;
    IBOutlet UIButton *b_m;
    IBOutlet UILabel *l_age;
    IBOutlet UILabel *l_year;
    IBOutlet UILabel *l_years;
    IBOutlet UIButton *b_ageNeg;
    IBOutlet UIButton *b_agePlus;
    IBOutlet UISlider *sl_age;
    IBOutlet UILabel *l_activity;
    IBOutlet UIButton *b_al_low;
    IBOutlet UIButton *b_al_mid;
    IBOutlet UIButton *b_al_high;
    IBOutlet UIButton *b_cal;
    IBOutlet UIButton *b_nonAsian;
    IBOutlet UIButton *b_photo;
    
    IBOutlet UIImageView *im_ruler;
    IBOutlet UIImageView *im_pointer;
    IBOutlet UILabel *l_bmi;

    IBOutlet UILabel *lbl_cal_bmi;
    IBOutlet UILabel *lbl_star_name;
    IBOutlet UILabel *lbl_star_weight;
    IBOutlet UILabel *lbl_star_height;
    IBOutlet UILabel *lbl_daily;
    IBOutlet UITextField *tf_energy;
    IBOutlet UIView *v_BMI;
    IBOutlet UILabel *lbl_kacl_unit;
    IBOutlet UIView *v_tf_energy;
    IBOutlet UIView *v_heightInput_ft, *v_heightInput_m;
    IBOutlet UIImageView *iv_height_ft, *iv_height_inch;
    IBOutlet UITextField *tf_height_ft, *tf_height_inch;
    UIImagePickerController *imagePicker;
    
    // code - add IPHONE5 support by CSA4 - 5.6.2014
    IBOutlet UIImageView *im_extra;
    IBOutlet UIView *v_holder;
    
//    IBOutlet UIImage *profile_pic;
}
@property (nonatomic,retain) UIButton *b_photo;

- (void)setMode:(int)mode;
- (void)setIndex : (NSInteger) index;
- (IBAction) photoButton:(id)button;
- (IBAction) genderButton:(id)button;
- (IBAction) weightButton:(id)button;
- (IBAction) heightButton:(id)button;
- (IBAction) ageButton:(id)button;
- (IBAction) calButton:(id)button;
//- (IBAction)non_asian_calBMI:(id)sender;

- (IBAction) actLevelButton:(id)button;
- (IBAction) ageSliderValueChanged:(id)slider;
- (void) calBMI;
- (BOOL) checkInput;
- (void) checkValid;
- (BOOL) checkName;
- (void) initWithProfile:(Profile*) profile;
- (void) storeProfile:(Profile*) profile;

- (void) closeImagePicker;

//- (void)updateProfileImageHandler:(NSNotification *)notification;
- (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
@end
