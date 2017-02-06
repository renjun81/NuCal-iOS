//
//  AddEditFood.m
//  NUCal
//
//  Created by MGIECA2011006 on 31/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AddEditFood.h"
#import "NUCalViewController.h"

@implementation AddEditFood
@synthesize kb_toolbar;
@synthesize kb_toolbarNext;
@synthesize kb_toolbarPrevious;
@synthesize lbl_food_star;
@synthesize lbl_nu_star;
@synthesize lbl_energy_star;
@synthesize lbl_protein_star;
@synthesize lbl_totalfat_star;
@synthesize lbl_satfat_star;
@synthesize lbl_transfat_star;
@synthesize lbl_car_star;
@synthesize lbl_fibre_star;
@synthesize lbl_sugar_star;
@synthesize lbl_food;
@synthesize lbl_energy;
@synthesize lbl_protein;
@synthesize lbl_totalFat;
@synthesize lbl_satFat;
@synthesize lbl_transFat;
@synthesize lbl_car;
@synthesize lbl_fibre;
@synthesize lbl_sugar;
@synthesize lbl_sodium;
@synthesize lbl_nu_info;
@synthesize lbl_g1;
@synthesize lbl_g2;
@synthesize lbl_g3;
@synthesize lbl_g4;
@synthesize lbl_g5;
@synthesize lbl_g6;
@synthesize lbl_g7;
@synthesize lbl_mg;

extern NUCalViewController *mainController;

#pragma mark - View lifecycle

@synthesize sv_addfood;
@synthesize btn_per100, btn_per100ml ,btn_package;
@synthesize btn_kcal, btn_kJ;
@synthesize btn_carbohy;
@synthesize v_picker;
@synthesize p_picker;
@synthesize btn_save;
@synthesize arrayNo;
@synthesize lbl_nutrition;
@synthesize tf_food,tf_nutrition,tf_energy,tf_protein,tf_carbohydrates,tf_sat_fat,tf_trans_fat,tf_cholesterol,tf_sugar,tf_fibre,tf_sodium,tf_totalfat;


bool nutrition;
bool carbohydrates;
bool cal_fat;
bool cal_carbohy;
bool cal_sugar;
bool cal_nutrition;
bool cal_energy;


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
    [currentFoodList release];
    [arrayNo release];
