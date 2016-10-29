//
//  MyIntake.h
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NuFormula.h"
#import "Profile.h"

@interface MyIntake : UIViewController <UITextFieldDelegate, UIScrollViewDelegate>{
    
    Profile *currentProfile;
    
    UILabel *lbl_name;
    UILabel *lbl_kcal;
    UITextView *tv_warning;
    
    UIView *v_input;
    UIButton *btn_calculate;
    UIScrollView *sv_result;
    UIView *v_intakeResult;
    UISlider *bar_low_energy;
    UISlider *bar_high_energy;
    UISlider *bar_low_protein;
    UISlider *bar_high_protein;
    UISlider *bar_low_totalFat;
    UISlider *bar_high_totalFat;
    UISlider *bar_low_SatFat;
    UISlider *bar_high_SatFat;
    
    UISlider *bar_low_TransFat;
    UISlider *bar_high_TransFat;
    
    UISlider *bar_low_cho;
    UISlider *bar_high_cho;
    
    UISlider *bar_low_Car;
    UISlider *bar_high_Car;
    UISlider *bar_low_Fibre;
    UISlider *bar_high_Fibre;
    UISlider *bar_low_Sodium;
    UISlider *bar_high_Sodium;
    UISlider *bar_low_Sugar;
    UISlider *bar_high_Sugar;
    UILabel *lbl_result_energy;
    UILabel *lbl_result_energy_percent;
    UILabel *lbl_result_protein;
    UILabel *lbl_result_protein_percent;
    UILabel *lbl_result_TotalFat;
    UILabel *lbl_result_TotalFat_percent;
    UILabel *lbl_result_SatFat;
    UILabel *lbl_result_SatFat_percent;
    UILabel *lbl_result_TransFat;
    UILabel *lbl_result_TransFat_percent;
    
    UILabel *lbl_result_cho;
    UILabel *lbl_result_cho_percent;
    
    UILabel *lbl_result_Car;
    UILabel *lbl_result_Car_percent;
    UILabel *lbl_result_Fibre;
    UILabel *lbl_result_Fibre_percent;
    UILabel *lbl_result_Sodium;
    UILabel *lbl_result_Sodium_percent;
    UILabel *lbl_result_Sugar;
    UILabel *lbl_result_Sugar_percent;
    UIButton *btn_saveToHistory;
    UILabel *lbl_dailyEnergy;
    UILabel *lbl_totalEnergyAndNutrient;
    UILabel *lbl_dailyLimit;
    UILabel *lbl_energy;
    UILabel *lbl_protein;
    UILabel *lbl_totalFat;
    UILabel *lbl_SatFat;
    UILabel *lbl_transFat;
    UILabel *lbl_cholesterol;
    UILabel *lbl_car;
    UILabel *lbl_fibre;
    UILabel *lbl_sugar;
    UILabel *lbl_sodium;
    UILabel *lbl_nu;
    UILabel *lbl_consumed;
    UILabel *lbl_nu_info;
    UILabel *lbl_food_title;
    UIView *v_myIntake;
    NSMutableArray *inputFieldArr;
    NSMutableArray *foodNameArr;
    NSMutableArray *weightTypeArr;
    NSMutableArray *starArr;
    NSMutableArray *sortedIntakeList;
    
    UITextField *nowEditingField;
    
    IBOutlet UIImageView *profile_pic;
    
    
    BOOL notCal;
    BOOL calOnce;
    BOOL alreadySet;
    
    float totalEnergy, totalProtein, totalFat, totalSatFat, totalTranFat,totalCho, totalCar,totalFibre, totalSodium, totalSugar;
//    float totalEnergy, totalProtein, totalFat, totalSatFat, totalTranFat, totalCar,totalFibre, totalSodium, totalSugar;
    BOOL overTake;
    CGSize oldSize;
    
    
}

@property (nonatomic, retain) IBOutlet UIView *v_myIntake;
@property (nonatomic, retain) IBOutlet UILabel *lbl_name;
@property (nonatomic, retain) IBOutlet UILabel *lbl_kcal;
@property (nonatomic, retain) IBOutlet UITextView *tv_warning;
@property (nonatomic, retain) IBOutlet UIView *v_input;
@property (nonatomic, retain) IBOutlet UIButton *btn_calculate;
@property (nonatomic, retain) IBOutlet UIScrollView *sv_result;
@property (nonatomic, retain) IBOutlet UIView *v_intakeResult;


