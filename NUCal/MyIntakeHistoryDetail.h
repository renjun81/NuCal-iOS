//
//  MyIntakeHistoryDetail.h
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profile.h"

@interface MyIntakeHistoryDetail : UIViewController {
    
    int historyIndex;
    
    Profile *currentProfile;
    
    UILabel *lbl_name;
    UILabel *lbl_date;
    UISlider *bar_energy_low;
    UISlider *bar_energy_high;
    UISlider *bar_protein_low;
    UISlider *bar_protein_high;
    UISlider *bar_totalFat_low;
    UISlider *bar_totalFat_high;
    UISlider *bar_satFat_low;
    UISlider *bar_satFat_high;
    UISlider *bar_transFat_low;
    UISlider *bar_transFat_high;
    UISlider *bar_car_low;
    UISlider *bar_car_high;
    UISlider *bar_fibre_low;
    UISlider *bar_fibre_high;
    UISlider *bar_sugar_low;
    UISlider *bar_sugar_high;
    UISlider *bar_cho_high;
    UISlider *bar_cho_low;
    UISlider *bar_sodium_low;
    UISlider *bar_sodium_high;
    UILabel *lbl_energy_result;
    UILabel *lbl_energy_percent;
    UILabel *lbl_potein_result;
    UILabel *lbl_potein_percent;
    UILabel *lbl_totalFat_result;
    UILabel *lbl_totalFat_percent;
    UILabel *lbl_satFat_result;
    UILabel *lbl_satFat_percent;
    UILabel *lbl_transFat_result;
    UILabel *lbl_transFat_percent;
    UILabel *lbl_car_result;
    UILabel *lbl_car_percent;
    UILabel *lbl_fibre_result;
    UILabel *lbl_fibre_percent;
    UILabel *lbl_sugar_result;
    UILabel *lbl_sugar_percent;
    
    UILabel *lbl_cho_result;
    UILabel *lbl_cho_percent;
    
    UILabel *lbl_sodium_result;
    UILabel *lbl_sodium_percent;
    UIScrollView *sv_result;
    UIView *v_intakeResult;
    UILabel *lbl_amountConsumed;
    UILabel *lbl_foodRefAmount;
    UILabel *lbl_your_intakeHistory;
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
    UILabel *lbl_food_title;
    UILabel *lbl_nu;
    UILabel *lbl_daily;
    UILabel *lbl_kcal_unit;
    UIView *v_foodInfo;
    
    IBOutlet UIImageView *user_icon;
    
}
@property (nonatomic, retain) IBOutlet UIView *v_foodInfo;
@property (nonatomic, retain) IBOutlet UILabel *lbl_name;
@property (nonatomic, retain) IBOutlet UILabel *lbl_date;
@property (nonatomic, retain) IBOutlet UISlider *bar_energy_low;
@property (nonatomic, retain) IBOutlet UISlider *bar_energy_high;
@property (nonatomic, retain) IBOutlet UISlider *bar_protein_low;
@property (nonatomic, retain) IBOutlet UISlider *bar_protein_high;
@property (nonatomic, retain) IBOutlet UISlider *bar_totalFat_low;
@property (nonatomic, retain) IBOutlet UISlider *bar_totalFat_high;
@property (nonatomic, retain) IBOutlet UISlider *bar_satFat_low;
@property (nonatomic, retain) IBOutlet UISlider *bar_satFat_high;
@property (nonatomic, retain) IBOutlet UISlider *bar_transFat_low;
@property (nonatomic, retain) IBOutlet UISlider *bar_transFat_high;
@property (nonatomic, retain) IBOutlet UISlider *bar_car_low;
@property (nonatomic, retain) IBOutlet UISlider *bar_car_high;
@property (nonatomic, retain) IBOutlet UISlider *bar_fibre_low;
@property (nonatomic, retain) IBOutlet UISlider *bar_fibre_high;
@property (nonatomic, retain) IBOutlet UISlider *bar_sugar_low;
@property (nonatomic, retain) IBOutlet UISlider *bar_sugar_high;
@property (nonatomic, retain) IBOutlet UISlider *bar_cho_high;
@property (nonatomic, retain) IBOutlet UISlider *bar_cho_low;
@property (nonatomic, retain) IBOutlet UISlider *bar_sodium_low;
@property (nonatomic, retain) IBOutlet UISlider *bar_sodium_high;

