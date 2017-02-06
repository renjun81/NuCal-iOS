//
//  MyIntake.m
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyIntake.h"
#import "NUCalViewController.h"

@implementation MyIntake
@synthesize v_myIntake;
@synthesize lbl_name;
@synthesize lbl_kcal;
@synthesize tv_warning;
@synthesize v_input;
@synthesize btn_calculate;
@synthesize sv_result;
@synthesize v_intakeResult;
@synthesize bar_low_energy;
@synthesize bar_high_energy;
@synthesize bar_low_protein;
@synthesize bar_high_protein;
@synthesize bar_low_totalFat;
@synthesize bar_high_totalFat;
@synthesize bar_low_SatFat;
@synthesize bar_high_SatFat;
@synthesize bar_low_TransFat;
@synthesize bar_high_TransFat;

@synthesize bar_low_cho;
@synthesize bar_high_cho;

@synthesize bar_low_Car;
@synthesize bar_high_Car;
@synthesize bar_low_Fibre;
@synthesize bar_high_Fibre;
@synthesize bar_low_Sodium;
@synthesize bar_high_Sodium;
@synthesize bar_low_Sugar;
@synthesize bar_high_Sugar;
@synthesize lbl_result_energy;
@synthesize lbl_result_energy_percent;
@synthesize lbl_result_protein;
@synthesize lbl_result_protein_percent;
@synthesize lbl_result_TotalFat;
@synthesize lbl_result_TotalFat_percent;
@synthesize lbl_result_SatFat;
@synthesize lbl_result_SatFat_percent;
@synthesize lbl_result_TransFat;
@synthesize lbl_result_TransFat_percent;
@synthesize lbl_result_Car;
@synthesize lbl_result_Car_percent;
@synthesize lbl_result_Fibre;
@synthesize lbl_result_Fibre_percent;
@synthesize lbl_result_Sodium;
@synthesize lbl_result_Sodium_percent;
@synthesize lbl_result_Sugar;
@synthesize lbl_result_Sugar_percent;
@synthesize btn_saveToHistory;
@synthesize lbl_dailyEnergy;
@synthesize lbl_totalEnergyAndNutrient;
@synthesize lbl_dailyLimit;
@synthesize lbl_energy;
@synthesize lbl_protein;
@synthesize lbl_totalFat;
@synthesize lbl_SatFat;
@synthesize lbl_transFat;
@synthesize lbl_car;
@synthesize lbl_fibre;
@synthesize lbl_sugar;
@synthesize lbl_sodium;
@synthesize lbl_nu;
@synthesize lbl_consumed;
@synthesize lbl_nu_info;
@synthesize lbl_food_title;

@synthesize lbl_cholesterol, lbl_result_cho, lbl_result_cho_percent, profile_pic;

extern NUCalViewController *mainController;

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
    [inputFieldArr release];
    [foodNameArr release];
    [starArr release];
    [weightTypeArr release];
    [lbl_name release];
    [lbl_kcal release];
    [tv_warning release];
    [v_myIntake release];
    [v_input release];
    [btn_calculate release];
    [sv_result release];
    [v_intakeResult release];
    [bar_low_energy release];
    [bar_high_energy release];
    [bar_low_protein release];
    [bar_high_protein release];
    [bar_low_totalFat release];
    [bar_high_totalFat release];
    [bar_low_SatFat release];
    [bar_high_SatFat release];
    [bar_low_TransFat release];
    [bar_high_TransFat release];
    [bar_low_Car release];
    [bar_high_Car release];
    [bar_low_Fibre release];
    [bar_high_Fibre release];
    [bar_low_Sodium release];
    [bar_high_Sodium release];
    [lbl_result_energy release];
    [lbl_result_energy_percent release];
    [lbl_result_protein release];
    [lbl_result_protein_percent release];
    [lbl_result_TotalFat release];
    [lbl_result_TotalFat_percent release];
    [lbl_result_SatFat release];
    [lbl_result_SatFat_percent release];
    [lbl_result_TransFat release];
    [lbl_result_TransFat_percent release];
    [lbl_result_Car release];
    [lbl_result_Car_percent release];
    [lbl_result_Fibre release];
    [lbl_result_Fibre_percent release];
    [lbl_result_Sodium release];
    [lbl_result_Sodium_percent release];
    [bar_low_Sugar release];
    [lbl_result_Sugar release];
    [lbl_result_Sugar_percent release];
    [bar_high_Sugar release];
    [btn_saveToHistory release];
    [lbl_dailyEnergy release];
    [lbl_totalEnergyAndNutrient release];
    [lbl_dailyLimit release];
    [lbl_energy release];
    [lbl_protein release];
    [lbl_totalFat release];
    [lbl_SatFat release];
    [lbl_transFat release];
    [lbl_car release];
    [lbl_fibre release];
    [lbl_sugar release];
    [lbl_sodium release];
    [lbl_nu release];
    [lbl_consumed release];
    [lbl_nu_info release];
    [lbl_food_title release];
    [profile_pic release];
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
    [self initWithProfile:mainController.currentProfile];
    
    [lbl_dailyEnergy setText:[Language getText:@"daily_energy"]];
    [lbl_dailyLimit setText:[Language getText:@"daily_limit"]];
    [lbl_totalEnergyAndNutrient setText:[Language getText:@"total_en_over_intake"]];
    [lbl_energy setText:[Language getText:@"energy"]];
    [lbl_protein setText:[Language getText:@"protein"]];
    [lbl_totalFat setText:[Language getText:@"totalfat"]];
    [lbl_SatFat setText:[Language getText:@"satfat"]];
    [lbl_transFat setText:[Language getText:@"transfat"]];
    
    [lbl_cholesterol setText:[Language getText:@"cholesterol"]];
    
    [lbl_car setText:[Language getText:@"carbo"]];
    //    [btn_carbohy setTitle:[Language getText:@"carbo"] forState:UIControlStateSelected];
    [lbl_fibre setText:[Language getText:@"fibre"]];
    [lbl_sugar setText:[Language getText:@"sugar"]];
    [lbl_sodium setText:[Language getText:@"sodium"]];
    [lbl_nu setText:[Language getText:@"nutrient"]];
    [lbl_food_title setText:[Language getText:@"food"]];
    [lbl_consumed setText:[Language getText:@"consumed"]];