//    [kb_toolbar release];
//    [kb_toolbarNext release];
//    [kb_toolbarPrevious release];
//    [lbl_food_star release];
//    [lbl_food_star release];
//    [lbl_nu_star release];
//    [lbl_energy_star release];
//    [lbl_protein_star release];
//    [lbl_totalfat_star release];
//    [lbl_satfat_star release];
//    [lbl_transfat_star release];
//    [lbl_car_star release];
//    [lbl_fibre_star release];
//    [lbl_sugar_star release];
    [lbl_food release];
    [lbl_energy release];
    [lbl_protein release];
    [lbl_totalFat release];
    [lbl_satFat release];
    [lbl_transFat release];
    [lbl_car release];
    [lbl_fibre release];
    [lbl_sugar release];
    [lbl_sodium release];
    [lbl_nu_info release];
    [lbl_g1 release];
    [lbl_g2 release];
    [lbl_g3 release];
    [lbl_g4 release];
    [lbl_g5 release];
    [lbl_g6 release];
    [lbl_g7 release];
    [lbl_mg release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - checking Formula

-(BOOL)checkCarBohydrates{
    if(carbohydratesType == TOTALCARBOHYDRATES){
        if([tf_carbohydrates.text length] == 0 && [tf_fibre.text length] == 0){
//            UIAlertView *fibreAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Please enter - The amount of dietary fibre" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//            [fibreAlert show];
//            [fibreAlert release];
//            NSString *alertMessage = @"Please enter - The amount of dietary fibre";
            NSString *alertMessage = [Language getText:@"alert_car01"];
            NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage", [UIFont systemFontOfSize:16], @"alertFont", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
            [nowEditingField resignFirstResponder];
            [tf_fibre setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
            [lbl_fibre_star setHidden:NO];
            [tf_sugar setBackground:[UIImage imageNamed:@"txtfield_food"]];
            [tf_carbohydrates setBackground:[UIImage imageNamed:@"txtfield_food"]];
            [lbl_sugar_star setHidden:YES];
            [lbl_car_star setHidden:YES];
            return NO;
        }
        if([tf_fibre.text length] == 0 && [tf_carbohydrates.text length] != 0){
//            UIAlertView *fibreAlert = [[UIAlertView alloc]initWithTitle:nil message:@"The amount of dietary fibre must be entered if total carbohydrates are selected." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//            [fibreAlert show];
//            [fibreAlert release];
//            NSString *alertMessage = @"The amount of dietary fibre must be entered if total carbohydrates are selected.";
            NSString *alertMessage = [Language getText:@"alert_car02"];
            NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage", [UIFont systemFontOfSize:16], @"alertFont", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
            [nowEditingField resignFirstResponder];
            [tf_fibre setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
            [lbl_fibre_star setHidden:NO];
            [tf_carbohydrates setBackground:[UIImage imageNamed:@"txtfield_food"]];
            [tf_sugar setBackground:[UIImage imageNamed:@"txtfield_food"]];
            [lbl_car_star setHidden:YES];
            [lbl_sugar_star setHidden:YES];
            return NO;
        }
        if([tf_fibre.text length] != 0 && [tf_carbohydrates.text length] != 0 && [tf_sugar.text length] != 0){
            if([tf_fibre.text floatValue] + [tf_sugar.text floatValue] > [tf_carbohydrates.text floatValue]){
//                UIAlertView *fibreTooLargeAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Please double check the values of \"Total carbohydrates\", \"Dietary fibre\" and \"Sugar\"." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                [fibreTooLargeAlert show];
//                [fibreTooLargeAlert release];
//                NSString *alertMessage = @"Please double check the values of \"Total carbohydrates\", \"Dietary fibre\" and \"Sugar\".";
                NSString *alertMessage = [Language getText:@"alert_car03"];
                NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage", [UIFont systemFontOfSize:16], @"alertFont", nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
                [nowEditingField resignFirstResponder];
                [tf_carbohydrates setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
                [tf_fibre setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
                [tf_sugar setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
                [lbl_car_star setHidden:NO];
                [lbl_fibre_star setHidden:NO];
                [lbl_sugar_star setHidden:NO];
                return NO;
            }
        }
        if([tf_fibre.text length] != 0 && [tf_carbohydrates.text length] != 0){
            if([tf_fibre.text floatValue] > [tf_carbohydrates.text floatValue]){
//                UIAlertView *fibreTooLargeAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Please double check the values of \"Total carbohydrates\" and \"Dietary fibre\" ." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                [fibreTooLargeAlert show];
//                [fibreTooLargeAlert release];
//                NSString *alertMessage = @"Please double check the values of \"Total carbohydrates\" and \"Dietary fibre\" .";
                NSString *alertMessage = [Language getText:@"alert_car04"];
                NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage", [UIFont systemFontOfSize:16], @"alertFont", nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
                [nowEditingField resignFirstResponder];
                [tf_carbohydrates setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
                [tf_fibre setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
                [lbl_car_star setHidden:NO];
                [lbl_fibre_star setHidden:NO];
                [tf_sugar setBackground:[UIImage imageNamed:@"txtfield_food"]];
                [lbl_sugar_star setHidden:YES];
                return NO;
            }
        }
    }
    else{
        if([tf_sugar.text length] != 0 && [tf_carbohydrates.text length] != 0){
            if ([tf_sugar.text floatValue] > [tf_carbohydrates.text floatValue]) {
//                UIAlertView *fibreTooLargeAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Please double check the values of \"Carbohydrates\" and \"Sugar\" ." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                [fibreTooLargeAlert show];
//                [fibreTooLargeAlert release];
//                NSString *alertMessage = @"Please double check the values of \"Carbohydrates\" and \"Sugar\" .";
                NSString *alertMessage = [Language getText:@"alert_car05"];
                NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage", [UIFont systemFontOfSize:16], @"alertFont", nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
                [nowEditingField resignFirstResponder];
                [tf_carbohydrates setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
                [tf_sugar setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
                [lbl_car_star setHidden:NO];
                [lbl_sugar_star setHidden:NO];
                return NO;
            }
        }
    }
    [tf_carbohydrates setBackground:[UIImage imageNamed:@"txtfield_food"]];
    [tf_fibre setBackground:[UIImage imageNamed:@"txtfield_food"]];
    [tf_sugar setBackground:[UIImage imageNamed:@"txtfield_food"]];
    [lbl_car_star setHidden:YES];
    [lbl_fibre_star setHidden:YES];
    [lbl_sugar_star setHidden:YES];
    return YES;
}

-(BOOL)checkFat{
    [tf_totalfat setBackground:[UIImage imageNamed:@"txtfield_food"]];
    [tf_sat_fat setBackground:[UIImage imageNamed:@"txtfield_food"]];
    [tf_trans_fat setBackground:[UIImage imageNamed:@"txtfield_food"]];
    [lbl_totalfat_star setHidden:YES];
    [lbl_satfat_star setHidden:YES];
    [lbl_transfat_star setHidden:YES];
    
    if([tf_totalfat.text length] != 0){
        if([tf_sat_fat.text length] != 0 && [tf_trans_fat.text length] != 0){
            if([tf_sat_fat.text floatValue] + [tf_trans_fat.text floatValue] > [tf_totalfat.text floatValue]){
//                UIAlertView *fatTooLargeAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Please double check the values of \"Total fat\", \"Saturated fat\" and \"Trans fat\"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                [fatTooLargeAlert show];
//                [fatTooLargeAlert release];
//                NSString *alertMessage = @"Please double check the values of \"Total fat\", \"Saturated fat\" and \"Trans fat\"";
                NSString *alertMessage = [Language getText:@"alert_fat01"];
                NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage", [UIFont systemFontOfSize:16], @"alertFont", nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
                [nowEditingField resignFirstResponder];
                [tf_totalfat setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
                [tf_sat_fat setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
                [tf_trans_fat setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
                [lbl_totalfat_star setHidden:NO];
                [lbl_satfat_star setHidden:NO];
                [lbl_transfat_star setHidden:NO];
                return NO;
            }
        }
        else if([tf_sat_fat.text length] != 0){
            if([tf_sat_fat.text floatValue] > [tf_totalfat.text floatValue]){
//                UIAlertView *fatTooLargeAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Please double check the values of \"Total fat\" and \"Saturated fat\"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                [fatTooLargeAlert show];
//                [fatTooLargeAlert release];
//                NSString *alertMessage = @"Please double check the values of \"Total fat\" and \"Saturated fat\"";
                NSString *alertMessage = [Language getText:@"alert_fat02"];
                NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage", [UIFont systemFontOfSize:16], @"alertFont", nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
                [nowEditingField resignFirstResponder];
                [tf_totalfat setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
                [tf_sat_fat setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
                [lbl_totalfat_star setHidden:NO];
                [lbl_satfat_star setHidden:NO];
                return NO;
            }
        }
        else if([tf_trans_fat.text length] != 0){
            if([tf_trans_fat.text floatValue] > [tf_totalfat.text floatValue]){
//                UIAlertView *fatTooLargeAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Please double check the values of \"Total fat\" and \"Trans fat\"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                [fatTooLargeAlert show];
//                [fatTooLargeAlert release];
//                NSString *alertMessage = @"Please double check the values of \"Total fat\" and \"Trans fat\"";
                NSString *alertMessage = [Language getText:@"alert_fat03"];
                NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage", [UIFont systemFontOfSize:16], @"alertFont", nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
                [nowEditingField resignFirstResponder];
                [tf_totalfat setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
                [tf_trans_fat setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
                [lbl_totalfat_star setHidden:NO];
                [lbl_transfat_star setHidden:NO];
                return NO;
            }
        }
    }
    return YES;
}

-(BOOL)checkName{
    [tf_food setBackground:[UIImage imageNamed:@"txtfield_foodname"]];
    [lbl_food_star setHidden:YES];
    if([[tf_food.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]length] == 0){
        [tf_food setBackground:[UIImage imageNamed:@"txtfield_foodname_pink"]];
//        UIAlertView *nameAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Please enter - The name of the food" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [nameAlert show];
//        [nameAlert release];
//        NSString *alertMessage = @"Please enter - The name of the food";
        NSString *alertMessage = [Language getText:@"alert_foodname"];
        NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage",[UIFont systemFontOfSize:16], @"alertFont", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
        [lbl_food_star setHidden:NO];   
        return NO;
    }
    for(int i = 0; i<[currentFoodList count]; i++){
        if([tf_food.text isEqualToString:[[currentFoodList objectAtIndex:i]name]] && editingFood != [currentFoodList objectAtIndex:i]){
//            UIAlertView *nameAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Food has already existed in the database" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//            [nameAlert show];
//            [nameAlert release];
//            NSString *alertMessage = @"Food has already existed in the database";
            NSString *alertMessage = [Language getText:@"alert_foodname_exist"];
            NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage",[UIFont systemFontOfSize:16], @"alertFont", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
            [tf_food setBackground:[UIImage imageNamed:@"txtfield_foodname_pink"]];
            [lbl_food_star setHidden:NO];
            return NO;
        }
    }
    return YES;
}

//-(BOOL)checkEnergy
//{
//    float energy = [tf_energy.text floatValue];
//    float protein = [tf_protein.text floatValue];
//    float totalFat = [tf_totalfat.text floatValue];
//    
//    if (energy != 0)
//    {
//        if(protein + totalFat
//    }
//    
//    return YES;
//}

-(BOOL)checkAmount{
    
    [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food"]];
    [lbl_nu_star setHidden:YES];
    float amount;
    float proteinVal = [tf_protein.text floatValue];
    float fatVal = [tf_totalfat.text floatValue];
    float carVal = [tf_carbohydrates.text floatValue];
    float fibreVal = [tf_fibre.text floatValue];
    
    NSLog(@"Fat = %f", fatVal);
    
    if(btn_per100.selected || btn_per100ml.selected){
        amount = 100;
        [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food_dim"]];

    }
    else //if(btn_package.selected)
    {
        
//        [lbl_nutrition setHidden:YES];
//        [btn_g setHidden:NO];
//        [btn_ml setHidden:NO];
        
        if([tf_nutrition.text length] == 0){
//            UIAlertView *nameAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Please enter - The food reference amount" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//            [nameAlert show];
//            [nameAlert release];
//            NSString *alertMessage = @"Please enter - The food reference amount";
            NSString *alertMessage = [Language getText:@"alert_amount"];
            NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage",[UIFont systemFontOfSize:16], @"alertFont", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
            [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
            [lbl_nu_star setHidden:NO];
            return NO;
        }
        amount = [tf_nutrition.text floatValue];
    }
    
    if(carbohydratesType == TOTALCARBOHYDRATES){
        carVal -= fibreVal;
    }
    else{
        //float tmp1 = [tf_carbohydrates.text floatValue];
        float tmp2 = [tf_fibre.text floatValue];
        float tmp3 = [tf_sugar.text floatValue];
        
        if([tf_carbohydrates.text length] == 0){
            if([tf_fibre.text length] == 0){
                if([tf_sugar.text length] == 0){
                    
                }else{
                    carVal = tmp3;
                }
            }else{
                if([tf_sugar.text length] == 0){
                    carVal = tmp2;
                }else{
                    carVal = tmp2 + tmp3;
                }
            }
        }else{
            carVal = MAX([tf_carbohydrates.text floatValue], ([tf_fibre.text floatValue] + [tf_sugar.text floatValue]));
        }
    }
    
    if(fatVal == 0){
        fatVal = [tf_sat_fat.text floatValue] + [tf_trans_fat.text floatValue];
        NSLog(@"MAX fat = %f", fatVal);
    }
    
    if(proteinVal + fatVal + carVal > amount){
//        UIAlertView *nameAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Total nutrients should not larger than food reference amount" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [nameAlert show];
//        [nameAlert release];
//        NSString *alertMessage = @"Total nutrients should not larger than food reference amount";
        NSString *alertMessage = [Language getText:@"alert_amount_large"];
        NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage",[UIFont systemFontOfSize:16], @"alertFont", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
        return NO;
    }
    return YES;
}

-(BOOL)checkEnergy{
    if([tf_energy.text length]==0){
        if([tf_protein.text length] == 0 &&
           [tf_totalfat.text length] == 0 &&
           [tf_sat_fat.text length] == 0 &&
           [tf_trans_fat.text length] == 0 &&
           [tf_carbohydrates.text length] == 0 &&
           [tf_cholesterol.text length] == 0 &&
           [tf_fibre.text length] == 0 &&
           [tf_sugar.text length] == 0 &&
           [tf_sodium.text length] ==0){
//            UIAlertView *nameAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Please enter - The energy value or at least one nutrient value" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//            [nameAlert show];
//            [nameAlert release];
//            NSString *alertMessage = @"Please enter - The energy value or at least one nutrient value";
            NSString *alertMessage = [Language getText:@"alert_amount_atleast"];
            NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage",[UIFont systemFontOfSize:16], @"alertFont", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
            return NO;
        }
    }else{
        if([tf_protein.text length] == 0 &&
           [tf_totalfat.text length] == 0 &&
           [tf_sat_fat.text length] == 0 &&
           [tf_trans_fat.text length] == 0 &&
           [tf_carbohydrates.text length] == 0 &&
           [tf_cholesterol.text length] == 0 &&
           [tf_fibre.text length] == 0 &&
           [tf_sugar.text length] == 0 &&
           [tf_sodium.text length] ==0){
            return YES;
        }
    }
    
//    if([tf_carbohydrates.text length]==0 || [tf_protein.text length]==0 || [tf_totalfat.text length]==0 || [tf_cholesterol.text length]==0){
//        return YES;
//    }
    
    float energyVal = [tf_energy.text floatValue];
    float proteinVal = [tf_protein.text floatValue];
    float fatVal = [tf_totalfat.text floatValue];
    float carVal = [tf_carbohydrates.text floatValue];
    float fibreVal = [tf_fibre.text floatValue];
    
    NSLog(@"energy val = %f", energyVal);
    
    if(carbohydratesType == TOTALCARBOHYDRATES){
        carVal -= fibreVal;
    }
    
    NSLog(@"protein val = %f", proteinVal);
    NSLog(@"fat val = %f", fatVal);
    NSLog(@"car val = %f", carVal);
    
//    if(btn_kcal.selected && energyVal!=0 && proteinVal !=0 && fatVal != 0 && carVal != 0){
    if(btn_kcal.selected && energyVal != 0){
        if([tf_protein.text length] !=0 && [tf_totalfat.text length] != 0 && [tf_carbohydrates.text length] != 0){
            if(energyVal <= (proteinVal*4 + fatVal*9 + carVal*4) * 0.7 || energyVal >= (proteinVal*4 + fatVal*9 + carVal*4) * 1.3){
//            UIAlertView *nameAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Please double check the values of \"Energy\", \"Protein\", \"Total Fat\" and \"Carbohydrates\"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//            [nameAlert show];
//            [nameAlert release];
//            NSString *alertMessage = @"Please double check the values of \"Energy\", \"Protein\", \"Total Fat\" and \"Carbohydrates\"";
                NSString *alertMessage = [Language getText:@"alert_energy01"];
                NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage", [UIFont systemFontOfSize:15], @"alertFont", nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
                return NO;
            }
        }
        return YES;
    }
    
//    if(btn_kJ.selected && energyVal!=0 && proteinVal !=0 && fatVal != 0 && carVal != 0){
    if(btn_kJ.selected && energyVal != 0){
        if([tf_protein.text length] !=0 && [tf_totalfat.text length] != 0 && [tf_carbohydrates.text length] != 0){
            if( energyVal <= (proteinVal*17 + fatVal*37 + carVal*17) * 0.7 || energyVal >= (proteinVal*17 + fatVal*37 + carVal*17) * 1.3){

            NSString *alertMessage = [Language getText:@"alert_energy01"];
            NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: alertMessage, @"alertMessage", [UIFont systemFontOfSize:15], @"alertFont", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"alertView" object:self userInfo:dictionary];
            return NO;
            }
        }
        return YES;
    }
    return YES;
}

-(BOOL)checkSave{
    if([self checkName] == NO){
        return NO;
    }
    if([self checkAmount] == NO){
        return NO;
    }
    if([self checkEnergy] == NO){
        return NO;
    }
    if([self checkCarBohydrates] == NO){
        return NO;
    }
    if([self checkFat] == NO){
        return NO;
    }
    return YES;
}

#pragma mark - end checking Formula

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backAndAlert:) name:@"backButton" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(homeAndAlert:) name:@"homeAlertButton" object:nil];
    [super viewDidLoad];
    isPickerJustOpen = NO;
    NSLog(@"View Did Load");
    NSString *view2 = [Language getText:@"add_food"];
//    @"Add Food";
    NSString *isHidden = @"NO";
    NSString *buttonMode = @"home";
	NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
    
    currentFoodList = [[NSMutableArray alloc] initWithArray:[Tool getProfileFoodList]];
    
    // code - add iphone5 support by csa4 - 30.5.2014
    if (IS_IPHONE5()){
        
        // 1) handle view size
        int extra = MY_EXTRA_HEIGHT();
        CGRect a1 = self.view.frame;
        a1.size.height += extra; // increase view size by 88
        self.view.frame = a1;
        // debug
        NSInteger tag = self.view.tag;
        int h = self.view.frame.size.height;
        int y = self.view.frame.origin.y;
        NSString *a = [[NSString alloc] initWithFormat:@"UIView tag%ld, y=%d, h=%d", (long)tag, y, h ];
        NSLog(@"--- %@", a);
        [a release];
        
        // 2) handle scroll view y position
        [sv_addfood setFrame:CGRectMake(0,0,320,480-53+extra)];  // increase scroll view height by 88
        // debug
        tag = sv_addfood.tag;
        h = sv_addfood.frame.size.height;
        y = sv_addfood.frame.origin.y;
        NSString *b = [[NSString alloc] initWithFormat:@"ScrollView tag%ld, y=%d, h=%d", (long)tag, y, h ];
        NSLog(@"--- %@", b);
        [b release];
        
        [btn_save setFrame:CGRectMake(110,435+extra,101,32)];
        
        
    } else {
        [sv_addfood setFrame:CGRectMake(0,0,320,480-53)];
        [btn_save setFrame:CGRectMake(110, 435, 101,32)];
    } // if end
    
    [sv_addfood setContentSize:CGSizeMake(320, 710)];
    
    nowOffset = sv_addfood.contentOffset;
    
    btn_per100.selected = true;
    btn_g.selected = true;
    [tf_nutrition setEnabled:NO];
    btn_kcal.selected = true;
    
    arrayNo = [[NSArray alloc] initWithObjects:[Language getText:@"carbo"],[Language getText:@"total_carbo"],[Language getText:@"ava_carbo"],nil];
    
//    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
//    if(version >= 4.0){
//        tf_food.inputAccessoryView = kb_toolbar;
//        tf_energy.inputAccessoryView = kb_toolbar;
//        tf_protein.inputAccessoryView = kb_toolbar;
//        tf_totalfat.inputAccessoryView = kb_toolbar;
//        tf_sat_fat.inputAccessoryView = kb_toolbar;
//        tf_trans_fat.inputAccessoryView = kb_toolbar;
//        tf_carbohydrates.inputAccessoryView = kb_toolbar;
//        tf_fibre.inputAccessoryView = kb_toolbar;
//        tf_sugar.inputAccessoryView = kb_toolbar;
//        tf_sodium.inputAccessoryView = kb_toolbar;
//    }
    
    //language setting
    [lbl_food setText:[Language getText:@"food"]];
    [lbl_nu_info setText:[Language getText:@"nu_info"]];
    [btn_per100 setTitle:[Language getText:@"per100"] forState:UIControlStateNormal];
    [btn_per100 setTitle:[Language getText:@"per100"] forState:UIControlStateSelected];
    [btn_per100ml setTitle:[Language getText:@"per100ml"] forState:UIControlStateNormal];
    [btn_per100ml setTitle:[Language getText:@"per100ml"] forState:UIControlStateSelected];
    
    [btn_package setTitle:[Language getText:@"per_pack"] forState:UIControlStateNormal];
    [btn_package setTitle:[Language getText:@"per_pack"] forState:UIControlStateSelected];
    [lbl_energy setText:[Language getText:@"energy"]];
    [lbl_protein setText:[Language getText:@"protein"]];
    [lbl_totalFat setText:[Language getText:@"totalfat"]];
    [lbl_cholesterol setText:[Language getText:@"cholesterol"]];
    
    [lbl_satFat setText:[NSString stringWithFormat:@"- %@", [Language getText:@"satfat"]]];
    [lbl_transFat setText:[NSString stringWithFormat:@"- %@", [Language getText:@"transfat"]]];
    [lbl_car setText:[Language getText:@"carbo"]];
    [btn_carbohy setTitle:[Language getText:@"carbo"] forState:UIControlStateNormal];
//    [btn_carbohy setTitle:[Language getText:@"carbo"] forState:UIControlStateSelected];
    [lbl_fibre setText:[NSString stringWithFormat:@"- %@",[Language getText:@"fibre"]]];
    [lbl_sugar setText:[NSString stringWithFormat:@"- %@",[Language getText:@"sugar"]]];
    [lbl_sodium setText:[Language getText:@"sodium"]];
    
//    [lbl_nutrition setText:[NSString stringWithFormat:@"%@/%@", [Language getText:@"g"], [Language getText:@"ml"]]];
    [lbl_nutrition setText:[Language getText:@"g"]];
    
    [btn_g setTitle:[Language getText:@"g"] forState:UIControlStateNormal];
    [btn_ml setTitle:[Language getText:@"ml"] forState:UIControlStateNormal];
    
    [btn_kcal setTitle:[Language getText:@"kcal"] forState:UIControlStateNormal];
    [btn_kcal setTitle:[Language getText:@"kcal"] forState:UIControlStateSelected];
    
    [btn_kJ setTitle:[Language getText:@"kj"] forState:UIControlStateNormal];
    [btn_kJ setTitle:[Language getText:@"kj"] forState:UIControlStateSelected];
    
    [lbl_g1 setText:[Language getText:@"g"]];
    [lbl_g2 setText:[Language getText:@"g"]];
    [lbl_g3 setText:[Language getText:@"g"]];
    [lbl_g4 setText:[Language getText:@"g"]];
    [lbl_g5 setText:[Language getText:@"g"]];
    [lbl_g6 setText:[Language getText:@"g"]];
    [lbl_g7 setText:[Language getText:@"g"]];
    [lbl_mg setText:[Language getText:@"mg"]];
    [lbl_mg1 setText:[Language getText:@"mg"]];
    
    if([[Language currentLanguage]isEqualToString:@"en"]){
        [btn_save setImage:[UIImage imageNamed:@"btn_save"] forState:UIControlStateNormal];
    }
    else if([[Language currentLanguage]isEqualToString:@"zh"]){
        [btn_save setImage:[UIImage imageNamed:@"btn_save_tc"] forState:UIControlStateNormal];
    }
    else if([[Language currentLanguage]isEqualToString:@"sc"]){
        [btn_save setImage:[UIImage imageNamed:@"btn_save_sc"] forState:UIControlStateNormal];
    }
    
    [btn_confirm setTitle:[Language getText:@"confirm"] forState:UIControlStateNormal];
    [btn_confirm setTitle:[Language getText:@"confirm"] forState:UIControlStateSelected];
    
    [btn_cancel setTitle:[Language getText:@"cancel"] forState:UIControlStateNormal];
    [btn_cancel setTitle:[Language getText:@"cancel"] forState:UIControlStateSelected];
    //language setting END
    
    btn_per100.selected = true;
    btn_per100ml.selected = false;
    
    if (isEdit) {
        NSLog(@"This is editing");
        
        
//        [(Food*)[[currentFoodList] objectAtIndex:editingIndex] printFood];
        for(int i = 0; i < [currentFoodList count]; i++){
            if([[currentFoodList objectAtIndex:i] foodID] == editingIndex){
                editingFood = [currentFoodList objectAtIndex:i];
                [editingFood printFood];
            }
        }
        
        NSString *view2 = [Language getText:@"edit_food"];
//        @"Edit Food";
        NSString *isHidden = @"NO";
        NSString *buttonMode = @"back";
        NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
        
        NSString *tmp = [NSString stringWithString:[editingFood name]];
        
        [tf_food setText: [editingFood name]];
        NSLog(@"%@",tmp);
        
        if([editingFood type] == PER100GML){
            [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food_dim@2x"]];
            [tf_nutrition setEnabled:NO];
            [tf_nutrition setText:@"100"];
            [lbl_nutrition setTextColor:[UIColor colorWithRed:167/255.0 green:189/255.0 blue:124/255.0 alpha:1]];
            
            btn_per100.selected =true;
            btn_per100ml.selected = false;
            btn_package.selected =false;
        }else if([editingFood type] == PER100ML){
            [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food_dim@2x"]];
            [tf_nutrition setEnabled:NO];
            [tf_nutrition setText:@"100"];
            [lbl_nutrition setTextColor:[UIColor colorWithRed:167/255.0 green:189/255.0 blue:124/255.0 alpha:1]];
            
            btn_per100.selected =false;
            btn_per100ml.selected = true;
            btn_package.selected =false;
        }
        else if([editingFood type] == PERSERVING){
            [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food@2x"]];
            [tf_nutrition setEnabled:YES];
            
            if([[tf_nutrition text] length] <= 0){
            }
            [lbl_nutrition setTextColor:[UIColor colorWithRed:42/255.0 green:72/255.0 blue:12/255.0 alpha:1]];
            
            
            btn_per100.selected =false;
            btn_per100ml.selected = false;
            btn_package.selected =true;
            [tf_nutrition setText:[NSString stringWithFormat:@"%.02f" ,[editingFood weight]]];
            
            [btn_g setHidden:NO];
            [btn_ml setHidden:NO];
            if([editingFood unitType] == g){
                [btn_g setSelected:YES];
                [btn_ml setSelected:NO];
            }
            else{
                [btn_g setSelected:NO];
                [btn_ml setSelected:YES];
            }
        }
        
        if([editingFood energyType]==KCAL){
            btn_kcal.selected = true;
            btn_kJ.selected = false;
            
        }
        else if([editingFood energyType]==KJ){
            btn_kcal.selected = false;
            btn_kJ.selected = true;
        }
        
        if([editingFood energy] >= 0){
            [tf_energy setText:[NSString stringWithFormat:@"%.02f" ,[editingFood energy]]]; 
        }
        
        if([editingFood protein]>=0){
            [tf_protein setText:[NSString stringWithFormat:@"%.02f" ,[editingFood protein]]];
        }
        
        if([editingFood totalFat]>=0){
            [tf_totalfat setText:[NSString stringWithFormat:@"%.02f" ,[editingFood totalFat]]];
        }
        
        if([editingFood saturatedFat]>=0){
            [tf_sat_fat setText:[NSString stringWithFormat:@"%.02f" ,[editingFood saturatedFat]]];
        }
        
        if([editingFood transFat] >= 0){
            [tf_trans_fat setText:[NSString stringWithFormat:@"%.02f" ,[editingFood transFat]]];
        }
        
        if([editingFood cholesterol] >= 0){
            [tf_cholesterol setText:[NSString stringWithFormat:@"%.02f" , [editingFood cholesterol]]];
        }
        
        if([editingFood carbohydratesType]==CARBOHYDRATES){
            [btn_carbohy setTitle:[Language getText:@"carbo"] forState: UIControlStateNormal];
            carbohydratesType = CARBOHYDRATES;
            [p_picker selectRow:0 inComponent:0 animated:NO];
        }
        else if([editingFood carbohydratesType]==TOTALCARBOHYDRATES){
            [btn_carbohy setTitle:[Language getText:@"total_carbo"] forState: UIControlStateNormal];
            carbohydratesType = TOTALCARBOHYDRATES;
            [p_picker selectRow:1 inComponent:0 animated:NO];
        }
        else if([editingFood carbohydratesType]==AVAILABLECARBOHYDRATES){
            [btn_carbohy setTitle:[Language getText:@"ava_carbo"] forState: UIControlStateNormal];
            carbohydratesType = AVAILABLECARBOHYDRATES;
            [p_picker selectRow:2 inComponent:0 animated:NO];
        }
        if([editingFood carbohydrates] >= 0){
            [tf_carbohydrates setText:[NSString stringWithFormat:@"%.02f" ,[editingFood carbohydrates]]];
        }
        
        if([editingFood dietaryFibre] >= 0){
            [tf_fibre setText:[NSString stringWithFormat:@"%.02f" ,[editingFood dietaryFibre]]];
        }
        
        if([editingFood sugars] >= 0){
            [tf_sugar setText:[NSString stringWithFormat:@"%.02f" ,[editingFood sugars]]];
        }
        if([editingFood sodium] >= 0){
            [tf_sodium setText:[NSString stringWithFormat:@"%.02f" ,[editingFood sodium]]];
        }
    }
    
    // Do any additional setup after loading the view from its nib.
}



- (void)viewDidUnload
{
    [sv_addfood release];
    sv_addfood = nil;
    [btn_per100 release];
    btn_per100 = nil;
    [btn_package release];
    btn_package = nil;
    [btn_kcal release];
    btn_kcal = nil;
    [btn_kJ release];
    btn_kJ = nil;
    [btn_save release];
    btn_save = nil;
    [v_picker release];
    v_picker = nil;
    [btn_carbohy release];
    btn_carbohy = nil;
    [btn_cancel release];
    btn_cancel = nil;
    [btn_save release];
    btn_save = nil;
    [p_picker release];
    p_picker = nil;
    
    
    [tf_food release];
    tf_food = nil;
    [tf_nutrition release];
    tf_nutrition = nil;
    [tf_energy release];
    tf_energy = nil;
    [tf_protein release];
    tf_protein = nil;
    [tf_sat_fat release];
    tf_sat_fat = nil;
    [tf_trans_fat release];
    tf_trans_fat = nil;
    [tf_carbohydrates release];
    tf_carbohydrates = nil;
    [tf_fibre release];
    tf_fibre = nil;
    [tf_sugar release];
    tf_sugar = nil;
    [tf_sodium release];
    tf_sodium = nil;
    [lbl_nutrition release];
    lbl_nutrition = nil;
    [lbl_nutrition release];
    lbl_nutrition = nil;
    [tf_totalfat release];
    tf_totalfat = nil;
    [self setKb_toolbar:nil];
    [self setKb_toolbarNext:nil];
    [self setKb_toolbarPrevious:nil];
    [self setLbl_food_star:nil];
    [self setLbl_nu_star:nil];
    [self setLbl_energy_star:nil];
    [self setLbl_protein_star:nil];
    [self setLbl_totalfat_star:nil];
    [self setLbl_satfat_star:nil];
    [self setLbl_transfat_star:nil];
    [self setLbl_car_star:nil];
    [self setLbl_fibre_star:nil];
    [self setLbl_sugar_star:nil];
    [self setLbl_food:nil];
    [self setLbl_energy:nil];
    [self setLbl_protein:nil];
    [self setLbl_totalFat:nil];
    [self setLbl_satFat:nil];
    [self setLbl_transFat:nil];
    [self setLbl_car:nil];
    [self setLbl_fibre:nil];
    [self setLbl_sugar:nil];
    [self setLbl_sodium:nil];
    [self setLbl_nu_info:nil];
    [self setLbl_g1:nil];
    [self setLbl_g2:nil];
    [self setLbl_g3:nil];
    [self setLbl_g4:nil];
    [self setLbl_g5:nil];
    [self setLbl_g6:nil];
    [self setLbl_g7:nil];
    [self setLbl_mg:nil];
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
    NSLog(@"mode = %i", mode);
    if (mode!=-1) {
        isEdit = YES;
        editingIndex = mode;
    }
    else{
        isEdit = NO;
    }
}

//check textfield method
- (void)check_tf
{
//    if(![[tf_food text] isEqualToString:@""] && ![[tf_energy text] isEqualToString:@""]){
//        if([[tf_protein text] isEqualToString:@""] && [[tf_totalfat text] isEqualToString:@""] && [[tf_sat_fat text] isEqualToString:@""] && [[tf_trans_fat text] isEqualToString:@""] && [[tf_carbohydrates text] isEqualToString:@""] && [[tf_fibre text] isEqualToString:@""] && [[tf_sugar text] isEqualToString:@""] && [[tf_sodium text] isEqualToString:@""]){
//            if(carbohydratesType == 1 && [[tf_fibre text] isEqualToString:@""])
//            {
//                nutrition = TRUE;
//                carbohydrates = FALSE;
//                return;
//            }
//            nutrition = TRUE;
//            carbohydrates = TRUE;
//            return;
//        }
//    }
//    
//    if(![[tf_food text] isEqualToString:@""] && ![[tf_energy text] isEqualToString:@""] && ![[tf_protein text] isEqualToString:@""] && ![[tf_totalfat text] isEqualToString:@""] && ![[tf_carbohydrates text] isEqualToString:@""] && ![[tf_sodium text] isEqualToString:@""])
//    {
//        if (btn_package.selected == TRUE && [[tf_nutrition text] isEqualToString:@""]) {
//            nutrition = FALSE; 
//        }
//        else 
//        {
//            nutrition = TRUE;
//        }
//        
//        if(carbohydratesType == 1 && [[tf_fibre text] isEqualToString:@""])
//        {
//            carbohydrates = FALSE;
//        }
//        else 
//        {
//            carbohydrates = TRUE;
//        }
//    }
//    else {
//        carbohydrates = FALSE;
//        nutrition = FALSE;
//    }   
    
    
    //Edit by Paul
}

- (void) clear_textfield
{
    [tf_food setText:nil];
    [tf_nutrition setText:nil];
    [tf_energy setText:nil];
    [tf_protein setText:nil];
    [tf_totalfat setText:nil];
    [tf_sat_fat setText:nil];
    [tf_trans_fat setText:nil];
    [tf_cholesterol setText:nil];
    [tf_carbohydrates setText:nil];
    [tf_fibre setText:nil];
    [tf_sugar setText:nil];
    [tf_sodium setText:nil];
}

- (void)control_red_textfield
{
//    if ([[tf_food text] isEqualToString:@""]) {
//        [tf_food setBackground:[UIImage imageNamed:@"txtfield_foodname_pink@2x"]];
//    }else [tf_food setBackground:[UIImage imageNamed:@"txtfield_foodname@2x"]];
//    
//    if(btn_package.selected == TRUE && [[tf_nutrition text] isEqualToString:@""])
//    {
//        [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food_error@2x"]];
//    } 
//    else [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food_dim@2x"]];
//    
//    if([[tf_energy text] isEqualToString:@""])
//    {
//        [tf_energy setBackground:[UIImage imageNamed:@"txtfield_food_error@2x"]];
//    } else [tf_energy setBackground:[UIImage imageNamed:@"txtfield_food@2x"]];
//    
//    if([[tf_protein text] isEqualToString:@""])
//    {
//        [tf_protein setBackground:[UIImage imageNamed:@"txtfield_food_error@2x"]];
//    } else [tf_protein setBackground:[UIImage imageNamed:@"txtfield_food@2x"]];
//    
//    if ([[tf_totalfat text] isEqualToString:@""])
//    {
//        [tf_totalfat setBackground:[UIImage imageNamed:@"txtfield_food_error@2x"]];
//    } else [tf_totalfat setBackground:[UIImage imageNamed:@"txtfield_food@2x"]];
//    
//    if([[tf_carbohydrates text] isEqualToString:@""])
//    {
//        [tf_carbohydrates setBackground:[UIImage imageNamed:@"txtfield_food_error@2x"]];
//    } else [tf_carbohydrates setBackground:[UIImage imageNamed:@"txtfield_food@2x"]];
//    
//    if(carbohydratesType == 1 && [[tf_fibre text] isEqualToString:@""])
//    {
//        [tf_fibre setBackground:[UIImage imageNamed:@"txtfield_food_error@2x"]];
//    } else [tf_fibre setBackground:[UIImage imageNamed:@"txtfield_food@2x"]];
//    
//    //    if(carbohydratesType == 1 && [[tf_sugar text] isEqualToString:@""])
//    //    {
//    //        [tf_sugar setBackground:[UIImage imageNamed:@"txtfield_food_error@2x"]];
//    //    } else [tf_sugar setBackground:[UIImage imageNamed:@"txtfield_food@2x"]];
//    
//    if([[tf_sodium text] isEqualToString:@""])
//    {
//        [tf_sodium setBackground:[UIImage imageNamed:@"txtfield_food_error@2x"]];
//    } else [tf_sodium setBackground:[UIImage imageNamed:@"txtfield_food@2x"]];
//    
//    
    
    //Edit by Paul
}


-(void) calculateEnergy
{
    float energy = [tf_energy.text floatValue];
    float protein = [tf_protein.text floatValue];
    float total_fat = [tf_totalfat.text floatValue];
    float carbohydrates = [tf_carbohydrates.text floatValue];
    float fibre = [tf_fibre.text floatValue];
    
    // total_carbohydrates
    float kcal_total = (protein*4 + total_fat *9 + (carbohydrates* - fibre)*4);
    float kJ_total = (protein*17 + total_fat *37 + (carbohydrates -fibre)*17);
    
    // carbohydrates
    float kcal = (protein*4 + total_fat *9 + carbohydrates*4);
    float kJ = (protein*17 + total_fat *37 + carbohydrates*17);
    
    
    
    
    if(carbohydratesType == 1 && btn_kcal.selected)
    {
        if(energy >= kcal_total*0.7 && energy <= kcal_total *1.3)
        {
            cal_energy = true;
        }else cal_energy = false;
    }
    
    else if (carbohydratesType != 1 && btn_kcal.selected)
    {
        if(energy >= kcal*0.7 && energy <= kcal *1.3)
        {
            cal_energy = true;
        }else cal_energy = false;
    }
    
    else if(carbohydratesType == 1 && btn_kJ.selected)
    {
        if(energy >= kJ_total*0.7 && energy <= kJ_total*1.3){
            cal_energy = true;
        }else cal_energy = false;
    }
    
    else if (carbohydratesType != 1 && btn_kJ.selected)
    {
        if(energy >= kJ*0.7 && energy <= kJ*1.3)
        {
            cal_energy = true;
        }else cal_energy = false;
    }
}

- (void) calculateTotalFat
{
    float total_fat = [tf_totalfat.text floatValue];
    float sat_fat = [tf_sat_fat.text floatValue];
    float trans_fat = [tf_trans_fat.text floatValue];
    
    
    
    if (sat_fat + trans_fat > total_fat) {
        cal_fat = false;
    }
    else cal_fat = true;
    
}

- (void) calculateCarbohydrates
{
    float total_car = [tf_carbohydrates.text floatValue];
    float fibre = [tf_fibre.text floatValue];
    float sugar = [tf_sugar.text floatValue];
    
    if(fibre + sugar > total_car){
        cal_carbohy = false;
    }else cal_carbohy = true;
    
    if(sugar > total_car){
        cal_sugar = false;
    }else cal_sugar = true;
}

//below = carbohydrates picker

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component 
{
    return[arrayNo objectAtIndex:row];
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [arrayNo count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    carbohydratesType = row;
    
}

-(void)pickerViewOpen
{
    [nowEditingField resignFirstResponder];
    id appDelegate = [[UIApplication sharedApplication] delegate];
    UIWindow *window = [appDelegate window];
    for(UIView* sub in [window subviews]){
        NSLog(@"%@", [sub class]);
        if ([sub class] == NSClassFromString(@"NuCalAlert")) {
            NuCalAlert *alert = (NuCalAlert*)sub;
            [alert setAlpha:0];
            [alert dismiss];
            break;
        }
    }
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.4];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationBeginsFromCurrentState:NO];
    
    [v_picker setFrame:CGRectMake(0, 222, 320, 480-222)];
	// [v_picker setFrame:CGRectMake(0, 222, 320, 258)];
    
	[UIView commitAnimations];
    //[p_picker selectRow:1 inComponent:0 animated:NO];
}
- (void)pickerViewClose
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.4];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationBeginsFromCurrentState:NO];
    
    // code - add support to iphone5 - by csa4 - 15.5.2014
    // if this is iphone5, extra = 88, so after closing, we need move the picker down (88) vertically (y -> y+88)
    if (IS_IPHONE5()) {
            int extra = 88;
            [v_picker setFrame:CGRectMake(0, 480+extra, 320, 480-222+extra)];
    } else {
            [v_picker setFrame:CGRectMake(0, 480, 320, 480-222)];
    } // if end
    
    // old code - 5.12.2014
	// [v_picker setFrame:CGRectMake(0, 480, 320, 258)];
	[UIView commitAnimations];
}


//below = food 份量 switchbtn

- (IBAction)per_100g:(id)sender {
    [nowEditingField resignFirstResponder];
    [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food_dim"]];
    [lbl_nu_star setHidden:YES];
    [tf_nutrition setEnabled:NO];
    [tf_nutrition setText:nil];
    [lbl_nutrition setTextColor:[UIColor colorWithRed:167/255.0 green:189/255.0 blue:124/255.0 alpha:1]];
    
    
    btn_per100.selected =true;
    btn_package.selected =false;
    btn_per100ml.selected = false;
    
    [tf_nutrition setText:@"100"];
    
    [lbl_nutrition setText:[Language getText:@"g"]];
    [lbl_nutrition setHidden:NO];
    [btn_g setHidden:YES];
    [btn_ml setHidden:YES];
//    if(btn_per100.selected){
//        
//        [btn_package setBackgroundImage:[UIImage imageNamed:@"btn_amount_right.png"] forState:UIControlStateNormal];
//        [btn_per100 setBackgroundImage:[UIImage imageNamed:@"btn_amount_left_on.png"] forState:UIControlStateNormal];
//    }
    
}

- (IBAction)per_100ml:(id)sender {
    NSLog(@"123");
    //    
        [nowEditingField resignFirstResponder];
        
        [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food_dim"]];
        [lbl_nu_star setHidden:YES];
        [tf_nutrition setEnabled:NO];
        [tf_nutrition setText:nil];
        [lbl_nutrition setTextColor:[UIColor colorWithRed:167/255.0 green:189/255.0 blue:124/255.0 alpha:1]];
    //    
        btn_per100.selected = false;
        btn_package.selected = false;
        btn_per100ml.selected = true;
    //    
        [tf_nutrition setText:@"100"];
    //    
        [lbl_nutrition setText:[Language getText:@"ml"]];
        [lbl_nutrition setHidden:NO];
        [btn_g setHidden:YES];
        [btn_ml setHidden:YES];
}  

- (IBAction)per_package_g:(id)sender {
    btn_g.selected = true;
    btn_ml.selected = false;
}

- (IBAction)per_package_ml:(id)sender {
    btn_g.selected = false;
    btn_ml.selected = true;
}

- (IBAction)per_package:(id)sender {
    [nowEditingField resignFirstResponder];
    
    [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food"]];
    [tf_nutrition setEnabled:YES];
    
    [tf_nutrition setText:@""];
    
    [lbl_nutrition setHidden:YES];
    [btn_g setHidden:NO];
    [btn_ml setHidden:NO];
    
    if([[tf_nutrition text] length] == 0){
        [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
        [lbl_nu_star setHidden:NO];
    }
    [lbl_nutrition setTextColor:[UIColor colorWithRed:42/255.0 green:72/255.0 blue:12/255.0 alpha:1]];
    
    
    btn_per100.selected =false;
    btn_per100ml.selected = false;
    btn_package.selected =true;
    
}

//below = energy 單位 switchbtn
- (IBAction)choose_kcal:(id)sender {
    btn_kcal.selected = true;
    btn_kJ.selected = false;
}

- (IBAction)choose_kJ:(id)sender {
    btn_kcal.selected = false;
    btn_kJ.selected = true;

}

// savefood button (at the end)

- (IBAction)save_food:(id)sender {
    
    [self check_tf];
    
    btn_save.selected = true;
    
    //    if(btn_save.selected)
    //    {
    //        [btn_save setBackgroundImage:[UIImage imageNamed:@"btn_saved"] forState:UIControlStateNormal];
    //    }
    
    if([self checkSave]/*nutrition == TRUE && carbohydrates == TRUE*/)
    {
        Food *food = [self saveFoodByInput];
        if(isEdit == NO){
            [currentFoodList addObject:food];
//            [mainController.currentProfile addFood:food];
            [food release];
            [Tool setProfileFoodList:currentFoodList];
            
//            [Tool setDefaultProfile:currentProfileIndex];
//            [mainController.currentProfile updateProfile:currentProfile];
//            [self storeProfile:mainController.currentProfile];
            
//            NuCalAlert *invalid = [[NuCalAlert alloc] initWithTitle:NULL message:@"Add another food?" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO",NULL];
            NuCalAlert *invalid = [[NuCalAlert alloc]initWithTitle:nil Subtitle:[Language getText:@"alert_addother"] CancelButtonTitle:[Language getText:@"no"] ButtonTitle:[NSMutableArray arrayWithObject:[Language getText:@"yes"]]];
            [invalid setTag:998];
            [invalid setDelegate:self];
            [invalid show];
            [invalid release];
            if(btn_save.selected)
            {
                if([[Language currentLanguage]isEqualToString:@"en"]){
                    [btn_save setImage:[UIImage imageNamed:@"btn_saved"] forState:UIControlStateNormal];
                }
                else if([[Language currentLanguage]isEqualToString:@"zh"]){
                    [btn_save setImage:[UIImage imageNamed:@"btn_saved_tc"] forState:UIControlStateNormal];
                }
                else if([[Language currentLanguage]isEqualToString:@"sc"]){
                    [btn_save setImage:[UIImage imageNamed:@"btn_saved_sc"] forState:UIControlStateNormal];
                }
            }
        }
        if(isEdit == YES){
            [editingFood setName:[food name]];
            [editingFood setType:[food type]];
            [editingFood setUnitType:[food unitType]];
            [editingFood setWeight:[food weight]];
            [editingFood setEnergy:[food energy]];
            [editingFood setEnergyType:[food energyType]];
            [editingFood setProtein:[food protein]];
            [editingFood setTotalFat:[food totalFat]];
            [editingFood setSaturatedFat:[food saturatedFat]];
            [editingFood setTransFat:[food transFat]];
            [editingFood setCholesterol:[food cholesterol]];
            [editingFood setCarbohydratesType:[food carbohydratesType]];
            [editingFood setCarbohydrates:[food carbohydrates]];
            [editingFood setDietaryFibre:[food dietaryFibre]];
            [editingFood setSugars:[food sugars]];
            [editingFood setSodium:[food sodium]];
            [food release];
            
            [Tool setProfileFoodList:currentFoodList];
//            [self storeProfile:mainController.currentProfile];
            
            if([[Language currentLanguage]isEqualToString:@"en"]){
                [btn_save setImage:[UIImage imageNamed:@"btn_saved"] forState:UIControlStateNormal];
            }
            else if([[Language currentLanguage]isEqualToString:@"zh"]){
                [btn_save setImage:[UIImage imageNamed:@"btn_saved_tc"] forState:UIControlStateNormal];
            }
            else if([[Language currentLanguage]isEqualToString:@"sc"]){
                [btn_save setImage:[UIImage imageNamed:@"btn_saved_sc"] forState:UIControlStateNormal];
            }
            [btn_save setEnabled:NO];
            NSString *view2 = [Language getText:@"edit_food"];
            NSString *isHidden = @"NO";
            NSString *buttonMode = @"";
            
            NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
            
            [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(saveEnd) userInfo:nil repeats:NO];
        }
    }
//    else {
//        [self control_red_textfield];
//        UIAlertView *invalid = [[UIAlertView alloc] initWithTitle:NULL message:@"Some fields are necessary!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:NULL];
//        [invalid show];
//        [invalid release];
//    }
}

- (void)saveEnd{
    NSString *view = @"FoodList";
    NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
}

//check yes or no (from alert view)


// caybohydrates picker

- (IBAction)choose_carbohy:(id)sender {
    
    [sv_addfood setContentOffset:CGPointMake(0, 200)];
    
    btn_carbohy.selected = true;
    
    if(btn_carbohy.selected){
        [self pickerViewOpen];
        [sv_addfood setScrollEnabled:NO];
    }
    else {
        [self pickerViewClose];
    }
}

//cancel btn & confirm btn

- (IBAction)cancel_v_picker:(id)sender {
    [self pickerViewClose];
    [sv_addfood setScrollEnabled:YES];
}

- (IBAction)confirm_v_picker:(id)sender {
    
    //NSLog(@"aaa");
    
    switch (carbohydratesType) {
        case 0:
            NSLog(@"0");
            [btn_carbohy setTitle:[Language getText:@"carbo"] forState: UIControlStateNormal];
            break;
        case 1:
            NSLog(@"1");
            [btn_carbohy setTitle:[Language getText:@"total_carbo"] forState: UIControlStateNormal];
            
            if([[tf_fibre text] isEqualToString:@""])
            {
            }
            if([[tf_sugar text] isEqualToString:@""])
            {
            }
            break;
        case 2:
            NSLog(@"2");
            [btn_carbohy setTitle:[Language getText:@"ava_carbo"] forState: UIControlStateNormal];
            break;
        default:
            break;
    }
    
    [self pickerViewClose];
    if (carbohydratesType == CARBOHYDRATES || carbohydratesType == AVAILABLECARBOHYDRATES){
        [tf_fibre setBackground:[UIImage imageNamed:@"txtfield_food"]];
    }
    
    if ([self checkCarBohydrates] == NO){
        [btn_save setEnabled:NO];
    }
    else if([self checkFat] == NO){
        [btn_save setEnabled:NO];
    }
    else{
        [btn_save setEnabled:YES];
    }

    [sv_addfood setScrollEnabled:YES];

}

- (Food*)saveFoodByInput{
    NSString *foodName;
    int nuType;
    int unitType;
    float weight;
    float energy;
    int energyType;
    float protein;
    float totalFat;
    float saturatedFat;
    float transFat;
    float cholesterol;
    NSInteger _carbohydratesType;
    float carbohydrates;
    float dietaryFibre;
    float sugars;
    float sodium;
    int foodID;
    
    foodName = tf_food.text;
    if (btn_per100.selected)
        nuType = PER100GML;
    else if (btn_per100ml.selected)
        nuType = PER100ML;
    else //if (btn_package.selected)
        nuType = PERSERVING;
    
    if(btn_g.selected){
        unitType = g;
    }
    else{
        unitType = ml;
    }
//    nuType = btn_per100.selected ? PER100GML : PERSERVING;
    weight = nuType==PER100GML ? 100 : [tf_nutrition.text floatValue];
    if([tf_energy.text length] == 0){
        energy = -1;
    }
    else{
        energy = [tf_energy.text floatValue];
    }
    energyType = btn_kcal.selected ? KCAL : KJ;
    if([tf_protein.text length] == 0){
        protein = -1;
    }
    else{
        protein = [tf_protein.text floatValue];
    }
    if([tf_totalfat.text length] == 0){
        totalFat = -1;
    }
    else{
        totalFat = [tf_totalfat.text floatValue];
    }
    if([tf_sat_fat.text length] == 0){
        saturatedFat = -1;
    }
    else{
        saturatedFat = [tf_sat_fat.text floatValue];
    }
    if([tf_trans_fat.text length] == 0){
        transFat = -1;
    }
    else{
        transFat = [tf_trans_fat.text floatValue];
    }
    
    if([tf_cholesterol.text length] == 0){
        cholesterol = -1;
    }
    else{
        cholesterol = [tf_cholesterol.text floatValue];
    }
    
    _carbohydratesType = carbohydratesType;
    if([tf_carbohydrates.text length] == 0){
        carbohydrates = -1;
    }
    else{
        carbohydrates = [tf_carbohydrates.text floatValue];
    }
    if([tf_fibre.text length] == 0){
        dietaryFibre = -1;
    }
    else{
        dietaryFibre = [tf_fibre.text floatValue];
    }
    if([tf_sugar.text length] == 0){
        sugars = -1;
    }
    else{
        sugars = [tf_sugar.text floatValue];
    }
    if([tf_sodium.text length] == 0){
        sodium = -1;
    }
    else{
        sodium = [tf_sodium.text floatValue];
    }
    
    NSLog(@"food list number : %lu", (unsigned long)[currentFoodList count]);
    if([currentFoodList count] == 0){
        foodID = 1;
    }else{
        [[currentFoodList lastObject] printFood];
        foodID = [[currentFoodList lastObject] foodID] + 1;
    }
    
    Food* tmpFood = [[Food alloc]initWithFood:foodName Type:nuType 
                                     UnitType:unitType
                                       Weight:weight
                                       Energy:energy
                                   EnergyType:energyType
                                      Protein:protein
                                     TotalFat:totalFat
                                 SaturatedFat:saturatedFat
                                     TransFat:transFat
                                  Cholesterol:cholesterol
                            CarbohydratesType:_carbohydratesType
                                Carbohydrates:carbohydrates
                                 DietaryFibre:dietaryFibre
                                       Sugars:sugars
                                       Sodium:sodium
                                           ID:foodID];
    [tmpFood printFood];
    return tmpFood;
}

- (void) storeProfile:(Profile*) profile
{
    [Tool setProfile:profile];
    [mainController reloadCurrentProfile];
}

- (IBAction)toolBarButtonPress:(UIBarButtonItem*)btn {
    
    if(btn == kb_toolbarNext){
        NSLog(@"HIHIHIHIH");
        NSInteger nextTag = nowEditingField.tag + 1;
        // Try to find next responder
        UIResponder* nextResponder = [nowEditingField.superview viewWithTag:nextTag];
        if (nextResponder) {
            // Found next responder, so set it.
            [nextResponder becomeFirstResponder];
            [sv_addfood setContentOffset:CGPointMake(sv_addfood.contentOffset.x, nowEditingField.frame.origin.y - 45)];
        } else {
            // Not found, so remove keyboard.
            [nowEditingField resignFirstResponder];
            [sv_addfood setContentSize:CGSizeMake(320, 950)];
        }
    }
    if(btn == kb_toolbarPrevious){
        NSLog(@"HIHIHIHIH222");
        NSInteger previousTag = nowEditingField.tag - 1;
        if(previousTag == 0){
            [nowEditingField resignFirstResponder];
            return;
        }
        // Try to find next responder
        UIResponder* previousResponder = [nowEditingField.superview viewWithTag:previousTag];
        if (previousResponder) {
            // Found next responder, so set it.
            [previousResponder becomeFirstResponder];
            if(nowEditingField == tf_food){
                [sv_addfood setContentOffset:CGPointMake(sv_addfood.contentOffset.x, tf_food.frame.origin.y+140)];
            }
            else{
                [sv_addfood setContentOffset:CGPointMake(sv_addfood.contentOffset.x, nowEditingField.frame.origin.y - 45)];
            }
        } else {
            // Not found, so remove keyboard.
            [nowEditingField resignFirstResponder];
            [sv_addfood setContentSize:CGSizeMake(320, 950)];
        }
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
//    if(textField == tf_food){
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return (newLength > 16) ? NO : YES;
//    }
    
    NSString *temp = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if(textField != tf_food && [temp length] >0){
        
        
        NSUInteger dot = [textField.text rangeOfString:@"."].location;
        
        if(dot != NSNotFound)
        {
            NSString *dp = [textField.text substringFromIndex:dot];
            if([dp length] > 2)
            {
                //NSString *oriValue = theTextField.text; 
                //[theTextField setText:oriValue];
                if([string length] == 0)
                {
                    return  YES;
                }
                else
                {
                    return NO;
                }
            }
        }
        
        
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

- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    nowAlert = nil;
    id appDelegate = [[UIApplication sharedApplication] delegate];
    UIWindow *window = [appDelegate window];
    for(UIView* sub in [window subviews]){
        NSLog(@"%@", [sub class]);
        if ([sub class] == NSClassFromString(@"NuCalAlert")) {
            nowAlert = (NuCalAlert*)sub;
            break;
        }
    }
    if(nowAlert!=nil){
        NSLog(@"NOT NULL");
        [textField performSelector:@selector(resignFirstResponder) withObject:self afterDelay:0.01];
        return;
    }
    
//    [sv_addfood setContentSize:CGSizeMake(320, 1200)];
    [sv_addfood setContentSize:CGSizeMake(320, 900)];
    nowEditingField = textField;
    [sv_addfood setContentOffset:CGPointMake(sv_addfood.contentOffset.x, nowEditingField.frame.origin.y - 45)];
//    if(textField == tf_carbohydrates || textField == tf_fibre || textField == tf_sugar || textField == tf_sodium)
//    {
//        [sv_addfood setContentOffset:CGPointMake(0, 355)];
//    }
}
- (void) textFieldDidEndEditing:(UITextField *)textField
{
    [textField performSelector:@selector(resignFirstResponder) withObject:self afterDelay:0.01];
    nowAlert = nil;
    id appDelegate = [[UIApplication sharedApplication] delegate];
    UIWindow *window = [appDelegate window];
    for(UIView* sub in [window subviews]){
        NSLog(@"%@", [sub class]);
        if ([sub class] == NSClassFromString(@"NuCalAlert")) {
            nowAlert = (NuCalAlert*)sub;
            break;
        }
    }
    if(nowAlert!=nil){
        NSLog(@"hu");
        return;
    }
    
    [btn_per100 setUserInteractionEnabled:YES];
    [btn_package setUserInteractionEnabled:YES];
    if(textField == tf_carbohydrates || textField == tf_fibre || textField == tf_sugar){
        if ([self checkCarBohydrates] == NO){
            [btn_save setEnabled:NO];
        }
        else if([self checkFat] == NO){
            [btn_save setEnabled:NO];
        }
        else{
            [btn_save setEnabled:YES];
        }
    }
    
    if(textField == tf_totalfat || textField == tf_sat_fat || textField == tf_trans_fat){
        if ([self checkFat] == NO){
            [btn_save setEnabled:NO];
        }
        else if([self checkCarBohydrates] == NO){
            [btn_save setEnabled:NO];
        }
        else{
            [btn_save setEnabled:YES];
        }
    }
    
    if(textField == tf_nutrition && btn_package.selected){
        if([tf_nutrition.text length] != 0 && [tf_nutrition.text floatValue] != 0){
            [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food"]];
            [lbl_nu_star setHidden:YES];
        }
        else{
            [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
            [lbl_nu_star setHidden:NO];
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField performSelector:@selector(resignFirstResponder) withObject:self afterDelay:0.01];
    nowAlert = nil;
    id appDelegate = [[UIApplication sharedApplication] delegate];
    UIWindow *window = [appDelegate window];
    for(UIView* sub in [window subviews]){
        NSLog(@"%@", [sub class]);
        if ([sub class] == NSClassFromString(@"NuCalAlert")) {
            nowAlert = (NuCalAlert*)sub;
            break;
        }
    }
    if(nowAlert!=nil){
        NSLog(@"hu2");
        return 1;
    }
    [theTextField resignFirstResponder];
    [sv_addfood setContentSize:CGSizeMake(320, 680)];
    return YES;
}

- (void)backAndAlert:(NSNotification *)notification{
    NSString *alertMessage = [Language getText:@"alert_exit_notsave"];
    NuCalAlert *backAlert = [[NuCalAlert alloc]initWithTitle:nil Subtitle:alertMessage CancelButtonTitle:[Language getText:@"no"] ButtonTitle:[NSMutableArray arrayWithObject:[Language getText:@"yes"]]];
//    UIAlertView *backAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Exit without saving?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    [backAlert setTag:999];
    [backAlert setDelegate:self];
    [nowEditingField performSelector:@selector(resignFirstResponder) withObject:self afterDelay:0.01];
    [backAlert show];
    [backAlert release];
}

- (void)homeAndAlert:(NSNotification *)notification{
    NSString *alertMessage = [Language getText:@"alert_exit_notsave"];
    NuCalAlert *backAlert = [[NuCalAlert alloc]initWithTitle:nil Subtitle:alertMessage CancelButtonTitle:[Language getText:@"no"] ButtonTitle:[NSMutableArray arrayWithObject:[Language getText:@"yes"]]];
//    UIAlertView *backAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Exit without saving?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    [backAlert setTag:1000];
    [backAlert setDelegate:self];
    [nowEditingField performSelector:@selector(resignFirstResponder) withObject:self afterDelay:0.01];
    [backAlert show];
    [backAlert release];
}

- (void)NuAlertView:(NuCalAlert *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(alertView.tag == 998){
        NSLog(@"Pressed");
        if(buttonIndex == 9999)
        {
            NSString *view = @"Menu";
            NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
        }
        else if (buttonIndex == 0)
        {
            if([[Language currentLanguage]isEqualToString:@"en"]){
                [btn_save setImage:[UIImage imageNamed:@"btn_save"] forState:UIControlStateNormal];
            }
            else if([[Language currentLanguage]isEqualToString:@"zh"]){
                [btn_save setImage:[UIImage imageNamed:@"btn_save_tc"] forState:UIControlStateNormal];
            }
            else if([[Language currentLanguage]isEqualToString:@"sc"]){
                [btn_save setImage:[UIImage imageNamed:@"btn_save_sc"] forState:UIControlStateNormal];
            }
            [sv_addfood setContentOffset:CGPointMake(0, 0)];
            [self clear_textfield];
            [btn_carbohy setTitle:[Language getText:@"carbo"] forState: UIControlStateNormal];
            carbohydratesType = CARBOHYDRATES;
            [p_picker selectRow:0 inComponent:0 animated:NO];
            [self per_100g:btn_per100];
            [tf_nutrition setText:@"100"];
        }
    }
    else if(alertView.tag == 999){
        if(buttonIndex == 9999){
            [btn_per100 setUserInteractionEnabled:YES];
            [btn_package setUserInteractionEnabled:YES];
            if(nowEditingField == tf_carbohydrates || nowEditingField == tf_fibre || nowEditingField == tf_sugar){
                if ([self checkCarBohydrates] == NO){
                    [btn_save setEnabled:NO];
                }
                else if([self checkFat] == NO){
                    [btn_save setEnabled:NO];
                }
                else{
                    [btn_save setEnabled:YES];
                }
            }
            
            if(nowEditingField == tf_totalfat || nowEditingField == tf_sat_fat || nowEditingField == tf_trans_fat){
                if ([self checkFat] == NO){
                    [btn_save setEnabled:NO];
                }
                else if([self checkCarBohydrates] == NO){
                    [btn_save setEnabled:NO];
                }
                else{
                    [btn_save setEnabled:YES];
                }
            }
            
            if(nowEditingField == tf_nutrition && btn_package.selected){
                if([tf_nutrition.text length] != 0 && [tf_nutrition.text floatValue] != 0){
                    [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food"]];
                    [lbl_nu_star setHidden:YES];
                }
                else{
                    [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
                    [lbl_nu_star setHidden:NO];
                }
            }
        }
        else if(buttonIndex == 0)
        {
            NSString *view = @"FoodList";
            NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];

        }
//        if ([title isEqualToString:@"YES"]){
//            NSString *view = @"FoodList";
//            NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", nil];
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
//        }
    }
    else if(alertView.tag == 1000){
        if(buttonIndex == 9999){
            [btn_per100 setUserInteractionEnabled:YES];
            [btn_package setUserInteractionEnabled:YES];
            if(nowEditingField == tf_carbohydrates || nowEditingField == tf_fibre || nowEditingField == tf_sugar){
                if ([self checkCarBohydrates] == NO){
                    [btn_save setEnabled:NO];
                }
                else if([self checkFat] == NO){
                    [btn_save setEnabled:NO];
                }
                else{
                    [btn_save setEnabled:YES];
                }
            }
            
            if(nowEditingField == tf_totalfat || nowEditingField == tf_sat_fat || nowEditingField == tf_trans_fat){
                if ([self checkFat] == NO){
                    [btn_save setEnabled:NO];
                }
                else if([self checkCarBohydrates] == NO){
                    [btn_save setEnabled:NO];
                }
                else{
                    [btn_save setEnabled:YES];
                }
            }
            
            if(nowEditingField == tf_nutrition && btn_package.selected){
                if([tf_nutrition.text length] != 0 && [tf_nutrition.text floatValue] != 0){
                    [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food"]];
                    [lbl_nu_star setHidden:YES];
                }
                else{
                    [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
                    [lbl_nu_star setHidden:NO];
                }
            }
        }
        else if(buttonIndex == 0)
        {
            NSString *view = @"Menu";
            NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
        }
//        if ([title isEqualToString:@"YES"]){
//            NSString *view = @"Menu";
//            NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", nil];
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
//        }
    }
}

- (void)keyboardDidShow:(NSNotification *)note {
    nowAlert = nil;
    id appDelegate = [[UIApplication sharedApplication] delegate];
    UIWindow *window = [appDelegate window];
    for(UIView* sub in [window subviews]){
        NSLog(@"%@", [sub class]);
        if ([sub class] == NSClassFromString(@"NuCalAlert")) {
            nowAlert = (NuCalAlert*)sub;
            break;
        }
    }
    if(nowAlert!=nil){
        NSLog(@"NOT NULL");
        [window bringSubviewToFront:nowAlert];
    }
}

- (void)keyboardDidHide:(NSNotification *)note {
    nowAlert = nil;
    id appDelegate = [[UIApplication sharedApplication] delegate];
    UIWindow *window = [appDelegate window];
    for(UIView* sub in [window subviews]){
        NSLog(@"%@", [sub class]);
        if ([sub class] == NSClassFromString(@"NuCalAlert")) {
            nowAlert = (NuCalAlert*)sub;
            break;
        }
    }
    if(nowAlert!=nil){
        NSLog(@"NOT NULL");
        [window bringSubviewToFront:nowAlert];
    }
}

@end
