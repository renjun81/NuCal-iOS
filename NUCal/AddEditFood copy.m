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

extern NUCalViewController *mainController;

#pragma mark - View lifecycle

@synthesize sv_addfood;
@synthesize btn_per100,btn_package;
@synthesize btn_kcal, btn_kJ;
@synthesize btn_carbohy;
@synthesize v_picker;
@synthesize p_picker;
@synthesize btn_save;
@synthesize arrayNo;
@synthesize lbl_star1,lbl_star2,lbl_star0 ,lbl_nutrition;
@synthesize tf_food,tf_nutrition,tf_energy,tf_protein,tf_carbohydrates,tf_sat_fat,tf_trans_fat,tf_sugar,tf_fibre,tf_sodium,tf_totalfat;


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
    [arrayNo release];
    [kb_toolbar release];
    [kb_toolbarNext release];
    [kb_toolbarPrevious release];
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
    NSLog(@"View Did Load");
    NSString *view2 = @"Add Food";
    NSString *isHidden = @"NO";
    NSString *buttonMode = @"home";
	NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
    
    [sv_addfood setContentSize:CGSizeMake(320, 950)];
    btn_per100.selected = true;
    [tf_nutrition setEnabled:NO];
    btn_kcal.selected = true;
    
    arrayNo = [[NSArray alloc] initWithObjects:@"Carbohydrates",@"Total Carbohydrates",@"Available Carbohydrates",nil];
    
    [lbl_star1 setHidden:YES];
    [lbl_star2 setHidden:YES];
    [lbl_star0 setHidden:YES];
    
    tf_food.inputAccessoryView = kb_toolbar;
    tf_energy.inputAccessoryView = kb_toolbar;
    tf_protein.inputAccessoryView = kb_toolbar;
    tf_totalfat.inputAccessoryView = kb_toolbar;
    tf_sat_fat.inputAccessoryView = kb_toolbar;
    tf_trans_fat.inputAccessoryView = kb_toolbar;
    tf_carbohydrates.inputAccessoryView = kb_toolbar;
    tf_fibre.inputAccessoryView = kb_toolbar;
    tf_sugar.inputAccessoryView = kb_toolbar;
    tf_sodium.inputAccessoryView = kb_toolbar;
    
    if (isEdit) {
        NSLog(@"This is editing");
        
//        [(Food*)[[mainController.currentProfile getFoodList] objectAtIndex:editingIndex] printFood];
        for(int i = 0; i < [[mainController.currentProfile getFoodList]count]; i++){
            if([[[mainController.currentProfile getFoodList] objectAtIndex:i] foodID] == editingIndex){
                editingFood = [[mainController.currentProfile getFoodList] objectAtIndex:i];
                [editingFood printFood];
            }
        }
        
        
        
        NSString *view2 = @"Edit Food";
        NSString *isHidden = @"NO";
        NSString *buttonMode = @"home";
        NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
        
        NSString *tmp = [NSString stringWithString:[editingFood name]];
        
        [tf_food setText: [editingFood name]];
        NSLog(@"%@",tmp);
        
        if([editingFood type] == PER100GML){
            [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food_dim@2x"]];
            [tf_nutrition setEnabled:NO];
            [lbl_star0 setHidden:YES];
            [tf_nutrition setText:nil];
            [lbl_nutrition setTextColor:[UIColor colorWithRed:167/255.0 green:189/255.0 blue:124/255.0 alpha:1]];
            
            btn_per100.selected =true;
            btn_package.selected =false;
            if(btn_per100.selected){
                [btn_package setBackgroundImage:[UIImage imageNamed:@"btn_amount_right.png"] forState:UIControlStateNormal];
                [btn_per100 setBackgroundImage:[UIImage imageNamed:@"btn_amount_left_on.png"] forState:UIControlStateNormal];
            }
        }else if([editingFood type] == PERSERVING){
            [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food@2x"]];
            [tf_nutrition setEnabled:YES];
            
            if([[tf_nutrition text] length] <= 0){
                [lbl_star0 setHidden:NO];
            }
            [lbl_nutrition setTextColor:[UIColor colorWithRed:42/255.0 green:72/255.0 blue:12/255.0 alpha:1]];
            
            
            btn_per100.selected =false;
            btn_package.selected =true;
            if(btn_package.selected)
            {
                
                [btn_package setBackgroundImage:[UIImage imageNamed:@"btn_amount_right_on.png"] forState:UIControlStateNormal];
                [btn_per100 setBackgroundImage:[UIImage imageNamed:@"btn_amount_left.png"] forState:UIControlStateNormal];
                
            }
            [tf_nutrition setText:[NSString stringWithFormat:@"%.02f" ,[editingFood weight]]];
        }
        
        if([editingFood energyType]==KCAL){
            btn_kcal.selected = true;
            btn_kJ.selected = false;
            
            
            
            if(btn_kcal.selected){
                
                [btn_kcal setBackgroundImage:[UIImage imageNamed:@"btn_energy_left_on"] forState:UIControlStateNormal];
                [btn_kJ setBackgroundImage:[UIImage imageNamed:@"btn_energy_right"] forState:UIControlStateNormal];
            }
        }
        else if([editingFood energyType]==KJ){
            btn_kcal.selected = false;
            btn_kJ.selected = true;
            
            
            
            if(btn_kJ.selected){
                
                [btn_kJ setBackgroundImage:[UIImage imageNamed:@"btn_energy_right_on"] forState:UIControlStateNormal];
                [btn_kcal setBackgroundImage:[UIImage imageNamed:@"btn_energy_left"] forState:UIControlStateNormal];
            }
        }
        
        [tf_energy setText:[NSString stringWithFormat:@"%.02f" ,[editingFood energy]]];
        
        [tf_protein setText:[NSString stringWithFormat:@"%.02f" ,[editingFood protein]]];
        
        [tf_totalfat setText:[NSString stringWithFormat:@"%.02f" ,[editingFood totalFat]]];
        
        if([editingFood saturatedFat] != 0){
            [tf_sat_fat setText:[NSString stringWithFormat:@"%.02f" ,[editingFood saturatedFat]]];
        }
        
        if([editingFood transFat] != 0){
            [tf_trans_fat setText:[NSString stringWithFormat:@"%.02f" ,[editingFood transFat]]];
        }
        
        if([editingFood carbohydratesType]==CARBOHYDRATES){
            [btn_carbohy setTitle:@"Carbohydrates" forState: UIControlStateNormal];
            [lbl_star1 setHidden:YES];
            [lbl_star2 setHidden:YES];
        }
        else if([editingFood carbohydratesType]==TOTALCARBOHYDRATES){
            [btn_carbohy setTitle:@"Total Carbohydrates" forState: UIControlStateNormal];
            
            if([[tf_fibre text] isEqualToString:@""])
            {
                [lbl_star1 setHidden:NO];
            }
            
            if([[tf_sugar text] isEqualToString:@""])
            {
                [lbl_star2 setHidden:YES];
            }
        }
        else if([editingFood carbohydratesType]==AVAILABLECARBOHYDRATES){
            [btn_carbohy setTitle:@"Available Carbohydrates" forState: UIControlStateNormal];
            [lbl_star1 setHidden:YES];
            [lbl_star2 setHidden:YES];
        }
        
        [tf_carbohydrates setText:[NSString stringWithFormat:@"%.02f" ,[editingFood carbohydrates]]];
        
        if([editingFood dietaryFibre] != 0){
            [tf_fibre setText:[NSString stringWithFormat:@"%.02f" ,[editingFood dietaryFibre]]];
        }
        
        if([editingFood sugars] != 0){
            [tf_sugar setText:[NSString stringWithFormat:@"%.02f" ,[editingFood sugars]]];
        }
        
        [tf_sodium setText:[NSString stringWithFormat:@"%.02f" ,[editingFood sodium]]];
    }
    
    // Do any additional setup after loading the view from its nib.
}



- (void)viewDidUnload
{
//    [sv_addfood release];
//    sv_addfood = nil;
//    [btn_per100 release];
//    btn_per100 = nil;
//    [btn_package release];
//    btn_package = nil;
//    [btn_kcal release];
//    btn_kcal = nil;
//    [btn_kJ release];
//    btn_kJ = nil;
//    [btn_save release];
//    btn_save = nil;
//    [v_picker release];
//    v_picker = nil;
//    [btn_carbohy release];
//    btn_carbohy = nil;
//    [btn_cancel release];
//    btn_cancel = nil;
//    [btn_save release];
//    btn_save = nil;
//    [p_picker release];
//    p_picker = nil;
//    [lbl_star1 release];
//    lbl_star1 = nil;
//    [lbl_star1 release];
//    lbl_star1 = nil;
//    [lbl_star2 release];
//    lbl_star2 = nil;
//    
//    
//    [tf_food release];
//    tf_food = nil;
//    [tf_nutrition release];
//    tf_nutrition = nil;
//    [tf_energy release];
//    tf_energy = nil;
//    [tf_protein release];
//    tf_protein = nil;
//    [tf_sat_fat release];
//    tf_sat_fat = nil;
//    [tf_trans_fat release];
//    tf_trans_fat = nil;
//    [tf_carbohydrates release];
//    tf_carbohydrates = nil;
//    [tf_fibre release];
//    tf_fibre = nil;
//    [tf_sugar release];
//    tf_sugar = nil;
//    [tf_sodium release];
//    tf_sodium = nil;
//    [lbl_nutrition release];
//    lbl_nutrition = nil;
//    [lbl_nutrition release];
//    lbl_nutrition = nil;
//    [lbl_star0 release];
//    lbl_star0 = nil;
//    [tf_totalfat release];
//    tf_totalfat = nil;
    [self setKb_toolbar:nil];
    [self setKb_toolbarNext:nil];
    [self setKb_toolbarPrevious:nil];
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
    
    if(![[tf_food text] isEqualToString:@""] && ![[tf_energy text] isEqualToString:@""]){
        if([[tf_protein text] isEqualToString:@""] && [[tf_totalfat text] isEqualToString:@""] && [[tf_sat_fat text] isEqualToString:@""] && [[tf_trans_fat text] isEqualToString:@""] && [[tf_carbohydrates text] isEqualToString:@""] && [[tf_fibre text] isEqualToString:@""] && [[tf_sugar text] isEqualToString:@""] && [[tf_sodium text] isEqualToString:@""]){
            if(carbohydratesType == 1 && [[tf_fibre text] isEqualToString:@""])
            {
                nutrition = TRUE;
                carbohydrates = FALSE;
                return;
            }
            nutrition = TRUE;
            carbohydrates = TRUE;
            return;
        }
    }
    
    if(![[tf_food text] isEqualToString:@""] && ![[tf_energy text] isEqualToString:@""] && ![[tf_protein text] isEqualToString:@""] && ![[tf_totalfat text] isEqualToString:@""] && ![[tf_carbohydrates text] isEqualToString:@""] && ![[tf_sodium text] isEqualToString:@""])
    {
        if (btn_package.selected == TRUE && [[tf_nutrition text] isEqualToString:@""]) {
            nutrition = FALSE; 
        }
        else 
        {
            nutrition = TRUE;
        }
        
        if(carbohydratesType == 1 && [[tf_fibre text] isEqualToString:@""])
        {
            carbohydrates = FALSE;
        }
        else 
        {
            carbohydrates = TRUE;
        }
    }
    else {
        carbohydrates = FALSE;
        nutrition = FALSE;
    }   
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
    [tf_carbohydrates setText:nil];
    [tf_fibre setText:nil];
    [tf_sugar setText:nil];
    [tf_sodium setText:nil];
}

- (void)control_red_textfield
{
    if ([[tf_food text] isEqualToString:@""]) {
        [tf_food setBackground:[UIImage imageNamed:@"txtfield_foodname_pink@2x"]];
    }else [tf_food setBackground:[UIImage imageNamed:@"txtfield_foodname@2x"]];
    
    if(btn_package.selected == TRUE && [[tf_nutrition text] isEqualToString:@""])
    {
        [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food_error@2x"]];
    } 
    else [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food_dim@2x"]];
    
    if([[tf_energy text] isEqualToString:@""])
    {
        [tf_energy setBackground:[UIImage imageNamed:@"txtfield_food_error@2x"]];
    } else [tf_energy setBackground:[UIImage imageNamed:@"txtfield_food@2x"]];
    
    if([[tf_protein text] isEqualToString:@""])
    {
        [tf_protein setBackground:[UIImage imageNamed:@"txtfield_food_error@2x"]];
    } else [tf_protein setBackground:[UIImage imageNamed:@"txtfield_food@2x"]];
    
    if ([[tf_totalfat text] isEqualToString:@""])
    {
        [tf_totalfat setBackground:[UIImage imageNamed:@"txtfield_food_error@2x"]];
    } else [tf_totalfat setBackground:[UIImage imageNamed:@"txtfield_food@2x"]];
    
    if([[tf_carbohydrates text] isEqualToString:@""])
    {
        [tf_carbohydrates setBackground:[UIImage imageNamed:@"txtfield_food_error@2x"]];
    } else [tf_carbohydrates setBackground:[UIImage imageNamed:@"txtfield_food@2x"]];
    
    if(carbohydratesType == 1 && [[tf_fibre text] isEqualToString:@""])
    {
        [tf_fibre setBackground:[UIImage imageNamed:@"txtfield_food_error@2x"]];
    } else [tf_fibre setBackground:[UIImage imageNamed:@"txtfield_food@2x"]];
    
    //    if(carbohydratesType == 1 && [[tf_sugar text] isEqualToString:@""])
    //    {
    //        [tf_sugar setBackground:[UIImage imageNamed:@"txtfield_food_error@2x"]];
    //    } else [tf_sugar setBackground:[UIImage imageNamed:@"txtfield_food@2x"]];
    
    if([[tf_sodium text] isEqualToString:@""])
    {
        [tf_sodium setBackground:[UIImage imageNamed:@"txtfield_food_error@2x"]];
    } else [tf_sodium setBackground:[UIImage imageNamed:@"txtfield_food@2x"]];
    
    
}

- (void) control_white_textfield
{
    if([[tf_food text] length] > 0)
    {
        [tf_food setBackground:[UIImage imageNamed:@"txtfield_foodname@2x"]];
    }
    
    if([[tf_nutrition text] length] > 0)
    {
        [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_foodname@2x"]];
    }
    
    if([[tf_energy text] length] > 0)
    {
        [tf_energy setBackground:[UIImage imageNamed:@"txtfield_foodname@2x"]];
    }
    
    if([[tf_protein text] length] > 0)
    {
        [tf_protein setBackground:[UIImage imageNamed:@"txtfield_foodname@2x"]];
    }
    
    if([[tf_totalfat text] length] > 0)
    {
        [tf_totalfat setBackground:[UIImage imageNamed:@"txtfield_foodname@2x"]];
    }
    
    if([[tf_carbohydrates text] length] > 0)
    {
        [tf_carbohydrates setBackground:[UIImage imageNamed:@"txtfield_foodname@2x"]];
    }
    
    if([[tf_fibre text] length] > 0)
    {
        [tf_fibre setBackground:[UIImage imageNamed:@"txtfield_foodname@2x"]];
    }
    
    //    if([[tf_sugar text] length] > 0)
    //    {
    //        [tf_sugar setBackground:[UIImage imageNamed:@"txtfield_foodname@2x"]];
    //    }
    
    if([[tf_sodium text] length] > 0)
    {
        [tf_sodium setBackground:[UIImage imageNamed:@"txtfield_foodname@2x"]];
    }
    
}

-(void) calculateNutrition
{
    float food_amount = [tf_nutrition.text floatValue];
    float protein = [tf_protein.text floatValue];
    float total_fat = [tf_totalfat.text floatValue];
    float fibre = [tf_fibre.text floatValue];
    float carbohydrates = [tf_carbohydrates.text floatValue];
    
    
    if(carbohydratesType == 1 && btn_per100.selected)
    {
        if((protein + total_fat + carbohydrates) - fibre > 100) {
            cal_nutrition = false;
        }else cal_nutrition = true;
    }
    else if (carbohydratesType != 1 && btn_per100.selected)
    {
        if(protein + total_fat + carbohydrates > 100)
        {
            cal_nutrition = false;
        }else cal_nutrition = true;
    }
    else if (carbohydratesType == 1 && btn_package.selected)
    {
        if((protein + total_fat + carbohydrates) - fibre > food_amount)
        {
            cal_nutrition = false;
        }else cal_nutrition = true;
    }
    else if (carbohydratesType != 1 && btn_package.selected)
    {
        if(protein + total_fat + carbohydrates > food_amount)
        {
            cal_nutrition = false;
        }else cal_nutrition = true;
        
    }
    
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
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.4];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationBeginsFromCurrentState:NO];
	[v_picker setFrame:CGRectMake(0, 275, 320, 460)];
	[UIView commitAnimations];
    //[p_picker selectRow:1 inComponent:0 animated:NO];
}
- (void)pickerViewClose
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.4];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationBeginsFromCurrentState:NO];
	[v_picker setFrame:CGRectMake(0, 1000, 320, 460)];
	[UIView commitAnimations];
}