@property (nonatomic, retain) IBOutlet UISlider *bar_low_energy;
@property (nonatomic, retain) IBOutlet UISlider *bar_high_energy;
@property (nonatomic, retain) IBOutlet UISlider *bar_low_protein;
@property (nonatomic, retain) IBOutlet UISlider *bar_high_protein;
@property (nonatomic, retain) IBOutlet UISlider *bar_low_totalFat;
@property (nonatomic, retain) IBOutlet UISlider *bar_high_totalFat;
@property (nonatomic, retain) IBOutlet UISlider *bar_low_SatFat;
@property (nonatomic, retain) IBOutlet UISlider *bar_high_SatFat;
@property (nonatomic, retain) IBOutlet UISlider *bar_low_TransFat;
@property (nonatomic, retain) IBOutlet UISlider *bar_high_TransFat;

@property (nonatomic, retain) IBOutlet UISlider *bar_low_cho;
@property (nonatomic, retain) IBOutlet UISlider *bar_high_cho;

@property (nonatomic, retain) IBOutlet UISlider *bar_low_Car;
@property (nonatomic, retain) IBOutlet UISlider *bar_high_Car;
@property (nonatomic, retain) IBOutlet UISlider *bar_low_Fibre;
@property (nonatomic, retain) IBOutlet UISlider *bar_high_Fibre;
@property (nonatomic, retain) IBOutlet UISlider *bar_low_Sodium;
@property (nonatomic, retain) IBOutlet UISlider *bar_high_Sodium;
@property (nonatomic, retain) IBOutlet UISlider *bar_low_Sugar;
@property (nonatomic, retain) IBOutlet UISlider *bar_high_Sugar;


@property (nonatomic, retain) IBOutlet UILabel *lbl_result_energy;
@property (nonatomic, retain) IBOutlet UILabel *lbl_result_energy_percent;
@property (nonatomic, retain) IBOutlet UILabel *lbl_result_protein;
@property (nonatomic, retain) IBOutlet UILabel *lbl_result_protein_percent;
@property (nonatomic, retain) IBOutlet UILabel *lbl_result_TotalFat;
@property (nonatomic, retain) IBOutlet UILabel *lbl_result_TotalFat_percent;
@property (nonatomic, retain) IBOutlet UILabel *lbl_result_SatFat;
@property (nonatomic, retain) IBOutlet UILabel *lbl_result_SatFat_percent;
@property (nonatomic, retain) IBOutlet UILabel *lbl_result_TransFat;
@property (nonatomic, retain) IBOutlet UILabel *lbl_result_TransFat_percent;

@property (nonatomic, retain) IBOutlet UILabel *lbl_result_cho;
@property (nonatomic, retain) IBOutlet UILabel *lbl_result_cho_percent;

@property (nonatomic, retain) IBOutlet UILabel *lbl_result_Car;
@property (nonatomic, retain) IBOutlet UILabel *lbl_result_Car_percent;
@property (nonatomic, retain) IBOutlet UILabel *lbl_result_Fibre;
@property (nonatomic, retain) IBOutlet UILabel *lbl_result_Fibre_percent;
@property (nonatomic, retain) IBOutlet UILabel *lbl_result_Sodium;
@property (nonatomic, retain) IBOutlet UILabel *lbl_result_Sodium_percent;
@property (nonatomic, retain) IBOutlet UILabel *lbl_result_Sugar;
@property (nonatomic, retain) IBOutlet UILabel *lbl_result_Sugar_percent;

@property (nonatomic, retain) IBOutlet UIButton *btn_saveToHistory;
@property (nonatomic, retain) IBOutlet UILabel *lbl_dailyEnergy;
@property (nonatomic, retain) IBOutlet UILabel *lbl_totalEnergyAndNutrient;
@property (nonatomic, retain) IBOutlet UILabel *lbl_dailyLimit;
@property (nonatomic, retain) IBOutlet UILabel *lbl_energy;
@property (nonatomic, retain) IBOutlet UILabel *lbl_protein;
@property (nonatomic, retain) IBOutlet UILabel *lbl_totalFat;
@property (nonatomic, retain) IBOutlet UILabel *lbl_SatFat;
@property (nonatomic, retain) IBOutlet UILabel *lbl_transFat;
@property (nonatomic, retain) IBOutlet UILabel *lbl_cholesterol;
@property (nonatomic, retain) IBOutlet UILabel *lbl_car;
@property (nonatomic, retain) IBOutlet UILabel *lbl_fibre;
@property (nonatomic, retain) IBOutlet UILabel *lbl_sugar;
@property (nonatomic, retain) IBOutlet UILabel *lbl_sodium;
@property (nonatomic, retain) IBOutlet UILabel *lbl_nu;
@property (nonatomic, retain) IBOutlet UILabel *lbl_consumed;
@property (nonatomic, retain) IBOutlet UILabel *lbl_nu_info;
@property (nonatomic, retain) IBOutlet UILabel *lbl_food_title;
@property (nonatomic, retain) IBOutlet UIImageView *profile_pic;


- (IBAction)buttonPress:(id)sender;
- (void)setMode:(int)mode;
- (void)calResult;
- (void) storeProfile:(Profile*) profile;

@end
