//
//  AddEditFood.h
//  NUCal
//
//  Created by MGIECA2011006 on 31/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profile.h"
#import "Food.h"
#import "NuFormula.h"
#import "NuCalAlert.h"

@interface AddEditFood : UIViewController<UIPickerViewDelegate, UITextFieldDelegate, NuCalAlertDelegate>  {
    
    IBOutlet UIScrollView *sv_addfood;
    //nutrition information
    BOOL isPickerJustOpen;
    
    IBOutlet UITextField *tf_food;
    IBOutlet UITextField *tf_nutrition;
    IBOutlet UITextField *tf_energy;
    IBOutlet UITextField *tf_protein;
    IBOutlet UITextField *tf_sat_fat;
    IBOutlet UITextField *tf_trans_fat;
    IBOutlet UITextField *tf_cholesterol;
    IBOutlet UITextField *tf_carbohydrates;
    IBOutlet UITextField *tf_fibre;
    IBOutlet UITextField *tf_sugar;
    IBOutlet UITextField *tf_sodium;
    IBOutlet UITextField *tf_totalfat;
    
    IBOutlet UIButton *btn_per100;
    IBOutlet UIButton *btn_per100ml;
    IBOutlet UIButton *btn_package;
    
    IBOutlet UIButton *btn_g;
    IBOutlet UIButton *btn_ml;
    
    IBOutlet UIButton *btn_kcal;
    IBOutlet UIButton *btn_kJ;
    
    IBOutlet UIButton *btn_carbohy;
    IBOutlet UIView *v_picker;
    IBOutlet UIPickerView *p_picker;
    IBOutlet UIToolbar *kb_toolbar;
    IBOutlet UIBarButtonItem *kb_toolbarNext;
    IBOutlet UIBarButtonItem *kb_toolbarPrevious;
    UILabel *lbl_food_star;
    UILabel *lbl_nu_star;
    UILabel *lbl_energy_star;
    UILabel *lbl_protein_star;
    UILabel *lbl_totalfat_star;
    UILabel *lbl_satfat_star;
    UILabel *lbl_transfat_star;
    UILabel *lbl_car_star;
    UILabel *lbl_fibre_star;
    UILabel *lbl_sugar_star;

    
    NSArray *arrayNo;
    
    IBOutlet UIButton *btn_cancel;
    IBOutlet UIButton *btn_confirm;
    
    IBOutlet UIButton *btn_save;
    
    NSInteger carbohydratesType;
    
    UITextField *nowEditingField;
    
    BOOL isEdit;
    int editingIndex;
    
    Food *editingFood;
    NSMutableArray *currentFoodList;
    
    BOOL canSavePass;
    
    CGPoint nowOffset;
    
    NuCalAlert *nowAlert;
    
    //label for language
    IBOutlet UILabel *lbl_nutrition;
    IBOutlet UILabel *lbl_cholesterol;
    UILabel *lbl_food;
    UILabel *lbl_energy;
    UILabel *lbl_protein;
    UILabel *lbl_totalFat;
    UILabel *lbl_satFat;
    UILabel *lbl_transFat;
    UILabel *lbl_car;
    UILabel *lbl_fibre;
    UILabel *lbl_sugar;
    UILabel *lbl_sodium;
    UILabel *lbl_nu_info;
    UILabel *lbl_g1;
    UILabel *lbl_g2;
    UILabel *lbl_g3;
    UILabel *lbl_g4;
    UILabel *lbl_g5;
    UILabel *lbl_g6;
    UILabel *lbl_g7;
    UILabel *lbl_mg;
    IBOutlet UILabel *lbl_mg1;
    
    //End label for language
    
    
}

