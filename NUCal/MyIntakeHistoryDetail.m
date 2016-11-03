//
//  MyIntakeHistoryDetail.m
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyIntakeHistoryDetail.h"
#import "NUCalViewController.h"

@implementation MyIntakeHistoryDetail
@synthesize v_foodInfo;
@synthesize lbl_name;
@synthesize lbl_date;
@synthesize bar_energy_low;
@synthesize bar_energy_high;
@synthesize bar_protein_low;
@synthesize bar_protein_high;
@synthesize bar_totalFat_low;
@synthesize bar_totalFat_high;
@synthesize bar_satFat_low;
@synthesize bar_satFat_high;
@synthesize bar_transFat_low;
@synthesize bar_transFat_high;
@synthesize bar_car_low;
@synthesize bar_car_high;
@synthesize bar_fibre_low;
@synthesize bar_fibre_high;
@synthesize bar_sugar_low;
@synthesize bar_sugar_high;
@synthesize bar_sodium_low;
@synthesize bar_sodium_high;
@synthesize lbl_energy_result;
@synthesize lbl_energy_percent;
@synthesize lbl_potein_result;
@synthesize lbl_potein_percent;
@synthesize lbl_totalFat_result;
@synthesize lbl_totalFat_percent;
@synthesize lbl_satFat_result;
@synthesize lbl_satFat_percent;
@synthesize lbl_transFat_result;
@synthesize lbl_transFat_percent;
@synthesize lbl_car_result;
@synthesize lbl_car_percent;
@synthesize lbl_fibre_result;
@synthesize lbl_fibre_percent;
@synthesize lbl_sugar_result;
@synthesize lbl_sugar_percent;
@synthesize lbl_sodium_result;
@synthesize lbl_sodium_percent;
@synthesize sv_result;
@synthesize v_intakeResult;
@synthesize lbl_amountConsumed;
@synthesize lbl_foodRefAmount;
@synthesize lbl_your_intakeHistory;
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
@synthesize lbl_food_title;
@synthesize lbl_nu;
@synthesize lbl_daily;
@synthesize lbl_kcal_unit;
@synthesize lbl_cho_percent;
@synthesize lbl_cho_result;
@synthesize lbl_cholesterol;
@synthesize bar_cho_high;
@synthesize bar_cho_low;
@synthesize user_icon;

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
    [lbl_name release];
    [lbl_date release];
    [bar_energy_low release];
    [bar_energy_high release];
    [bar_protein_low release];
    [bar_protein_high release];
    [bar_totalFat_low release];
    [bar_totalFat_high release];
    [bar_satFat_low release];
    [bar_satFat_high release];
    [bar_transFat_low release];
    [bar_transFat_high release];
    [bar_car_low release];
    [bar_car_high release];
    [bar_fibre_low release];
    [bar_fibre_high release];
    [bar_sugar_low release];
    [bar_sugar_high release];
    [bar_sodium_low release];
    [bar_sodium_high release];
    [lbl_energy_result release];
    [lbl_energy_percent release];
    [lbl_potein_result release];
    [lbl_potein_percent release];
    [lbl_totalFat_result release];
    [lbl_totalFat_percent release];
    [lbl_satFat_result release];
    [lbl_satFat_percent release];
    [lbl_transFat_result release];
    [lbl_transFat_percent release];
    [lbl_car_result release];
    [lbl_car_percent release];
    [lbl_fibre_result release];
    [lbl_fibre_percent release];
    [lbl_sugar_result release];
    [lbl_sugar_percent release];
    [lbl_sodium_result release];
    [lbl_sodium_percent release];
    [sv_result release];
    [v_intakeResult release];
    [v_foodInfo release];
    [lbl_amountConsumed release];
    [lbl_foodRefAmount release];
    [lbl_your_intakeHistory release];
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
    [lbl_food_title release];
    [lbl_nu release];
    [lbl_daily release];
    [lbl_kcal_unit release];
    [lbl_cholesterol release];
    [user_icon release];
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
    
    [self initWithProfile:mainController.currentProfile];
    
    NSString *view2 = [Language getText:@"my_intake_history"];