//below = food 份量 switchbtn

- (IBAction)per_100g:(id)sender {
    [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food_dim@2x"]];
    [tf_nutrition setEnabled:NO];
    [lbl_star0 setHidden:YES];
    [tf_nutrition setText:nil];
    [lbl_nutrition setTextColor:[UIColor colorWithRed:167/255.0 green:189/255.0 blue:124/255.0 alpha:1]];
    
    
    btn_per100.selected =true;
    btn_package.selected =false;
    if(btn_per100.selected){
        
        [btn_package setBackgroundImage:[UIImage imageNamed:@"btn_amount_right.png"] forState:UIControlStateNormal];
        [btn_per100 setBackgroundImage:[UIImage imageNamed:@"btn_amount_left_on.png"] forState:UIControlStateNormal];
    }
    
}

- (IBAction)per_package:(id)sender {
    
    
    [tf_nutrition setBackground:[UIImage imageNamed:@"txtfield_food@2x"]];
    [tf_nutrition setEnabled:YES];
    
    if([[tf_nutrition text] length] <= 0){
        [lbl_star0 setHidden:NO];
    }
    [lbl_nutrition setTextColor:[UIColor colorWithRed:42/255.0 green:72/255.0 blue:12/255.0 alpha:1]];
    
    
    btn_per100.selected =false;
    btn_package.selected =true;
    if(btn_package.selected)
    {
        
        [btn_package setBackgroundImage:[UIImage imageNamed:@"btn_amount_right_on.png"] forState:UIControlStateNormal];
        [btn_per100 setBackgroundImage:[UIImage imageNamed:@"btn_amount_left.png"] forState:UIControlStateNormal];
        
    }
}

//below = energy 單位 switchbtn
- (IBAction)choose_kcal:(id)sender {
    btn_kcal.selected = true;
    btn_kJ.selected = false;
    
    
    
    if(btn_kcal.selected){
        
        [btn_kcal setBackgroundImage:[UIImage imageNamed:@"btn_energy_left_on"] forState:UIControlStateNormal];
        [btn_kJ setBackgroundImage:[UIImage imageNamed:@"btn_energy_right"] forState:UIControlStateNormal];
    }
}

- (IBAction)choose_kJ:(id)sender {
    btn_kcal.selected = false;
    btn_kJ.selected = true;
    
    
    
    if(btn_kJ.selected){
        
        [btn_kJ setBackgroundImage:[UIImage imageNamed:@"btn_energy_right_on"] forState:UIControlStateNormal];
        [btn_kcal setBackgroundImage:[UIImage imageNamed:@"btn_energy_left"] forState:UIControlStateNormal];
    }
    
}

// savefood button (at the end)

- (IBAction)save_food:(id)sender {
    
    [self check_tf];
    
    btn_save.selected = true;
    
    //    if(btn_save.selected)
    //    {
    //        [btn_save setBackgroundImage:[UIImage imageNamed:@"btn_saved"] forState:UIControlStateNormal];
    //    }
    
    if(nutrition == TRUE && carbohydrates == TRUE)
    {
        Food *food = [self saveFoodByInput];
        if(isEdit == NO){
            [mainController.currentProfile addFood:food];
            [food release];
            
            [self storeProfile:mainController.currentProfile];
            
            UIAlertView *invalid = [[UIAlertView alloc] initWithTitle:NULL message:@"Add another food?" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO",NULL];
            [invalid show];
            [invalid release];
            if(btn_save.selected)
            {
                [btn_save setBackgroundImage:[UIImage imageNamed:@"btn_saved"] forState:UIControlStateNormal];
            }
        }
        if(isEdit == YES){
            [editingFood setName:[food name]];
            [editingFood setType:[food type]];
            [editingFood setWeight:[food weight]];
            [editingFood setEnergy:[food energy]];
            [editingFood setEnergyType:[food energyType]];
            [editingFood setProtein:[food protein]];
            [editingFood setTotalFat:[food totalFat]];
            [editingFood setSaturatedFat:[food saturatedFat]];
            [editingFood setTransFat:[food transFat]];
            [editingFood setCarbohydratesType:[food carbohydratesType]];
            [editingFood setCarbohydrates:[food carbohydrates]];
            [editingFood setDietaryFibre:[food dietaryFibre]];
            [editingFood setSugars:[food sugars]];
            [editingFood setSodium:[food sodium]];
            [food release];
            
            [self storeProfile:mainController.currentProfile];
            
            [btn_save setBackgroundImage:[UIImage imageNamed:@"btn_saved"] forState:UIControlStateNormal];
            [btn_save setEnabled:NO];
            
            [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(saveEnd) userInfo:nil repeats:NO];
        }
    }
    else {
        [self control_red_textfield];
        UIAlertView *invalid = [[UIAlertView alloc] initWithTitle:NULL message:@"Some fields are necessary!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:NULL];
        [invalid show];
        [invalid release];
    }
}

- (void)saveEnd{
    NSString *view = @"FoodList";
    NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
}

//check yes or no (from alert view)

- (void)alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex  
{  
    
    NSString *title = [alert buttonTitleAtIndex:buttonIndex];
    
    
    if([title isEqualToString:@"NO"])
    {
        NSString *view = @"Menu";
        NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
        
    }
    else if ([title isEqualToString:@"YES"])
    {
        [btn_save setBackgroundImage:[UIImage imageNamed:@"btn_save"] forState:UIControlStateNormal];
        [sv_addfood setContentOffset:CGPointMake(0, 0)];
        [self clear_textfield];
    }
}

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
            [btn_carbohy setTitle:@"Carbohydrates" forState: UIControlStateNormal];
            [lbl_star1 setHidden:YES];
            [lbl_star2 setHidden:YES];
            break;
        case 1:
            NSLog(@"1");
            [btn_carbohy setTitle:@"Total Carbohydrates" forState: UIControlStateNormal];
            
            if([[tf_fibre text] isEqualToString:@""])
            {
                [lbl_star1 setHidden:NO];
            }
            
            if([[tf_sugar text] isEqualToString:@""])
            {
                [lbl_star2 setHidden:YES];
            }
            break;
        case 2:
            NSLog(@"2");
            [btn_carbohy setTitle:@"Available Carbohydrates" forState: UIControlStateNormal];
            [lbl_star1 setHidden:YES];
            [lbl_star2 setHidden:YES];
            break;
        default:
            break;
    }
    
    [self pickerViewClose];
    [sv_addfood setScrollEnabled:YES];
    
}

- (Food*)saveFoodByInput{
    NSString *foodName;
    int nuType;
    float weight;
    float energy;
    int energyType;
    float protein;
    float totalFat;
    float saturatedFat;
    float transFat;
    int _carbohydratesType;
    float carbohydrates;
    float dietaryFibre;
    float sugars;
    float sodium;
    int foodID;
    
    foodName = tf_food.text;
    nuType = btn_per100.selected ? PER100GML : PERSERVING;
    weight = nuType==PER100GML ? 100 : [tf_nutrition.text floatValue];
    energy = [tf_energy.text floatValue];
    energyType = btn_kcal.selected ? KCAL : KJ;
    protein = [tf_protein.text floatValue];
    totalFat = [tf_totalfat.text floatValue];
    saturatedFat = [tf_sat_fat.text floatValue];
    transFat = [tf_trans_fat.text floatValue];
    _carbohydratesType = carbohydratesType;
    carbohydrates = [tf_carbohydrates.text floatValue];
    dietaryFibre = [tf_fibre.text floatValue];
    sugars = [tf_sugar.text floatValue];
    sodium = [tf_sodium.text floatValue];
    NSLog(@"food list number : %i", [[mainController.currentProfile getFoodList]count]);
    if([[mainController.currentProfile getFoodList]count] == 0){
        foodID = 1;
    }else{
        [[[mainController.currentProfile getFoodList] lastObject] printFood];
        foodID = [[[mainController.currentProfile getFoodList] lastObject] foodID] + 1;
    }
    
    Food* tmpFood = [[Food alloc]initWithFood:foodName Type:nuType
                                       Weight:weight
                                       Energy:energy
                                   EnergyType:energyType
                                      Protein:protein
                                     TotalFat:totalFat
                                 SaturatedFat:saturatedFat
                                     TransFat:transFat
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
    NSMutableArray *storeArray = [[NSMutableArray alloc] initWithObjects:profile, nil];
    [Tool setProfile:storeArray];
    [storeArray release];
    
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
        }
    }
    if(btn == kb_toolbarPrevious){
        NSLog(@"HIHIHIHIH222");
        NSInteger previousTag = nowEditingField.tag - 1;
        // Try to find next responder
        UIResponder* previousResponder = [nowEditingField.superview viewWithTag:previousTag];
        if (previousResponder) {
            // Found next responder, so set it.
            [previousResponder becomeFirstResponder];
            [sv_addfood setContentOffset:CGPointMake(sv_addfood.contentOffset.x, nowEditingField.frame.origin.y - 45)];
        } else {
            // Not found, so remove keyboard.
            [nowEditingField resignFirstResponder];
            
        }
    }
    return NO; // We do not want UITextField to insert line-breaks.

}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *temp = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if(textField != tf_food && [temp length] >0){
        
        
        int dot = [textField.text rangeOfString:@"."].location;
        
        if(dot != NSNotFound && dot > 0)
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
    [sv_addfood setContentSize:CGSizeMake(320, 1200)];
    nowEditingField = textField;
    if(textField == tf_carbohydrates || textField == tf_fibre || textField == tf_sugar || textField == tf_sodium)
    {
        [sv_addfood setContentOffset:CGPointMake(0, 355)];
    }
}
- (void) textFieldDidEndEditing:(UITextField *)textField
{
    [self control_white_textfield];
    
    if (textField == tf_nutrition && btn_package.selected == true && [[tf_nutrition text] isEqualToString:@""])
    {
        [lbl_star0 setHidden:NO];
    }
    else if(btn_per100.selected == TRUE || [[tf_nutrition text] length] > 0)
    {
        [lbl_star0 setHidden:YES];
    }
    
    if(textField == tf_fibre && carbohydratesType == 1 && [[tf_fibre text] isEqualToString:@""])
    {
        [lbl_star1 setHidden:NO];
    }
    else if(carbohydratesType != 1 || [[tf_fibre text] length] > 0){
        [lbl_star1 setHidden:YES];
    }
    
    //    if(textField == tf_sugar && carbohydratesType == 1 && [[tf_sugar text] isEqualToString:@""])
    //    {
    //        [lbl_star2 setHidden:NO];
    //    }
    //    else if (carbohydratesType != 1 || [[tf_sugar text] length] > 0)
    //    {
    //        [lbl_star2 setHidden:YES];
    //    }
    
    if(textField == tf_carbohydrates || textField == tf_fibre || textField == tf_sugar || textField == tf_sodium)
    {
        [sv_addfood setContentOffset:CGPointMake(0, 200)];
    }
    
    if(carbohydratesType == 1 && textField == tf_fibre) // cal food amount
    {
        [self calculateNutrition];
        [self calculateEnergy];
        
        if(cal_nutrition){
            //            NSLog(@"123");
        }
        else{
            [tf_protein setText:nil];
            [tf_totalfat setText:nil];
            [tf_carbohydrates setText:nil];
            [tf_fibre setText:nil];
            
            UIAlertView *invalid = [[UIAlertView alloc] initWithTitle:NULL message:@"Should not larger than food reference amount" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:NULL];
            [invalid show];
            [invalid release];
        }
        
        if(cal_energy){
            
        }
        else
        {
            [tf_protein setText:nil];
            [tf_totalfat setText:nil];
            [tf_carbohydrates setText:nil];
            [tf_fibre setText:nil];
            
            UIAlertView *invalid = [[UIAlertView alloc] initWithTitle:NULL message:@"Out of range(energy)" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:NULL];
            [invalid show];
            [invalid release];
        }
        
    }
    else if (carbohydratesType != 1 && textField == tf_carbohydrates)
    {
        [self calculateNutrition];
        [self calculateEnergy];
        
        if(cal_nutrition){
            //        NSLog(@"456");
        }
        else{
            [tf_protein setText:nil];
            [tf_totalfat setText:nil];
            [tf_carbohydrates setText:nil];
            
            UIAlertView *invalid = [[UIAlertView alloc] initWithTitle:NULL message:@"Should not larger than food reference amount" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:NULL];
            [invalid show];
            [invalid release];  
        }
        
        if(cal_energy){
            
        }
        else
        {
            [tf_protein setText:nil];
            [tf_totalfat setText:nil];
            [tf_carbohydrates setText:nil];
            
            UIAlertView *invalid = [[UIAlertView alloc] initWithTitle:NULL message:@"Out of range(energy)" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:NULL];
            [invalid show];
            [invalid release];
        }
        
    }
    
    //    if(carbohydratesType == 1 && textField == tf_fibre) // cal energy
    //    {
    //        [self calculateEnergy];
    //        
    //        if(cal_energy){
    //        
    //        }
    //        else
    //        {
    //            [tf_protein setText:nil];
    //            [tf_totalfat setText:nil];
    //            [tf_carbohydrates setText:nil];
    //            [tf_fibre setText:nil];
    //            
    //            UIAlertView *invalid = [[UIAlertView alloc] initWithTitle:NULL message:@"Out of range(energy)" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:NULL];
    //            [invalid show];
    //            [invalid release];
    //        }
    //    }
    //    else if (carbohydratesType != 1 && textField == tf_carbohydrates)
    //    {
    //        [self calculateEnergy];
    //        
    //        if(cal_energy){
    //            
    //        }
    //        else
    //        {
    //            [tf_protein setText:nil];
    //            [tf_totalfat setText:nil];
    //            [tf_carbohydrates setText:nil];
    //            
    //            UIAlertView *invalid = [[UIAlertView alloc] initWithTitle:NULL message:@"Out of range(energy)" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:NULL];
    //            [invalid show];
    //            [invalid release];
    //        }
    //    }
    
    
    if(textField == tf_sat_fat || textField == tf_trans_fat|| textField == tf_totalfat)
    {
        [self calculateTotalFat];
        if (cal_fat) {
            
        }
        else {
            [tf_sat_fat setText:nil];
            [tf_trans_fat setText:nil];
            
            UIAlertView *invalid = [[UIAlertView alloc] initWithTitle:NULL message:@"Should not larger than total fat" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:NULL];
            [invalid show];
            [invalid release];
        }
    }
    
    if(textField == tf_carbohydrates || textField == tf_fibre || textField == tf_sugar)
    {
        if(carbohydratesType == 1){
            [self calculateCarbohydrates];
            
            if(cal_carbohy){
                
            }
            else{
                [tf_fibre setText:nil];
                [tf_sugar setText:nil];
                
                UIAlertView *invalid = [[UIAlertView alloc] initWithTitle:NULL message:@"Should not larger than total carbohydrates" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:NULL];
                [invalid show];
                [invalid release];
            }
        }
        else if(carbohydratesType ==0 || carbohydratesType ==2){
            
            [self calculateCarbohydrates];
            
            if(cal_sugar){
                NSLog(@"sugar ok");
            }
            else{
                [tf_sugar setText:nil];
                
                UIAlertView *invalid = [[UIAlertView alloc] initWithTitle:NULL message:@"Sugar should not larger than carbohydrates" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:NULL];
                [invalid show];
                [invalid release];
            }
        }
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    [sv_addfood setContentSize:CGSizeMake(320, 950)];
    return YES;
}


@end