@property (nonatomic, retain) IBOutlet UILabel *lbl_energy_result;
@property (nonatomic, retain) IBOutlet UILabel *lbl_energy_percent;
@property (nonatomic, retain) IBOutlet UILabel *lbl_potein_result;
@property (nonatomic, retain) IBOutlet UILabel *lbl_potein_percent;
@property (nonatomic, retain) IBOutlet UILabel *lbl_totalFat_result;
@property (nonatomic, retain) IBOutlet UILabel *lbl_totalFat_percent;
@property (nonatomic, retain) IBOutlet UILabel *lbl_satFat_result;
@property (nonatomic, retain) IBOutlet UILabel *lbl_satFat_percent;
@property (nonatomic, retain) IBOutlet UILabel *lbl_transFat_result;
@property (nonatomic, retain) IBOutlet UILabel *lbl_transFat_percent;
@property (nonatomic, retain) IBOutlet UILabel *lbl_car_result;
@property (nonatomic, retain) IBOutlet UILabel *lbl_car_percent;
@property (nonatomic, retain) IBOutlet UILabel *lbl_fibre_result;
@property (nonatomic, retain) IBOutlet UILabel *lbl_fibre_percent;
@property (nonatomic, retain) IBOutlet UILabel *lbl_sugar_result;
@property (nonatomic, retain) IBOutlet UILabel *lbl_sugar_percent;

@property (nonatomic, retain) IBOutlet UILabel *lbl_cho_result;
@property (nonatomic, retain) IBOutlet UILabel *lbl_cho_percent;

@property (nonatomic, retain) IBOutlet UILabel *lbl_sodium_result;
@property (nonatomic, retain) IBOutlet UILabel *lbl_sodium_percent;

@property (nonatomic, retain) IBOutlet UIScrollView *sv_result;
@property (nonatomic, retain) IBOutlet UIView *v_intakeResult;

@property (nonatomic, retain) IBOutlet UILabel *lbl_amountConsumed;
@property (nonatomic, retain) IBOutlet UILabel *lbl_foodRefAmount;
@property (nonatomic, retain) IBOutlet UILabel *lbl_your_intakeHistory;
@property (nonatomic, retain) IBOutlet UILabel *lbl_totalEnergyAndNutrient;
@property (nonatomic, retain) IBOutlet UILabel *lbl_dailyLimit;
@property (nonatomic, retain) IBOutlet UILabel *lbl_energy;
@property (nonatomic, retain) IBOutlet UILabel *lbl_protein;
@property (nonatomic, retain) IBOutlet UILabel *lbl_totalFat;
@property (nonatomic, retain) IBOutlet UILabel *lbl_SatFat;
@property (nonatomic, retain) IBOutlet UILabel *lbl_transFat;
@property (nonatomic, retain) IBOutlet UILabel *lbl_car;
@property (nonatomic, retain) IBOutlet UILabel *lbl_fibre;
@property (nonatomic, retain) IBOutlet UILabel *lbl_sugar;
@property (nonatomic, retain) IBOutlet UILabel *lbl_cholesterol;
@property (nonatomic, retain) IBOutlet UILabel *lbl_sodium;
@property (nonatomic, retain) IBOutlet UILabel *lbl_food_title;
@property (nonatomic, retain) IBOutlet UILabel *lbl_nu;
@property (nonatomic, retain) IBOutlet UILabel *lbl_daily;
@property (nonatomic, retain) IBOutlet UILabel *lbl_kcal_unit;

@property (nonatomic, retain) IBOutlet UIImageView *user_icon;


- (void)setMode:(int)mode;

@end