@property (nonatomic , retain) UIScrollView *sv_addfood;
@property (nonatomic , retain) UIButton *btn_per100 , *btn_per100ml, *btn_package, *btn_kcal,*btn_kJ,*btn_save,*btn_carbohy;
@property (nonatomic , retain) UIView *v_picker;
@property(nonatomic, retain) UIPickerView *p_picker;
@property (nonatomic, retain) NSArray *arrayNo;
@property (nonatomic, retain) UILabel *lbl_nutrition;
@property (nonatomic, retain) UITextField *tf_food, *tf_nutrition, *tf_energy, *tf_protein, *tf_sat_fat, *tf_trans_fat, *tf_cholesterol, 
*tf_carbohydrates, *tf_fibre, *tf_sugar, *tf_sodium, *tf_totalfat;
@property (nonatomic, retain) IBOutlet UIToolbar *kb_toolbar;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *kb_toolbarNext;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *kb_toolbarPrevious;
@property (nonatomic, retain) IBOutlet UILabel *lbl_food_star;
@property (nonatomic, retain) IBOutlet UILabel *lbl_nu_star;
@property (nonatomic, retain) IBOutlet UILabel *lbl_energy_star;
@property (nonatomic, retain) IBOutlet UILabel *lbl_protein_star;
@property (nonatomic, retain) IBOutlet UILabel *lbl_totalfat_star;
@property (nonatomic, retain) IBOutlet UILabel *lbl_satfat_star;
@property (nonatomic, retain) IBOutlet UILabel *lbl_transfat_star;
@property (nonatomic, retain) IBOutlet UILabel *lbl_car_star;
@property (nonatomic, retain) IBOutlet UILabel *lbl_fibre_star;
@property (nonatomic, retain) IBOutlet UILabel *lbl_sugar_star;
@property (nonatomic, retain) IBOutlet UILabel *lbl_food;
@property (nonatomic, retain) IBOutlet UILabel *lbl_energy;
@property (nonatomic, retain) IBOutlet UILabel *lbl_protein;
@property (nonatomic, retain) IBOutlet UILabel *lbl_totalFat;
@property (nonatomic, retain) IBOutlet UILabel *lbl_satFat;
@property (nonatomic, retain) IBOutlet UILabel *lbl_transFat;
@property (nonatomic, retain) IBOutlet UILabel *lbl_car;
@property (nonatomic, retain) IBOutlet UILabel *lbl_fibre;
@property (nonatomic, retain) IBOutlet UILabel *lbl_sugar;
@property (nonatomic, retain) IBOutlet UILabel *lbl_sodium;
@property (nonatomic, retain) IBOutlet UILabel *lbl_nu_info;
@property (nonatomic, retain) IBOutlet UILabel *lbl_g1;
@property (nonatomic, retain) IBOutlet UILabel *lbl_g2;
@property (nonatomic, retain) IBOutlet UILabel *lbl_g3;
@property (nonatomic, retain) IBOutlet UILabel *lbl_g4;
@property (nonatomic, retain) IBOutlet UILabel *lbl_g5;
@property (nonatomic, retain) IBOutlet UILabel *lbl_g6;
@property (nonatomic, retain) IBOutlet UILabel *lbl_g7;
@property (nonatomic, retain) IBOutlet UILabel *lbl_mg;


- (void)pickerViewOpen;
- (void)pickerViewClose;
- (void)setMode:(int)mode;
- (IBAction)per_package:(id)sender;
- (IBAction)per_100g:(id)sender;
- (IBAction)per_100ml:(id)sender;

- (IBAction)per_package_g:(id)sender;
- (IBAction)per_package_ml:(id)sender;

- (IBAction)choose_kcal:(id)sender;
- (IBAction)choose_kJ:(id)sender;
- (IBAction)save_food:(id)sender;
- (IBAction)choose_carbohy:(id)sender;
- (IBAction)cancel_v_picker:(id)sender;
- (IBAction)confirm_v_picker:(id)sender;
- (Food*)saveFoodByInput;
- (void) storeProfile:(Profile*) profile;
- (IBAction)toolBarButtonPress:(UIBarButtonItem*)btn;

@end