//    @"My Intake History";
    NSString *isHidden = @"NO";
    NSString *buttonMode = @"back";
    NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backAndAlert:) name:@"backButton" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(homeAndAlert:) name:@"homeAlertButton" object:nil];
    
    [lbl_your_intakeHistory setText:[Language getText:@"my_intake_history_lbl"]];
    [lbl_dailyLimit setText:[Language getText:@"daily_limit"]];
    [lbl_totalEnergyAndNutrient setText:[Language getText:@"total_en_over_intake"]];
    [lbl_energy setText:[Language getText:@"energy"]];
    [lbl_protein setText:[Language getText:@"protein"]];
    [lbl_totalFat setText:[Language getText:@"totalfat"]];
    [lbl_SatFat setText:[Language getText:@"satfat"]];
    [lbl_transFat setText:[Language getText:@"transfat"]];
    [lbl_car setText:[Language getText:@"carbo"]];
    //    [btn_carbohy setTitle:[Language getText:@"carbo"] forState:UIControlStateSelected];
    [lbl_fibre setText:[Language getText:@"fibre"]];
    [lbl_sugar setText:[Language getText:@"sugar"]];
    [lbl_cholesterol setText:[Language getText:@"cholesterol"]];
    [lbl_sodium setText:[Language getText:@"sodium"]];
    [lbl_nu setText:[Language getText:@"nutrient"]];
    [lbl_food_title setText:[Language getText:@"food"]];
    [lbl_amountConsumed setText:[Language getText:@"consumed"]];
    [lbl_foodRefAmount setText:[Language getText:@"nu_fact_info"]];
    [lbl_daily setText:[Language getText:@"daily_energy"]];
    
    [lbl_name setText:[mainController.currentProfile userName]];
    
    [bar_energy_low setMinimumTrackImage:[[UIImage imageNamed:@"bar_green"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_energy_low setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_energy_low setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_energy_high setMinimumTrackImage:[[UIImage imageNamed:@"bar_pink"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_energy_high setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_energy_high setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    
    [bar_protein_low setMinimumTrackImage:[[UIImage imageNamed:@"bar_green"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_protein_low setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_protein_low setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_protein_high setMinimumTrackImage:[[UIImage imageNamed:@"bar_pink"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_protein_high setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_protein_high setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    
    [bar_totalFat_low setMinimumTrackImage:[[UIImage imageNamed:@"bar_green"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_totalFat_low setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_totalFat_low setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_totalFat_high setMinimumTrackImage:[[UIImage imageNamed:@"bar_pink"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_totalFat_high setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_totalFat_high setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    
    [bar_satFat_low  setMinimumTrackImage:[[UIImage imageNamed:@"bar_green"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_satFat_low setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_satFat_low setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_satFat_high setMinimumTrackImage:[[UIImage imageNamed:@"bar_pink"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_satFat_high setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_satFat_high setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    
    [bar_transFat_low setMinimumTrackImage:[[UIImage imageNamed:@"bar_green"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_transFat_low setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_transFat_low setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_transFat_high setMinimumTrackImage:[[UIImage imageNamed:@"bar_pink"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_transFat_high setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_transFat_high setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    
    [bar_car_low setMinimumTrackImage:[[UIImage imageNamed:@"bar_green"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_car_low setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_car_low setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_car_high setMinimumTrackImage:[[UIImage imageNamed:@"bar_pink"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_car_high setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_car_high setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    
    [bar_fibre_low setMinimumTrackImage:[[UIImage imageNamed:@"bar_green"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_fibre_low setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_fibre_low setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_fibre_high setMinimumTrackImage:[[UIImage imageNamed:@"bar_pink"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_fibre_high setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_fibre_high setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    
    [bar_sodium_low setMinimumTrackImage:[[UIImage imageNamed:@"bar_green"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_sodium_low setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_sodium_low setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_sodium_high setMinimumTrackImage:[[UIImage imageNamed:@"bar_pink"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_sodium_high setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_sodium_high setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    
    [bar_sugar_low setMinimumTrackImage:[[UIImage imageNamed:@"bar_green"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_sugar_low setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_sugar_low setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_sugar_high setMinimumTrackImage:[[UIImage imageNamed:@"bar_pink"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_sugar_high setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_sugar_high setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    
    [bar_cho_low setMinimumTrackImage:[[UIImage imageNamed:@"bar_green"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_cho_low setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_cho_low setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_cho_high setMinimumTrackImage:[[UIImage imageNamed:@"bar_pink"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bar_cho_high setMaximumTrackImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    [bar_cho_high setThumbImage:[UIImage imageNamed:@"blank_pointer.png"] forState:UIControlStateNormal];
    // Do any additional setup after loading the view from its nib.
    
    
    IntakeHistory *history = [[mainController.currentProfile getIntakeHistoryList]objectAtIndex:historyIndex];
    NSMutableArray *foodInfo = [history intakeFoodList];
    [lbl_kcal_unit setText:[NSString stringWithFormat:@"%i %@", (int)history.energyRequired,[Language getText:@"kcal"]]];
    
    NSLog(@"%@", foodInfo);
    
    // code - add iphone5 support by csa4 - 30.5.2014
    if (IS_IPHONE5()) {
        [sv_result setFrame:CGRectMake(0,107, 320,480-107+OFFSET1*2)];
    } else {
        [sv_result setFrame:CGRectMake(0,107, 320,480-107)];
    } // if end
    // [sv_result setFrame:CGRectMake(0,107, 320,373)];
    
    for(int i = 0; i < [foodInfo count]; i++){
        UILabel *lbl_foodName = [[UILabel alloc]initWithFrame:CGRectMake(20, 118 + i * 30 , 128, 30)];
        [lbl_foodName setText:[[foodInfo objectAtIndex:i] objectForKey:@"foodName"]];
        [lbl_foodName setFont:[UIFont systemFontOfSize:13]];
        [lbl_foodName setBackgroundColor:[UIColor clearColor]];
        
        UILabel *lbl_foodAmount = [[UILabel alloc]initWithFrame:CGRectMake(148, 118+ i * 30 + 3, 73, 24)];
        [lbl_foodAmount setText:[NSString stringWithFormat:@"%@%@/%@", [[foodInfo objectAtIndex:i] objectForKey:@"foodAmount"], [Language getText:@"g"], [Language getText:@"ml"]]];
        [lbl_foodAmount setFont:[UIFont systemFontOfSize:13]];
        [lbl_foodAmount setTextAlignment:NSTextAlignmentCenter];
        [lbl_foodAmount setBackgroundColor:[UIColor clearColor]];
        UILabel *lbl_weightType = [[UILabel alloc]initWithFrame:CGRectMake(229, 118+ i * 30 + 3, 91, 24)];
        NSString *tmpWeightType = [[foodInfo objectAtIndex:i] objectForKey:@"weightType"];
//        tmpWeightType = [tmpWeightType stringByReplacingOccurrencesOfString:@"g/ml" withString:[NSString stringWithFormat:@"%@/%@", [Language getText:@"g"], [Language getText:@"ml"]]];
        [lbl_weightType setText:[NSString stringWithFormat:@"%@%@/%@", tmpWeightType, [Language getText:@"g"], [Language getText:@"ml"]]];
        [lbl_weightType setFont:[UIFont systemFontOfSize:13]];
        [lbl_weightType setTextAlignment:NSTextAlignmentCenter];
        [lbl_weightType setBackgroundColor:[UIColor clearColor]];
        
        [sv_result addSubview:lbl_foodName];
        [sv_result addSubview:lbl_foodAmount];
        [sv_result addSubview:lbl_weightType];
        [lbl_foodName release];
        [lbl_foodAmount release];
        [lbl_weightType release];
    }
    
    [v_foodInfo setFrame:CGRectMake(0, v_foodInfo.frame.origin.y, v_foodInfo.frame.size.width, v_foodInfo.frame.size.height + [foodInfo count]*30)];
    
    UIImageView *whiteArrow = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"intake_list_end.png"]];
    [whiteArrow setFrame:CGRectMake(0, v_foodInfo.frame.origin.y + v_foodInfo.frame.size.height, 320, 17)];
    [sv_result addSubview:whiteArrow];
    [whiteArrow release];
    [v_intakeResult setFrame:CGRectMake(0, v_foodInfo.frame.size.height, 320, v_intakeResult.frame.size.height)];
    [sv_result setContentSize:CGSizeMake(320, v_foodInfo.frame.size.height+600)];
    
    
    
    
    
    if(history.energyBarVal > 100){
        [bar_energy_low setValue:100];
        [bar_energy_high setValue:(history.energyBarVal - 100)];
        [lbl_energy_result setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
        [lbl_energy_percent setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
    }
    else{
        [bar_energy_low setValue:history.energyBarVal];
        [lbl_energy_result setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
        [lbl_energy_percent setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
    }
    [lbl_energy_result setText:[NSString stringWithFormat:@"%.02f %@",history.totalEnergy, [Language getText:@"kcal"]]];
    [lbl_energy_percent setText:[NSString stringWithFormat:@"%.f%%",history.energyBarVal]];
    
    if(history.proteinBarVar > 100){
        [bar_protein_low setValue:100];
        [bar_protein_high setValue:(history.proteinBarVar - 100)];
        [lbl_potein_result setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
        [lbl_potein_percent setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
    }
    else{
        [bar_protein_low setValue:history.proteinBarVar];
        [lbl_potein_result setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
        [lbl_potein_percent setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
    }
    [lbl_potein_result setText:[NSString stringWithFormat:@"%.02f%@",history.totalProtein, [Language getText:@"g"]]];
    [lbl_potein_percent setText:[NSString stringWithFormat:@"%.f%%",history.proteinBarVar]];
    
    if(history.totalFatBarVal > 100){
        [bar_totalFat_low setValue:100];
        [bar_totalFat_high setValue:(history.totalFatBarVal - 100)];
        [lbl_totalFat_result setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
        [lbl_totalFat_percent setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
    }
    else{
        [bar_totalFat_low setValue:history.totalFatBarVal];
        [lbl_totalFat_result setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
        [lbl_totalFat_percent setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
    }
    [lbl_totalFat_result setText:[NSString stringWithFormat:@"%.02f%@",history.totalFat,[Language getText:@"g"]]];
    [lbl_totalFat_percent setText:[NSString stringWithFormat:@"%.f%%",history.totalFatBarVal]];
    
    if(history.SatFatBarVal > 100){
        [bar_satFat_low setValue:100];
        [bar_satFat_high setValue:(history.SatFatBarVal - 100)];
        [lbl_satFat_result setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
        [lbl_satFat_percent setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
    }
    else{
        [bar_satFat_low setValue:history.proteinBarVar];
        [lbl_satFat_result setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
        [lbl_satFat_percent setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
    }
    [lbl_satFat_result setText:[NSString stringWithFormat:@"%.02f%@",history.totalSatFat, [Language getText:@"g"]]];
    [lbl_satFat_percent setText:[NSString stringWithFormat:@"%.f%%",history.SatFatBarVal]];
    
    if(history.TranFatBarVal > 100){
        [bar_transFat_low setValue:100];
        [bar_transFat_high setValue:(history.TranFatBarVal - 100)];
        [lbl_transFat_result setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
        [lbl_transFat_percent setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
    }
    else{
        [bar_transFat_low setValue:history.TranFatBarVal];
        [lbl_transFat_result setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
        [lbl_transFat_percent setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
    }
    [lbl_transFat_result setText:[NSString stringWithFormat:@"%.02f%@",history.totalTranFat, [Language getText:@"g"]]];
    [lbl_transFat_percent setText:[NSString stringWithFormat:@"%.f%%",history.TranFatBarVal]];
    
    if(history.choBarVal > 100){
        [bar_cho_low setValue:100];
        [bar_cho_high setValue:(history.choBarVal - 100)];
        
        [lbl_cho_result setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
        [lbl_cho_percent setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
    }
    else{
        [bar_cho_low setValue:history.choBarVal];
        [lbl_cho_result setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
        [lbl_cho_percent setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
    }
    [lbl_cho_result setText:[NSString stringWithFormat:@"%.02f%@",history.totalCho, [Language getText:@"mg"]]];
    [lbl_cho_percent setText:[NSString stringWithFormat:@"%.f%%",history.choBarVal]];
    
    if(history.carBarVal > 100){
        [bar_car_low setValue:100];
        [bar_car_high setValue:(history.carBarVal - 100)];
        [lbl_car_result setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
        [lbl_car_percent setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
    }
    else{
        [bar_car_low setValue:history.carBarVal];
        [lbl_car_result setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
        [lbl_car_percent setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
    }
    [lbl_car_result setText:[NSString stringWithFormat:@"%.02f%@",history.totalCar, [Language getText:@"g"]]];
    [lbl_car_percent setText:[NSString stringWithFormat:@"%.f%%",history.carBarVal]];
    
    if(history.fibreBarValue > 100){
        [bar_fibre_low setValue:100];
        [bar_fibre_high setValue:(history.fibreBarValue - 100)];
        [lbl_fibre_result setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
        [lbl_fibre_percent setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
    }
    else{
        [bar_fibre_low setValue:history.fibreBarValue];
        [lbl_fibre_result setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
        [lbl_fibre_percent setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
    }
    [lbl_fibre_result setText:[NSString stringWithFormat:@"%.02f%@",history.totalFibre, [Language getText:@"g"]]];
    [lbl_fibre_percent setText:[NSString stringWithFormat:@"%.f%%",history.fibreBarValue]];
    
    if(history.sugarBarVal > 100){
        [bar_sugar_low setValue:100];
        [bar_sugar_high setValue:(history.sugarBarVal - 100)];
        [lbl_sugar_result setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
        [lbl_sugar_percent setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
    }
    else{
        [bar_sugar_low setValue:history.sugarBarVal];
        [lbl_sugar_result setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
        [lbl_sugar_percent setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
    }
    [lbl_sugar_result setText:[NSString stringWithFormat:@"%.02f%@",history.totalSugar, [Language getText:@"g"]]];
    [lbl_sugar_percent setText:[NSString stringWithFormat:@"%.f%%",history.sugarBarVal]];
    
    if(history.sodiumBarVal > 100){
        [bar_sodium_low setValue:100];
        [bar_sodium_high setValue:(history.sodiumBarVal - 100)];
        [lbl_sodium_result setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
        [lbl_sodium_percent
         setTextColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
    }
    else{
        [bar_sodium_low setValue:history.sodiumBarVal];
        [lbl_sodium_result setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
        [lbl_sodium_percent setTextColor:[UIColor colorWithRed:64/255.0 green:147/255.0 blue:53/255.0 alpha:1]];
    }
    [lbl_sodium_result setText:[NSString stringWithFormat:@"%.02f%@",history.totalSodium, [Language getText:@"mg"]]];
    [lbl_sodium_percent setText:[NSString stringWithFormat:@"%.f%%",history.sodiumBarVal]];
    
    NSDate *cellData = [history intakeDate];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    NSLocale *locale;
    if([[Language currentLanguage] isEqualToString: @"en"]){
        locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        [formatter setDateFormat:@"yyyy MMM dd 'at' hh:mm a"];
    }
    else if([[Language currentLanguage] isEqualToString: @"zh"]){
        locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh-Hant"];
        [formatter setDateFormat:@"yyyy年MMMdd日 a hh:mm"];
    }
    else if([[Language currentLanguage] isEqualToString: @"sc"]){
        locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh-Hans"];
        [formatter setDateFormat:@"yyyy年MMMdd日 a hh:mm"];
    }
    
    
    [formatter setLocale:locale];
    
    NSString *dateStr = [formatter stringFromDate:cellData];
//    NSString *dateStr = @"2222 Mar 88 at 22:22 PM";
    [lbl_date setText:dateStr];
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
        [user_icon setImage:user_pic];
    }
    else{
        [user_icon setImage:[UIImage imageNamed:@"userpic_default"]];
    }
}

- (void)viewDidUnload
{
    [self setLbl_name:nil];
    [self setLbl_date:nil];
    [self setBar_energy_low:nil];
    [self setBar_energy_high:nil];
    [self setBar_protein_low:nil];
    [self setBar_protein_high:nil];
    [self setBar_totalFat_low:nil];
    [self setBar_totalFat_high:nil];
    [self setBar_satFat_low:nil];
    [self setBar_satFat_high:nil];
    [self setBar_transFat_low:nil];
    [self setBar_transFat_high:nil];
    [self setBar_car_low:nil];
    [self setBar_car_high:nil];
    [self setBar_fibre_low:nil];
    [self setBar_fibre_high:nil];
    [self setBar_sugar_low:nil];
    [self setBar_sugar_high:nil];
    [self setBar_sodium_low:nil];
    [self setBar_sodium_high:nil];
    [self setLbl_energy_result:nil];
    [self setLbl_energy_percent:nil];
    [self setLbl_potein_result:nil];
    [self setLbl_potein_percent:nil];
    [self setLbl_totalFat_result:nil];
    [self setLbl_totalFat_percent:nil];
    [self setLbl_satFat_result:nil];
    [self setLbl_satFat_percent:nil];
    [self setLbl_transFat_result:nil];
    [self setLbl_transFat_percent:nil];
    [self setLbl_car_result:nil];
    [self setLbl_car_percent:nil];
    [self setLbl_fibre_result:nil];
    [self setLbl_fibre_percent:nil];
    [self setLbl_sugar_result:nil];
    [self setLbl_sugar_percent:nil];
    [self setLbl_sodium_result:nil];
    [self setLbl_sodium_percent:nil];
    [self setSv_result:nil];
    [self setV_intakeResult:nil];
    [self setV_foodInfo:nil];
    [self setLbl_amountConsumed:nil];
    [self setLbl_foodRefAmount:nil];
    [self setLbl_your_intakeHistory:nil];
    [self setLbl_totalEnergyAndNutrient:nil];
    [self setLbl_dailyLimit:nil];
    [self setLbl_energy:nil];
    [self setLbl_protein:nil];
    [self setLbl_totalFat:nil];
    [self setLbl_SatFat:nil];
    [self setLbl_transFat:nil];
    [self setLbl_car:nil];
    [self setLbl_fibre:nil];
    [self setLbl_sugar:nil];
    [self setLbl_sodium:nil];
    [self setLbl_food_title:nil];
    [self setLbl_nu:nil];
    [self setLbl_daily:nil];
    [self setLbl_kcal_unit:nil];
    [lbl_cholesterol release];
    lbl_cholesterol = nil;
    [user_icon release];
    user_icon = nil;
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
    NSLog(@"History mode %i", mode);
    historyIndex = mode;

}

- (void)backAndAlert:(NSNotification *)notification{
    NSString *view = @"MyIntakeHistory";
    NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
}

- (void)homeAndAlert:(NSNotification *)notification{
    NSString *view = @"Menu";
    NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
}

@end
