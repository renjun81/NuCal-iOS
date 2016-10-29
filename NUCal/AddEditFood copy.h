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

@interface AddEditFood : UIViewController<UIPickerViewDelegate, UITextFieldDelegate>  {
    
    IBOutlet UIScrollView *sv_addfood;
    //nutrition information
    
    
    IBOutlet UITextField *tf_food;
    IBOutlet UITextField *tf_nutrition;
    IBOutlet UITextField *tf_energy;
    IBOutlet UITextField *tf_protein;
    IBOutlet UITextField *tf_sat_fat;
    IBOutlet UITextField *tf_trans_fat;
    IBOutlet UITextField *tf_carbohydrates;
    IBOutlet UITextField *tf_fibre;
    IBOutlet UITextField *tf_sugar;
    IBOutlet UITextField *tf_sodium;
    IBOutlet UITextField *tf_totalfat;
    
    IBOutlet UIButton *btn_per100;
    IBOutlet UIButton *btn_package;
    
    IBOutlet UIButton *btn_kcal;
    IBOutlet UIButton *btn_kJ;
    
    IBOutlet UIButton *btn_carbohy;
    IBOutlet UIView *v_picker;
    IBOutlet UIPickerView *p_picker;
    IBOutlet UIToolbar *kb_toolbar;
    IBOutlet UIBarButtonItem *kb_toolbarNext;
    IBOutlet UIBarButtonItem *kb_toolbarPrevious;
    
    NSArray *arrayNo;
    
    IBOutlet UIButton *btn_cancel;
    IBOutlet UIButton *btn_confirm;
    
    IBOutlet UIButton *btn_save;
    
    IBOutlet UILabel *lbl_star1;
    IBOutlet UILabel *lbl_star2;
    IBOutlet UILabel *lbl_star0;
    
    IBOutlet UILabel *lbl_nutrition;
    
    NSInteger carbohydratesType;
    
    UITextField *nowEditingField;
    
    BOOL isEdit;
    int editingIndex;
    
    Food *editingFood;
    
    BOOL canSavePass;
}

@property (nonatomic , retain) UIScrollView *sv_addfood;
@property (nonatomic , retain) UIButton *btn_per100, *btn_package, *btn_kcal,*btn_kJ,*btn_save,*btn_carbohy;
@property (nonatomic , retain) UIView *v_picker;
@property(nonatomic, retain) UIPickerView *p_picker;
@property (nonatomic, retain) NSArray *arrayNo;
@property (nonatomic, retain) UILabel *lbl_star1, *lbl_star2, *lbl_star0 ,*lbl_nutrition;
@property (nonatomic, retain) UITextField *tf_food, *tf_nutrition, *tf_energy, *tf_protein, *tf_sat_fat, *tf_trans_fat, *tf_carbohydrates, *tf_fibre, *tf_sugar, *tf_sodium, *tf_totalfat;
@property (nonatomic, retain) IBOutlet UIToolbar *kb_toolbar;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *kb_toolbarNext;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *kb_toolbarPrevious;


- (void)pickerViewOpen;
- (void)pickerViewClose;
- (void)setMode:(int)mode;
- (IBAction)per_package:(id)sender;
- (IBAction)per_100g:(id)sender;
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