//    if([[Language currentLanguage]isEqualToString:@"en"] == NO){
//        [lbl_nu_info setText:[NSString stringWithFormat:@"    %@", [Language getText:@"nu_fact_info"]]];
//    }
    [lbl_nu_info setText:[Language getText:@"nu_fact_info"]];
    if([[Language currentLanguage] isEqualToString:@"en"]){
        [btn_calculate setImage:[UIImage imageNamed:@"btn_calculate"] forState:UIControlStateNormal];
        [btn_saveToHistory setImage:[UIImage imageNamed:@"btn_savehistory"] forState:UIControlStateNormal];
    }
    if([[Language currentLanguage] isEqualToString:@"zh"]){
        [btn_calculate setImage:[UIImage imageNamed:@"btn_calculate_tc"] forState:UIControlStateNormal];
        [btn_saveToHistory setImage:[UIImage imageNamed:@"btn_savehistory_tc"] forState:UIControlStateNormal];
    }
    if([[Language currentLanguage] isEqualToString:@"sc"]){
        [btn_calculate setImage:[UIImage imageNamed:@"btn_calculate_sc"] forState:UIControlStateNormal];
        [btn_saveToHistory setImage:[UIImage imageNamed:@"btn_savehistory_sc"] forState:UIControlStateNormal];
    } // if end
    
    alreadySet = NO;
    calOnce = NO;
    notCal = YES;
    
    // code - add iphone5 support by csa4 - 4.6.2014
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
        
        // 2) handle scrollview y position
        [sv_result setFrame:CGRectMake(0,132,320,290+extra)]; // increase the height of scroll view to allow more rows. (extra)
        // debug
        tag = sv_result.tag;
        h = sv_result.frame.size.height;
        y = sv_result.frame.origin.y;
        NSString *b = [[NSString alloc] initWithFormat:@"ScrollView tag%ld, y=%d, h=%d", (long)tag, y, h ];
        NSLog(@"--- %@", b);
        [b release];
        
        [btn_calculate setFrame:CGRectMake(61,437+extra, 198,35)];      // increase the y position of btn_calculate by 88
        [btn_saveToHistory setFrame:CGRectMake(61,437+extra, 198,35)];  // increase the y position of btn_saveToHistory by 88
        
    } else {
        [sv_result setFrame:CGRectMake(0,132,320,290)];
        [btn_calculate setFrame:CGRectMake(61,437, 198,35)];
        [btn_saveToHistory setFrame:CGRectMake(61,437, 198,35)];
    } // if end
    // code - add iphone5 support by csa4 - 4.6.2014

    
    // original code
    [v_intakeResult setHidden:YES];
    
    [bar_low_energy setMinimumTrackImage:[[UIImage imageNamed:@"bar_green"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_low_energy setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_low_energy setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_high_energy setMinimumTrackImage:[[UIImage imageNamed:@"bar_pink"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_high_energy setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_high_energy setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    
    [bar_low_protein setMinimumTrackImage:[[UIImage imageNamed:@"bar_green"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_low_protein setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_low_protein setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_high_protein setMinimumTrackImage:[[UIImage imageNamed:@"bar_pink"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_high_protein setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_high_protein setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    
    [bar_low_totalFat setMinimumTrackImage:[[UIImage imageNamed:@"bar_green"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_low_totalFat setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_low_totalFat setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_high_totalFat setMinimumTrackImage:[[UIImage imageNamed:@"bar_pink"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_high_totalFat setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_high_totalFat setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    
    [bar_low_SatFat  setMinimumTrackImage:[[UIImage imageNamed:@"bar_green"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_low_SatFat setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_low_SatFat setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_high_SatFat setMinimumTrackImage:[[UIImage imageNamed:@"bar_pink"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_high_SatFat setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_high_SatFat setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    
    [bar_low_TransFat setMinimumTrackImage:[[UIImage imageNamed:@"bar_green"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_low_TransFat setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_low_TransFat setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_high_TransFat setMinimumTrackImage:[[UIImage imageNamed:@"bar_pink"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_high_TransFat setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_high_TransFat setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    
    //
    [bar_low_cho setMinimumTrackImage:[[UIImage imageNamed:@"bar_green"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_low_cho setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_low_cho setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_high_cho setMinimumTrackImage:[[UIImage imageNamed:@"bar_pink"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_high_cho setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_high_cho setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    //
    [bar_low_Car setMinimumTrackImage:[[UIImage imageNamed:@"bar_green"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_low_Car setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_low_Car setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_high_Car setMinimumTrackImage:[[UIImage imageNamed:@"bar_pink"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_high_Car setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_high_Car setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    
    [bar_low_Fibre setMinimumTrackImage:[[UIImage imageNamed:@"bar_green"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_low_Fibre setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_low_Fibre setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_high_Fibre setMinimumTrackImage:[[UIImage imageNamed:@"bar_pink"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_high_Fibre setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_high_Fibre setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    
    [bar_low_Sodium setMinimumTrackImage:[[UIImage imageNamed:@"bar_green"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_low_Sodium setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_low_Sodium setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_high_Sodium setMinimumTrackImage:[[UIImage imageNamed:@"bar_pink"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_high_Sodium setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_high_Sodium setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    
    [bar_low_Sugar setMinimumTrackImage:[[UIImage imageNamed:@"bar_green"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_low_Sugar setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_low_Sugar setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_high_Sugar setMinimumTrackImage:[[UIImage imageNamed:@"bar_pink"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_high_Sugar setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_high_Sugar setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    
    NSString *view2 = [Language getText:@"my_intake"];
//    @"My Intake";
    NSString *isHidden = @"NO";
    NSString *buttonMode = @"home";
	NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
    [lbl_name setText:mainController.currentProfile.userName];
    [lbl_kcal setText: [NSString stringWithFormat:@"%d %@", [mainController.currentProfile energyReq], [Language getText:@"kcal"]]];
//    [lbl_kcal setText:[NSString stringWithFormat:@"%i", [[mainController.currentProfile getIntakeList] count]]];
    
    inputFieldArr = [[NSMutableArray alloc]init];
    foodNameArr = [[NSMutableArray alloc]init];
    weightTypeArr = [[NSMutableArray alloc]init];
    starArr = [[NSMutableArray alloc]init];
    sortedIntakeList = [[NSMutableArray alloc]init];
    
    NSMutableArray *tmpDictArr = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < [[mainController.currentProfile getIntakeList] count]; i++) {
        for(int j = 0; j < [[Tool getProfileFoodList]count]; j++){
            if([[[Tool getProfileFoodList] objectAtIndex:j] foodID] == [[[mainController.currentProfile getIntakeList]objectAtIndex:i] intValue]){
                NSDictionary *tmpDict = [NSDictionary dictionaryWithObjectsAndKeys:[[mainController.currentProfile getIntakeList]objectAtIndex:i], @"foodIndex", [[[Tool getProfileFoodList] objectAtIndex:j] name], @"foodName", nil];
                [tmpDictArr addObject:tmpDict];
            }
        }
    }
    
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"foodName"  ascending:YES];
    [tmpDictArr sortUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
    
    for (int i = 0; i<[tmpDictArr count]; i++) {
        NSLog(@"%@", [tmpDictArr objectAtIndex:i]);
        [sortedIntakeList addObject:[[tmpDictArr objectAtIndex:i]objectForKey:@"foodIndex"]];
    }
    
    [tmpDictArr release];
    
    
    if([[mainController.currentProfile getIntakeList] count] != 0){
        [tv_warning setHidden:YES];
        [v_input setFrame:CGRectMake(0, v_input.frame.origin.y, v_input.frame.size.width, v_input.frame.size.height + [[mainController.currentProfile getIntakeList] count]*30)];
        
        for (int i = 0; i < [[mainController.currentProfile getIntakeList] count]; i++) {
            UILabel *lbl_foodName = [[UILabel alloc]initWithFrame:CGRectMake(5, 44 + i * 30 , 120, 30)];
            for(int j = 0; j < [[Tool getProfileFoodList]count]; j++){
                if([[[Tool getProfileFoodList] objectAtIndex:j] foodID] == [[sortedIntakeList objectAtIndex:i] intValue]){
                    [lbl_foodName setText:[[[Tool getProfileFoodList] objectAtIndex:j] name]];
                    [foodNameArr addObject:lbl_foodName.text];
                    [lbl_foodName setTextColor:lbl_name.textColor];
                    [lbl_foodName setBackgroundColor:[UIColor clearColor]];
                    [lbl_foodName setFont:[UIFont systemFontOfSize:13]];
                }
            }
            UILabel *lbl_star = [[UILabel alloc]initWithFrame:CGRectMake(130, 44+ i * 30 + 3, 20, 20)];
            [lbl_star setTag:[[[mainController.currentProfile getIntakeList]objectAtIndex:i] intValue]];
            [lbl_star setTextColor:[UIColor redColor]];
            [lbl_star setBackgroundColor:[UIColor clearColor]];
            [lbl_star setText:@"*"];
            [lbl_star setHidden:YES];
            [lbl_star setBackgroundColor:[UIColor clearColor]];
            [starArr addObject:lbl_star];
            
            UITextField *tf_amount = [[UITextField alloc]initWithFrame:CGRectMake(137, 44+ i * 30 + 3, 60, 24)];
            [tf_amount setBackground:[UIImage imageNamed:@"txtfield_food.png"]];
            [tf_amount setTag:[[sortedIntakeList objectAtIndex:i] intValue]];
            [tf_amount setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
            [tf_amount setDelegate:self];
            tf_amount.returnKeyType = UIReturnKeyDone;
            [inputFieldArr addObject:tf_amount];
            
            UILabel *lbl_g = [[UILabel alloc]initWithFrame:CGRectMake(200, 44 + i * 30 +3 , 70, 24)];
            [lbl_g setText:[NSString stringWithFormat:@"%@/%@", [Language getText:@"g"], [Language getText:@"ml"]]];
            [lbl_g setTextColor:lbl_name.textColor];
            [lbl_g setFont:[UIFont systemFontOfSize:13.0]];
            [lbl_g setBackgroundColor:[UIColor clearColor]];
            
            UILabel *lbl_packType = [[UILabel alloc]initWithFrame:CGRectMake(245, 44 + i * 30 +3 , 70, 24)];
            for(int j = 0; j < [[Tool getProfileFoodList]count]; j++){
                if([[[Tool getProfileFoodList] objectAtIndex:j] foodID] == [[sortedIntakeList objectAtIndex:i] intValue]){
                    Food *food = [[Tool getProfileFoodList] objectAtIndex:j];
                    if([food type] == PER100GML){
                        [lbl_packType setText:[NSString stringWithFormat:@"100%@/%@", [Language getText:@"g"], [Language getText:@"ml"]]];
                    }else{
                        if([[[Tool getProfileFoodList] objectAtIndex:j] weight] == (int)[[[Tool getProfileFoodList] objectAtIndex:j] weight]){
                            [lbl_packType setText:[NSString stringWithFormat:@"%.f%@/%@", [[[Tool getProfileFoodList] objectAtIndex:j] weight], [Language getText:@"g"], [Language getText:@"ml"]]];
                        }
                        else{
                            [lbl_packType setText:[NSString stringWithFormat:@"%.1f%@/%@", [[[Tool getProfileFoodList] objectAtIndex:j] weight], [Language getText:@"g"], [Language getText:@"ml"]]];
                        }
                        
                    }
                    NSString *tmpPackType = lbl_packType.text;
                    NSString *tmpReplace = [NSString stringWithFormat:@"%@/%@", [Language getText:@"g"], [Language getText:@"ml"]];
                    tmpPackType = [tmpPackType stringByReplacingOccurrencesOfString:tmpReplace withString:@""];
                    [weightTypeArr addObject:tmpPackType];
                    [lbl_packType setTextColor:lbl_name.textColor];
                    [lbl_packType setTextAlignment:NSTextAlignmentCenter];
                    [lbl_packType setFont:[UIFont systemFontOfSize:13.0]];
                    [lbl_packType setBackgroundColor:[UIColor clearColor]];
                }
            }
            
            [sv_result addSubview:lbl_foodName];
            [v_input addSubview:tf_amount];
            [sv_result addSubview:lbl_g];
            [sv_result addSubview:lbl_packType];
            [sv_result addSubview:lbl_star];
            [lbl_foodName release];
            [tf_amount release];
            [lbl_g release];
            [lbl_star release];
            UIImageView *whiteArrow = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"intake_list_end.png"]];
            [whiteArrow setFrame:CGRectMake(0, v_input.frame.origin.y + v_input.frame.size.height, 320, 17)];
            [sv_result addSubview:whiteArrow];
            [whiteArrow release];
//            [btn_calculate setFrame:CGRectMake(btn_calculate.frame.origin.x, whiteArrow.frame.origin.y + 37, 133, 35)];
            [sv_result setScrollEnabled:YES];
            [sv_result setDelegate:self];
//            [sv_result setContentSize:CGSizeMake(320, 863)];
        }
        [sv_result setContentSize:CGSizeMake(320,  v_input.frame.size.height + 40)];
        oldSize = sv_result.contentSize;
        
    } else { // if the input food count is zero.
        [v_input setHidden:YES];
        [btn_calculate setEnabled:NO];
    } // if the input food count is zero.

}

- (void) initWithProfile:(Profile*) profile
{
    
    if (currentProfile != nil)
    {
        [currentProfile release];
        currentProfile = nil;
    }
    currentProfile = [[Profile alloc] initWithProfile:profile];
    
    UIImage *user_pic = profile.profile_pic;
    
    if(user_pic != NULL){
        [profile_pic setImage:user_pic];
    }
    else{
        [profile_pic setImage:[UIImage imageNamed:@"userpic_default"]];
    }
}

- (void)viewDidUnload
{
    [self setLbl_name:nil];
    [self setLbl_kcal:nil];
    [self setTv_warning:nil];
    [self setSv_result:nil];
    [self setV_input:nil];
    [self setBtn_calculate:nil];
    [self setSv_result:nil];
    [self setV_intakeResult:nil];
    [self setBar_low_energy:nil];
    [self setBar_high_energy:nil];
    [self setBar_low_protein:nil];
    [self setBar_high_protein:nil];
    [self setBar_low_totalFat:nil];
    [self setBar_high_totalFat:nil];
    [self setBar_low_SatFat:nil];
    [self setBar_high_SatFat:nil];
    [self setBar_low_TransFat:nil];
    [self setBar_high_TransFat:nil];
    [self setBar_low_Car:nil];
    [self setBar_high_Car:nil];
    [self setBar_low_Fibre:nil];
    [self setBar_high_Fibre:nil];
    [self setBar_low_Sodium:nil];
    [self setBar_high_Sodium:nil];
    [self setBar_low_cho:nil];
    [self setBar_high_cho:nil];
    [self setBar_low_Sugar:nil];
    [self setBar_high_Sugar:nil];
    [self setLbl_result_energy:nil];
    [self setLbl_result_energy_percent:nil];
    [self setLbl_result_protein:nil];
    [self setLbl_result_protein_percent:nil];
    [self setLbl_result_TotalFat:nil];
    [self setLbl_result_TotalFat_percent:nil];
    [self setLbl_result_SatFat:nil];
    [self setLbl_result_SatFat_percent:nil];
    [self setLbl_result_TransFat:nil];
    [self setLbl_result_TransFat_percent:nil];
    [self setLbl_result_cho:nil];
    [self setLbl_result_cho_percent:nil];
    [self setLbl_result_Car:nil];
    [self setLbl_result_Car_percent:nil];
    [self setLbl_result_Fibre:nil];
    [self setLbl_result_Fibre_percent:nil];
    [self setLbl_result_Sodium:nil];
    [self setLbl_result_Sodium_percent:nil];
    [self setLbl_result_Sugar:nil];
    [self setLbl_result_Sugar_percent:nil];
    [self setBtn_saveToHistory:nil];
    [self setLbl_dailyEnergy:nil];
    [self setLbl_totalEnergyAndNutrient:nil];
    [self setLbl_dailyLimit:nil];
    [self setLbl_energy:nil];
    [self setLbl_protein:nil];
    [self setLbl_totalFat:nil];
    [self setLbl_SatFat:nil];
    [self setLbl_transFat:nil];
    [self setLbl_car:nil];
    [self setLbl_cholesterol:nil];
    [self setLbl_fibre:nil];
    [self setLbl_sugar:nil];
    [self setLbl_sodium:nil];
    [self setLbl_nu:nil];
    [self setLbl_consumed:nil];
    [self setLbl_nu_info:nil];
    [self setLbl_food_title:nil];
    [profile_pic release];
    profile_pic = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *temp = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([temp length] >0){
        NSInteger dot = [textField.text rangeOfString:@"."].location;
        
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

-(void)textFieldDidBeginEditing:(UITextField *)textField{
//    [sv_result setContentSize:oldSize];
//    [sv_result setContentOffset:CGPointMake(0, 0)];
    
//    [sv_result setContentSize:CGSizeMake(320, sv_result.contentSize.height + [inputFieldArr count] * 30)];
//    if(notCal){
//        [sv_result setContentSize:CGSizeMake(320, [[inputFieldArr lastObject] frame].origin.y+225)];
//    }else{
//        [sv_result setContentSize:oldSize];
//    }
    [sv_result setContentOffset:CGPointMake(0, textField.frame.origin.y)];
//    [sv_result setContentSize:CGSizeMake(320,  v_input.frame.size.height + 40)];
    
//    if([inputFieldArr indexOfObject:textField] >=5){
//        [sv_result setContentOffset:CGPointMake(0, textField.frame.origin.y - (15*[inputFieldArr indexOfObject:textField]-4))];
//    }
//    else{
        
//    }
    
    if(sv_result.contentSize.height < (480)){
//        [sv_result setContentSize:CGSizeMake(320, 480)];
    } //if end
    
    nowEditingField = textField;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if(notCal == NO || calOnce == YES){
        BOOL isOK = YES;
        for(int i = 0; i < [inputFieldArr count]; i++){
            if([[[[inputFieldArr objectAtIndex:i] text]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0){
                isOK = NO;
                [[inputFieldArr objectAtIndex:i]setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
                [[starArr objectAtIndex:i]setHidden:NO];
            }
            else{
                [[inputFieldArr objectAtIndex:i]setBackground:[UIImage imageNamed:@"txtfield_food.png"]];
                [[starArr objectAtIndex:i]setHidden:YES];
            }
        }
        if(isOK){
            [self calResult];
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    [sv_result setContentSize:oldSize];
    [sv_result setContentOffset:CGPointMake(0, v_intakeResult.frame.origin.y)];
    return YES;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)setMode:(int)mode{
    
}

- (void)calResult{
    totalEnergy = 0;
    totalProtein = 0;
    totalFat = 0;
    totalSatFat = 0;
    totalTranFat = 0;
    totalCho = 0;
    totalCar = 0;
    totalFibre = 0;
    totalSodium = 0;
    totalSugar = 0;
    overTake = NO;
    
    for(int i = 0; i < [[mainController.currentProfile getIntakeList] count]; i++){
        for(int j = 0; j < [[Tool getProfileFoodList] count]; j++){
            if([[sortedIntakeList objectAtIndex:i]intValue] == [[[Tool getProfileFoodList]objectAtIndex:j] foodID]){
                float multi = 0;
                float tmpEnergy = [[[Tool getProfileFoodList]objectAtIndex:j] energy];
                float tmpProtein = [[[Tool getProfileFoodList]objectAtIndex:j] protein];
                float tmpTotalFat = [[[Tool getProfileFoodList]objectAtIndex:j] totalFat];
                float tmpSatFat = [[[Tool getProfileFoodList]objectAtIndex:j] saturatedFat];
                float tmpTransFat = [[[Tool getProfileFoodList]objectAtIndex:j] transFat];
                float tmpCho = [[[Tool getProfileFoodList]objectAtIndex:j] cholesterol];
                float tmpCar = [[[Tool getProfileFoodList]objectAtIndex:j] carbohydrates];
                float tmpFibre = [[[Tool getProfileFoodList]objectAtIndex:j] dietaryFibre];
                float tmpSugar = [[[Tool getProfileFoodList]objectAtIndex:j] sugars];
                float tmpSodium = [[[Tool getProfileFoodList]objectAtIndex:j] sodium];
                
                if(tmpEnergy < 0)tmpEnergy = 0;
                if(tmpProtein < 0)tmpProtein = 0;
                if(tmpTotalFat < 0)tmpTotalFat = 0;
                if(tmpSatFat < 0)tmpSatFat = 0;
                if(tmpTransFat < 0)tmpTransFat = 0;
                if(tmpCho < 0)tmpCho = 0;
                if(tmpCar < 0)tmpCar = 0;
                if(tmpFibre < 0)tmpFibre = 0;
                if(tmpSugar < 0)tmpSugar = 0;
                if(tmpSodium < 0)tmpSodium = 0;
                
                for(int k = 0; k< [inputFieldArr count]; k++){
                    if([[inputFieldArr objectAtIndex:k] tag] == [[sortedIntakeList objectAtIndex:i] intValue]){
                        multi = [[[inputFieldArr objectAtIndex:k] text] floatValue] / [[[Tool getProfileFoodList]objectAtIndex:j] weight];
                    }
                }
                if([[[Tool getProfileFoodList]objectAtIndex:j] energyType] == KJ){
                    totalEnergy += [NuFormula KjToKcal:tmpEnergy] * multi;
                }else{
                    totalEnergy += tmpEnergy * multi;
                }
                totalProtein += tmpProtein * multi;
                totalFat += tmpTotalFat * multi;
                totalSatFat += tmpSatFat * multi;
                totalTranFat += tmpTransFat * multi;
                totalCho += tmpCho * multi;
                if(tmpCar == 0){
                    
                }
                else if([[[Tool getProfileFoodList]objectAtIndex:j] carbohydratesType] == TOTALCARBOHYDRATES){
                    totalCar += ((tmpCar - tmpFibre) * multi);
                }
                else{
                    totalCar += tmpCar * multi;
                }
                totalFibre += tmpFibre * multi;
                totalSodium += tmpSodium * multi;
                totalSugar += tmpSugar * multi;
            }
        }
    }
    
    NSLog(@"total Energy  = %f", totalEnergy);
    
    
    if([mainController.currentProfile energyReq] < totalEnergy){
        [bar_low_energy setValue:100];
        if ([mainController.currentProfile energyReq] > 0)
            [bar_high_energy setValue:((totalEnergy/[mainController.currentProfile energyReq])-1) * 100];
        else
            [bar_high_energy setValue:0];
        overTake = YES;
        [lbl_result_energy setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
        [lbl_result_energy_percent setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
    }
    else{
        if ([mainController.currentProfile energyReq] > 0)
            [bar_low_energy setValue:totalEnergy/[mainController.currentProfile energyReq] * 100];
        else
            [bar_low_energy setValue:0];
        [bar_high_energy setValue:0];
        [lbl_result_energy setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
        [lbl_result_energy_percent setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
    }
    [lbl_result_energy setText:[NSString stringWithFormat:@"%.02f %@",totalEnergy, [Language getText:@"kcal"]]];
    if ([mainController.currentProfile energyReq] > 0)
        [lbl_result_energy_percent setText:[NSString stringWithFormat:@"%.f%%",totalEnergy/[mainController.currentProfile energyReq] * 100]];
    else
        [lbl_result_energy_percent setText:@"0%"];
    
    if([NuFormula calProteinIntake:mainController.currentProfile] < totalProtein){
        [bar_low_protein setValue:100];
        if ([NuFormula calProteinIntake:mainController.currentProfile] > 0)
            [bar_high_protein setValue:((totalProtein/[NuFormula calProteinIntake:mainController.currentProfile])-1) * 100];
        else
            [bar_high_protein setValue:0];
        overTake = YES;
        [lbl_result_protein setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
        [lbl_result_protein_percent setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
    }
    else{
        if ([NuFormula calProteinIntake:mainController.currentProfile] > 0)
            [bar_low_protein setValue:totalProtein/[NuFormula calProteinIntake:mainController.currentProfile] * 100];
        else
            [bar_low_protein setValue:0];
        [bar_high_protein setValue:0];
        [lbl_result_protein setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
        [lbl_result_protein_percent setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
    }
    [lbl_result_protein setText:[NSString stringWithFormat:@"%.02f%@",totalProtein,[Language getText:@"g"]]];
        if([NuFormula calProteinIntake:mainController.currentProfile] > 0){
            [lbl_result_protein_percent setText:[NSString stringWithFormat:@"%.f%%",totalProtein/[NuFormula calProteinIntake:mainController.currentProfile] * 100]];
        }
        else{
            [lbl_result_protein_percent setText:@"0%"];
        }
    
    if([NuFormula calTotalFatIntake:mainController.currentProfile] < totalFat){
        [bar_low_totalFat setValue:100];
        
        if([NuFormula calTotalFatIntake:mainController.currentProfile] > 0){
        [bar_high_totalFat setValue:((totalFat/[NuFormula calTotalFatIntake:mainController.currentProfile])-1) * 100];
        }
        else {
            [bar_high_totalFat setValue:0];
        }
        overTake = YES;
        [lbl_result_TotalFat setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
        [lbl_result_TotalFat_percent setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
    }
    else{
         if([NuFormula calTotalFatIntake:mainController.currentProfile] > 0){
        [bar_low_totalFat setValue:totalFat/[NuFormula calTotalFatIntake:mainController.currentProfile] * 100];
         }
        else
        [bar_high_totalFat setValue:0];
        [lbl_result_TotalFat setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
        [lbl_result_TotalFat_percent setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
    }
    [lbl_result_TotalFat setText:[NSString stringWithFormat:@"%.02f%@",totalFat,[Language getText:@"g"]]];
    if([NuFormula calTotalFatIntake:mainController.currentProfile] >0){
    [lbl_result_TotalFat_percent setText:[NSString stringWithFormat:@"%.f%%",totalFat/[NuFormula calTotalFatIntake:mainController.currentProfile] * 100]];
    }
    else{
        [lbl_result_TotalFat_percent setText:@"0%"];
    }
    
    if([NuFormula calSatFatIntake:mainController.currentProfile] < totalSatFat){
        [bar_low_SatFat setValue:100];
        if([NuFormula calSatFatIntake:mainController.currentProfile] > 0){
        [bar_high_SatFat setValue:((totalSatFat/[NuFormula calSatFatIntake:mainController.currentProfile])-1) * 100];
        }
        else{
            [bar_high_SatFat setValue:0];
        }
        overTake = YES;
        [lbl_result_SatFat setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
        [lbl_result_SatFat_percent setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
    }
    else{
        if([NuFormula calSatFatIntake:mainController.currentProfile] > 0){
        [bar_low_SatFat setValue:totalSatFat/[NuFormula calSatFatIntake:mainController.currentProfile] * 100];
        }
        else
        [bar_high_SatFat setValue:0];
        [lbl_result_SatFat setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
        [lbl_result_SatFat_percent setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
    }
    
    [lbl_result_SatFat setText:[NSString stringWithFormat:@"%.02f%@",totalSatFat,[Language getText:@"g"]]];
    if([NuFormula calSatFatIntake:mainController.currentProfile]){
    [lbl_result_SatFat_percent setText:[NSString stringWithFormat:@"%.f%%",totalSatFat/[NuFormula calSatFatIntake:mainController.currentProfile] * 100]];
    }
    else{
        [lbl_result_SatFat_percent setText:@"0%"];
    }
    
    
    if([NuFormula calTranFatIntake:mainController.currentProfile] < totalTranFat){
        [bar_low_TransFat setValue:100];
        if([NuFormula calTranFatIntake:mainController.currentProfile] > 0){
        [bar_high_TransFat setValue:((totalTranFat/[NuFormula calTranFatIntake:mainController.currentProfile])-1) * 100];
        }
        else{
            [bar_high_TransFat setValue:0];
        }
        overTake = YES;
        [lbl_result_TransFat setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
        [lbl_result_TransFat_percent setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
    }
    else{
        if([NuFormula calTranFatIntake:mainController.currentProfile] > 0){
        [bar_low_TransFat setValue:totalTranFat/[NuFormula calTranFatIntake:mainController.currentProfile] * 100];
        }
        else
        [bar_high_TransFat setValue:0];
        [lbl_result_TransFat setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
        [lbl_result_TransFat_percent setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
    }
    [lbl_result_TransFat setText:[NSString stringWithFormat:@"%.02f%@",totalTranFat, [Language getText:@"g"]]];
    if([NuFormula calTranFatIntake:mainController.currentProfile] > 0){
    [lbl_result_TransFat_percent setText:[NSString stringWithFormat:@"%.f%%",totalTranFat/[NuFormula calTranFatIntake:mainController.currentProfile] * 100]];
    }
    else{
        [lbl_result_TransFat_percent setText:@"0%"];
    }

    //cal cho
    if([NuFormula calCholesterolIntake] < totalCho){
        [bar_low_cho setValue:100];
        if([NuFormula calCholesterolIntake] > 0){
            [bar_high_cho setValue:((totalCho/[NuFormula calCholesterolIntake])-1) * 100];
        }
        else{
            [bar_high_cho setValue:0];
        }
        overTake = YES;
        [lbl_result_cho setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
        [lbl_result_cho_percent setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
    }
    else{
        if([NuFormula calCholesterolIntake] > 0){
            [bar_low_cho setValue:totalCho/[NuFormula calCholesterolIntake] * 100];
        }
        else
            [bar_high_cho setValue:0];
        [lbl_result_cho setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
        [lbl_result_cho_percent setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
    }
    [lbl_result_cho setText:[NSString stringWithFormat:@"%.02f%@",totalCho,[Language getText:@"mg"]]];
    if([NuFormula calCholesterolIntake]>0){
        [lbl_result_cho_percent setText:[NSString stringWithFormat:@"%.f%%",totalCho/[NuFormula calCholesterolIntake] * 100]];
    }
    else{
        [lbl_result_cho_percent setText:@"0%"];
    }

    
    if([NuFormula calCarbohydratesIntake:mainController.currentProfile] < totalCar){
        [bar_low_Car setValue:100];
        if([NuFormula calCarbohydratesIntake:mainController.currentProfile] > 0){
        [bar_high_Car setValue:((totalCar/[NuFormula calCarbohydratesIntake:mainController.currentProfile])-1) * 100];
        }
        else{
            [bar_high_Car setValue:0];
        }
        overTake = YES;
        [lbl_result_Car setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
        [lbl_result_Car_percent setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
    }
    else{
        if([NuFormula calCarbohydratesIntake:mainController.currentProfile] > 0){
        [bar_low_Car setValue:totalCar/[NuFormula calCarbohydratesIntake:mainController.currentProfile] * 100];
        }
        else
        [bar_high_Car setValue:0];
        [lbl_result_Car setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
        [lbl_result_Car_percent setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
    }
        [lbl_result_Car setText:[NSString stringWithFormat:@"%.02f%@",totalCar,[Language getText:@"g"]]];
        if([NuFormula calCarbohydratesIntake:mainController.currentProfile] > 0){
        [lbl_result_Car_percent setText:[NSString stringWithFormat:@"%.f%%",totalCar/[NuFormula calCarbohydratesIntake:mainController.currentProfile] * 100]];
        }
        else{
            [lbl_result_Car_percent setText:@"0%"];
        }
    
    if([NuFormula calFibreIntake] < totalFibre){
        [bar_low_Fibre setValue:100];
        if([NuFormula calFibreIntake] >0){
        [bar_high_Fibre setValue:((totalFibre/[NuFormula calFibreIntake])-1) * 100];
        }
        else{
            [bar_high_Fibre setValue:0];
        }
        overTake = YES;
        [lbl_result_Fibre setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
        [lbl_result_Fibre_percent setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
    }
    else{
        if([NuFormula calFibreIntake] >0){
        [bar_low_Fibre setValue:totalFibre/[NuFormula calFibreIntake] * 100];
        }
        else
        [bar_high_Fibre setValue:0];
        [lbl_result_Fibre setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
        [lbl_result_Fibre_percent setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
    }
    [lbl_result_Fibre setText:[NSString stringWithFormat:@"%.02f%@",totalFibre,[Language getText:@"g"]]];
    if([NuFormula calFibreIntake] > 0){
    [lbl_result_Fibre_percent setText:[NSString stringWithFormat:@"%.f%%",totalFibre/[NuFormula calFibreIntake] * 100]];
    }
    else{
        [lbl_result_Fibre_percent setText:@"0%"]; 
    }
        
    if([NuFormula calSodiumIntake] < totalSodium){
        [bar_low_Sodium setValue:100];
        if([NuFormula calSodiumIntake] > 0){
        [bar_high_Sodium setValue:((totalSodium/[NuFormula calSodiumIntake])-1) * 100];
        }
        else{
            [bar_high_Sodium setValue:0];
        }
        overTake = YES;
        [lbl_result_Sodium setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
        [lbl_result_Sodium_percent setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
    }
    else{
        if([NuFormula calSodiumIntake] > 0){
        [bar_low_Sodium setValue:totalSodium/[NuFormula calSodiumIntake] * 100];
        }
        else
        [bar_high_Sodium setValue:0];
        [lbl_result_Sodium setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
        [lbl_result_Sodium_percent setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
    }
    [lbl_result_Sodium setText:[NSString stringWithFormat:@"%.02f%@",totalSodium,[Language getText:@"mg"]]];
    if([NuFormula calSodiumIntake]>0){
    [lbl_result_Sodium_percent setText:[NSString stringWithFormat:@"%.f%%",totalSodium/[NuFormula calSodiumIntake] * 100]];
    }
    else{
        [lbl_result_Sodium_percent setText:@"0%"];
    }
    
    if([NuFormula calSugarIntake:mainController.currentProfile] < totalSugar){
        [bar_low_Sugar setValue:100];
        if([NuFormula calSugarIntake:mainController.currentProfile] >0){
        [bar_high_Sugar setValue:((totalSugar/[NuFormula calSugarIntake:mainController.currentProfile])-1) * 100];
        }
        else{
            [bar_high_Sugar setValue:0];
        }
        overTake = YES;
        [lbl_result_Sugar setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
        [lbl_result_Sugar_percent setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
    }
    else{
        if([NuFormula calSugarIntake:mainController.currentProfile] >0){
        [bar_low_Sugar setValue:totalSugar/[NuFormula calSugarIntake:mainController.currentProfile] * 100];
        }
        else
        [bar_high_Sugar setValue:0];
        [lbl_result_Sugar setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
        [lbl_result_Sugar_percent setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
    }
    [lbl_result_Sugar setText:[NSString stringWithFormat:@"%.02f%@",totalSugar,[Language getText:@"g"]]];
    if([NuFormula calSugarIntake:mainController.currentProfile] > 0){
    [lbl_result_Sugar_percent setText:[NSString stringWithFormat:@"%.f%%",totalSugar/[NuFormula calSugarIntake:mainController.currentProfile] * 100]];
    }
    else{
        [lbl_result_Sugar_percent setText:@"0%"];
    }
     
    if(alreadySet == NO){
        [v_intakeResult setFrame:CGRectMake(0, v_input.frame.size.height, 320, v_intakeResult.frame.size.height)];
    
        [sv_result setContentSize:CGSizeMake(320, v_input.frame.size.height+490 + 55 + 70)];
        oldSize = sv_result.contentSize;
        [v_intakeResult setHidden:NO];
        notCal = NO;
        alreadySet = YES;
        [btn_saveToHistory setHidden:NO];
        [sv_result setContentOffset:CGPointMake(0, v_intakeResult.frame.origin.y)];
    }
}

- (IBAction)buttonPress:(id)sender {
    if(sender == btn_saveToHistory){
        
        if([[mainController.currentProfile getIntakeHistoryList] count] >= 30){
           
//            NuCalAlert *tooManyIntakeAlert = [[NuCalAlert alloc]initWithTitle:nil Subtitle:[Language getText:@"alert_too_many_food"] CancelButtonTitle:[Language getText:@"no"] ButtonTitle:[NSMutableArray arrayWithObject:[Language getText:@"yes"]]];
//            
//            [tooManyIntakeAlert setSubTitleFont:[UIFont systemFontOfSize:16]];
////            [tooManyIntakeAlert setTag:555];
//            [tooManyIntakeAlert show];
//            [tooManyIntakeAlert release];
            NuCalAlert *tooManyIntakeAlert = [[NuCalAlert alloc]initWithTitle:nil Subtitle:[Language getText:@"alert_too_many_food"] CancelButtonTitle:[Language getText:@"no"] ButtonTitle:[NSMutableArray arrayWithObject:[Language getText:@"yes"]]];
            [tooManyIntakeAlert setDelegate:self];
            [tooManyIntakeAlert show];
            [tooManyIntakeAlert release];
        }
        else{
        NSMutableArray *tmpFoodListForIntake = [[NSMutableArray alloc]init];
        for(int i = 0; i < [foodNameArr count]; i++){
            NSDictionary *tmp = [[NSDictionary alloc]initWithObjectsAndKeys:[foodNameArr objectAtIndex:i], @"foodName",
                                 [weightTypeArr objectAtIndex:i], @"weightType",
                                 [[inputFieldArr objectAtIndex:i] text], @"foodAmount", nil];
            NSLog(@"%@", tmp);
            [tmpFoodListForIntake addObject:tmp];
        }
        NSDate *nowTime = [NSDate date];
        
        IntakeHistory *tmpHistoryForSave = [[IntakeHistory alloc]initWithIntakeHistory:nowTime
                                                                                  List:tmpFoodListForIntake
                                                                           TotalEnergy:totalEnergy
                                                                          TotalProtein:totalProtein
                                                                              TotalFat:totalFat
                                                                           TotalSatFat:totalSatFat
                                                                          TotalTranFat:totalTranFat
                                                                              TotalCho:totalCho
                                                                              TotalCar:totalCar
                                                                            TotalFibre:totalFibre
                                                                           TotalSodium:totalSodium
                                                                            TotalSugar:totalSugar
                                                                         EnergyPercent:totalEnergy/[mainController.currentProfile energyReq] * 100
                                                                        ProteinPercent:totalProtein/[NuFormula calProteinIntake:mainController.currentProfile] * 100
                                                                       TotalFatPercent:totalFat/[NuFormula calTotalFatIntake:mainController.currentProfile] * 100
                                                                         SatFatPercent:totalSatFat/[NuFormula calSatFatIntake:mainController.currentProfile] * 100
                                                                        TranFatPercent:totalTranFat/[NuFormula calTranFatIntake:mainController.currentProfile] * 100
                                                                         ChoBarPercent:totalCho
                                                                            CarPercent:totalCar/[NuFormula calCarbohydratesIntake:mainController.currentProfile] * 100
                                                                          FibrePercent:totalFibre/[NuFormula calFibreIntake] * 100
                                                                         SodiumPercent:totalSodium/[NuFormula calSodiumIntake] * 100
                                                                          SugarPercent:totalSugar/[NuFormula calSugarIntake:mainController.currentProfile] * 100 
                                                                              OverTake:overTake EnergyRequired:(int)[mainController.currentProfile energyReq]];
        
        [mainController.currentProfile addIntakeHistory:tmpHistoryForSave];
        [self storeProfile:mainController.currentProfile];
        [tmpHistoryForSave release];
        [tmpFoodListForIntake release];
        
        NSString *view = @"MyIntakeHistory";
        NSString *mode = @"";
        
        NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view",mode, @"mode", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
        }
    }
    if(sender == btn_calculate){
        calOnce = YES;
        BOOL isOK = YES;
        for(int i = 0; i < [inputFieldArr count]; i++){
            if([[[[inputFieldArr objectAtIndex:i] text]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0){
                isOK = NO;
                [[inputFieldArr objectAtIndex:i]setBackground:[UIImage imageNamed:@"txtfield_food_error"]];
                [[starArr objectAtIndex:i]setHidden:NO];
            }
            else{
                [[inputFieldArr objectAtIndex:i]setBackground:[UIImage imageNamed:@"txtfield_food.png"]];
                [[starArr objectAtIndex:i]setHidden:YES];
            }
        }
        if(isOK){
            [self calResult];
        }
        [nowEditingField resignFirstResponder];
    }
}

- (void) storeProfile:(Profile*) profile
{
    [Tool setProfile:profile];
    [mainController reloadCurrentProfile];
}

- (void)NuAlertView:(NuCalAlert *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if(buttonIndex == 0){
            NSString *view = @"MyIntakeHistory";
            NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
    }
    else{
    
    }
}

@end
