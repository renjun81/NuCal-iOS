//
//  FoodList.m
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FoodList.h"
#import "NUCalViewController.h"

@implementation FoodList
@synthesize sb_food;
@synthesize btn_myIntake;
@synthesize tv_food;
@synthesize lbl_name;
@synthesize lbl_selectFood;
@synthesize lbl_detail;
@synthesize mSession;

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
    [foodDictionary release];
    [tmpIntakeList release];
    [sb_food release];
    [tv_food release];
    [lbl_name release];
    [btn_myIntake release];
    [lbl_selectFood release];
    [lbl_detail release];
    [user_icon release];
    [mPeers release];
    [processbar release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Phase 2 Convertion lifecycle
- (void) checkIsConversionNeeded
{
    NSMutableArray *tmpProfileList = [Tool getProfile];
    if ([tmpProfileList count] > 0)
    {
        Profile *tmpProfile = [tmpProfileList objectAtIndex:0];
        NSMutableArray *tmpOldFoodList = [[NSMutableArray alloc] initWithArray:[tmpProfile foodList]];
        if ([tmpOldFoodList count] > 0)
        {
            NSMutableArray *tmpNewFoodList = [[NSMutableArray alloc] initWithArray:[Tool getProfileFoodList]];
            while ([tmpOldFoodList count] > 0 ) {
                [tmpNewFoodList addObject:[tmpOldFoodList objectAtIndex:0]];
                [tmpOldFoodList removeObjectAtIndex:0];
            }
            [Tool setProfileFoodList:tmpNewFoodList];
            [tmpNewFoodList release];
            [tmpProfile setFoodList:tmpOldFoodList];
            [Tool setProfile:tmpProfile atIndex:0];
            [mainController reloadCurrentProfile];
        }

        [tmpOldFoodList release];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    received = NO;
    [processbar startAnimating];
    
    mPicker=[[GKPeerPickerController alloc] init];
	mPicker.delegate=self;
	mPicker.connectionTypesMask = GKPeerPickerConnectionTypeNearby;
	mPeers=[[NSMutableArray alloc] init];
    
    [self checkIsConversionNeeded];
    
    [self initWithProfile:mainController.currentProfile];
                         
    isEditing = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadEditFood:) name:@"loadEditFood" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editFoodList:) name:@"editButton" object:nil];
    
    NSString *view2 = [Language getText:@"my_foodlist"];
//    @"My Food List";
    NSString *isHidden = @"NO";
    NSString *buttonMode = @"edit";
	NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
    
    order_arr = [[NSArray alloc] initWithObjects:[Language getText:@"showallfood"], [Language getText:@"order_fat"],[Language getText:@"order_salt"],[Language getText:@"order_sugar"],[Language getText:@"order_3low"] ,nil];

//    order_arr = [[NSMutableArray alloc] initWithObjects:[Language getText:@"order_fat"],[Language getText:@"order_salt"],[Language getText:@"order_sugar"],[Language getText:@"order_3low"] ,nil];
    
//    [order_picker selectRow:0 inComponent:0 animated:NO];
    [btn_orderType setTitle:[Language getText:@"select_sorting"] forState:UIControlStateNormal];
    
    //language setting
    [lbl_selectFood setText:[Language getText:@"select_food"]];
    [lbl_detail setText:[Language getText:@"detail"]];
    [sb_food setPlaceholder:[Language getText:@"search"]];
    
    [lbl_lowfat setText:[Language getText:@"lbl_lowfat"]];
    [lbl_lowsalt setText:[Language getText:@"lbl_lowsalt"]];
    [lbl_lowsugar setText:[Language getText:@"lbl_lowsugar"]];
    [lbl_3low setText:[Language getText:@"lbl_3low"]];
    
    [picker_btn_confirm setTitle:[Language getText:@"confirm"] forState:UIControlStateNormal];
    [picker_btn_confirm setTitle:[Language getText:@"confirm"] forState:UIControlStateSelected];
    
    [picker_btn_cancel setTitle:[Language getText:@"cancel"] forState:UIControlStateNormal];
    [picker_btn_cancel setTitle:[Language getText:@"cancel"] forState:UIControlStateSelected];
    
    if([[Language currentLanguage] isEqualToString:@"en"]){
        [btn_myIntake setImage:[UIImage imageNamed:@"btn_myintake"] forState:UIControlStateNormal];
        [btn_share setImage:[UIImage imageNamed:@"btn_sharefood"] forState:UIControlStateNormal];
    }
    if([[Language currentLanguage] isEqualToString:@"zh"]){
        [btn_myIntake setImage:[UIImage imageNamed:@"btn_myintake_tc"] forState:UIControlStateNormal];
        [btn_share setImage:[UIImage imageNamed:@"btn_sharefood_tc"] forState:UIControlStateNormal];
    }
    if([[Language currentLanguage] isEqualToString:@"sc"]){
        [btn_myIntake setImage:[UIImage imageNamed:@"btn_myintake_sc"] forState:UIControlStateNormal];
        [btn_share setImage:[UIImage imageNamed:@"btn_sharefood_sc"] forState:UIControlStateNormal];
    }
    //language setting END
    
    [lbl_name setText:mainController.currentProfile.userName];
    
    sb_food.backgroundColor=[UIColor clearColor];
    
    
    for (UIView *subview in sb_food.subviews)
    {
        if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
        {  
            [subview removeFromSuperview];  
            break;  
        }
    }
    for (UIView *searchBarSubview in [sb_food subviews]) {
        
        if ([searchBarSubview conformsToProtocol:@protocol(UITextInputTraits)]) {
            
            @try {
                
                [(UITextField *)searchBarSubview setReturnKeyType:UIReturnKeyDone];
                [(UITextField *)searchBarSubview setKeyboardAppearance:UIKeyboardAppearanceAlert];
                [(UITextField *)searchBarSubview setEnablesReturnKeyAutomatically:NO];
            }
            @catch (NSException * e) {
                // ignore exception
            }
        }
    }

    [sb_food setDelegate:self];
    [tv_food setDelegate:self];
    [tv_food setDataSource:self];
    
    [self initFoodDictionary];
    [self initIntakeList];
    
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
        
        // 2) handle tableview y position
        [tv_food setFrame:CGRectMake(0,182,320,152+extra+40)]; // increase the height of table view to allow more rows. (extra)
        // debug
        tag = tv_food.tag;
        h = tv_food.frame.size.height;
        y = tv_food.frame.origin.y;
        NSString *b = [[NSString alloc] initWithFormat:@"TableView tag%ld, y=%d, h=%d", (long)tag, y, h ];
        NSLog(@"--- %@", b);
        [b release];
        
        [btn_share setFrame:CGRectMake(50,382+extra,90,91)];
        [btn_myIntake setFrame:CGRectMake(185,382+extra,90,91)];
        
        
    } else {
        [tv_food setFrame:CGRectMake(0,182,320,152+40)];
        [btn_share setFrame:CGRectMake(50,382,90,91)];
        [btn_myIntake setFrame:CGRectMake(185,382,90,91)];

    } // if end

    

}

- (void) initFoodDictionary
{
    if (foodDictionary != nil)
    {
        [foodDictionary release];
        foodDictionary = nil;
    }
    foodDictionary = [[NSMutableArray alloc] init];
    
    NSMutableArray *currentFoodList = [Tool getProfileFoodList];
    
    for(int i = 0; i<[currentFoodList count]; i++){
        
        float currentTotalFat = 0;
        float currentSodium = 0;
        float currentSugars = 0;
        currentTotalFat = [[currentFoodList objectAtIndex:i] totalFat] / [[currentFoodList objectAtIndex:i] weight];
        currentSodium = [[currentFoodList objectAtIndex:i] sodium]/ [[currentFoodList objectAtIndex:i] weight];
        currentSugars = [[currentFoodList objectAtIndex:i] sugars]/ [[currentFoodList objectAtIndex:i] weight];
//        if (currentTotalFat < 0)
//            currentTotalFat = INFINITY;
//        if (currentSodium < 0)
//            currentSodium = INFINITY;
//        if (currentSugars < 0)
//            currentSugars = INFINITY;
        
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                              [[[Tool getProfileFoodList] objectAtIndex:i] name] , @"foodName",
                              [NSNumber numberWithInt: [[currentFoodList objectAtIndex:i] foodID]], @"foodIndex",
                              [NSNumber numberWithBool: [NuFormula calLowFat:[currentFoodList objectAtIndex:i]]], @"foodLowFat",
                              [NSNumber numberWithBool: [NuFormula calLowSalt:[currentFoodList objectAtIndex:i]]], @"foodLowSalt",
                              [NSNumber numberWithBool: [NuFormula calLowSugar:[currentFoodList objectAtIndex:i]]], @"foodLowSugar",
                              [NSNumber numberWithFloat: currentTotalFat]  , @"foodFatValue",
                              [NSNumber numberWithFloat: currentSodium], @"foodSaltValue",
                              [NSNumber numberWithFloat: currentSugars], @"foodSugarValue",
                              [NSNumber numberWithBool: [NuFormula calThreeLow:[currentFoodList objectAtIndex:i]]], @"foodThreeLow",
                              nil];
        
        [foodDictionary addObject:dict];
    }
}

//- (NSMutableArray*) filterFoodWithoutInput:(NSMutableArray*) inFoodList
//{
//    NSInteger counter = 0;
//    
//    while (counter < [inFoodList count]) {
//        if([[inFoodList objectAtIndex:counter] totalFat] == 0)
//        {
//            [inFoodList removeObjectAtIndex:counter];
//        }
//        else counter++;
//    }
//    
//    return inFoodList;
//}

- (NSMutableArray*) filterFoodExcept:(NSString*) key forFoodlist:(NSMutableArray*) inFoodList
{
    NSInteger counter = 0;
//    NSMutableArray *tmpFoodList = [Tool getProfileFoodList];
    
    while (counter < [inFoodList count])
    {
        if ([key isEqualToString:@"foodThreeLow"]){
//            [key isEqualToString:@"foodLowFat"] ||
//            [key isEqualToString:@"foodLowSalt"] ||
//            [key isEqualToString:@"foodLowSugar"])
//        {
            if ([[[inFoodList objectAtIndex:counter] objectForKey:key] boolValue] == NO)
            {   
                [inFoodList removeObjectAtIndex:counter];
            }
            else
            {
                counter ++;
            }
        }
        else
        {
            if ([[[inFoodList objectAtIndex:counter] objectForKey:key] floatValue] < 0)
            {
                [inFoodList removeObjectAtIndex:counter];
            }
            else
            {
                counter ++;
            }
        }
//        }
//        else
//        {
//            if ([[[inFoodList objectAtIndex:counter] objectForKey:key] floatValue] < 0)
//            {
//                [inFoodList removeObjectAtIndex:counter];
//            }
//            else
//            {
//                counter ++;
//            }
//        }
    }
    return inFoodList;
}

- (void) initIntakeList
{
    if (tmpIntakeList != nil)
    {
        [tmpIntakeList release];
        tmpIntakeList = nil;
    }
    tmpIntakeList = [[NSMutableArray alloc]initWithArray:[mainController.currentProfile getIntakeList]];
}

- (void)setMode:(int)mode{
    
}

- (void)addIntake:(int)intakeNum{
    [tmpIntakeList addObject:[NSNumber numberWithInt:intakeNum]];
    
    for(int i = 0; i < [tmpIntakeList count]; i++){
        NSLog(@"intake list after add : %@", [tmpIntakeList objectAtIndex:i]);
    }
    [self storeIntake];
}

- (void)removeIntake:(int)intakeNum{
    [tmpIntakeList removeObject:[NSNumber numberWithInt:intakeNum]];
    for(int i = 0; i < [tmpIntakeList count]; i++){
        NSLog(@"intake list after delete : %@", [tmpIntakeList objectAtIndex:i]);
    }
    [self storeIntake];
}

- (void)storeIntake
{
    Profile *tmpProfile = [[Profile alloc] initWithProfile: mainController.currentProfile];
    tmpProfile.intakeList = tmpIntakeList;
    [self storeProfile:tmpProfile];
    [tmpProfile release];
}

- (NSMutableArray*)getIntakeFoodList:(NSMutableArray*) getList
{
    NSMutableArray *currentProfileFoodlist = [[NSMutableArray alloc] initWithArray: [Tool getProfileFoodList]];
    
    NSMutableArray *exportFoodlist = [NSMutableArray array];
    
    for (int i = 0; [getList count] > i ; i++ )
    {
        NSInteger foodID = [(NSNumber*)[getList objectAtIndex:i] integerValue];
        for (int count = 0; [currentProfileFoodlist count] > count; count++) {
            if (foodID == [(Food*)[currentProfileFoodlist objectAtIndex:count] foodID] )
            {
                Food *food = [[Food alloc] initWithFoodCopy:(Food*)[currentProfileFoodlist objectAtIndex:count]];
                [exportFoodlist addObject:food];
                [food release];
            }
        }
    }
    
    [currentProfileFoodlist release];
    
    return exportFoodlist;
}

- (NSMutableArray*)getIntakeFoodListBlueTooth:(NSMutableArray*) getList
{
    NSMutableArray *currentProfileFoodlist = [[NSMutableArray alloc] initWithArray: [Tool getProfileFoodList]];
    
    NSMutableArray *exportFoodlist = [NSMutableArray array];
    
    for (int i = 0; [getList count] > i ; i++ )
    {
        NSInteger foodID = [(NSNumber*)[getList objectAtIndex:i] integerValue];
        for (int count = 0; [currentProfileFoodlist count] > count; count++) {
            if (foodID == [(Food*)[currentProfileFoodlist objectAtIndex:count] foodID] )
            {
                Food *food = [[Food alloc] initWithFoodCopyTest:(Food*)[currentProfileFoodlist objectAtIndex:count]];
                [exportFoodlist addObject:food];
                [food release];
            }
        }
    }
    
    [currentProfileFoodlist release];
    
    return exportFoodlist;
}

- (void)loadEditFood:(NSNotification *)notification{
    NSString *tmp = [notification object];
    
    NSString *view = @"AddEditFood";
    NSString *mode = [NSString stringWithFormat:@"%i", [tmp intValue]];
    NSLog(@"now mode = %@", mode);
    NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", mode,@"mode", nil];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
}

- (void)editFoodList:(NSNotification *)notification{
    [tv_food setEditing:!tv_food.editing];
    if(tv_food.editing){
        isEditing = YES;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"setTickAble" object:@"NO"];
    }
    else{
        isEditing = NO;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"setTickAble" object:@"YES"];
    }
    if(tv_food.editing){
        NSString *view2 = [Language getText:@"my_foodlist"];
        NSString *isHidden = @"NO";
        NSString *buttonMode = @"Cancel";
        NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
    }
    else{
        NSString *view2 = [Language getText:@"my_foodlist"];
        NSString *isHidden = @"NO";
        NSString *buttonMode = @"edit";
        NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
    }
    [tv_food reloadData];
}

- (void) storeProfile:(Profile*) profile
{
    [Tool setProfile:profile];
    [mainController reloadCurrentProfile];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [foodDictionary count];
}

-(FoodListCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"foodName"  ascending:YES];
//    [foodDictionary sortUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
    
  	FoodListCell *cell = (FoodListCell*)[tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"Cell %li",(long)indexPath.section]];
    
    UIView *cellBackView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    cellBackView.backgroundColor = [UIColor clearColor];
    
	if (cell == nil) {
        cell = [[[FoodListCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[NSString stringWithFormat:@"Cell %li",(long)indexPath.section] withController:self ]autorelease];
    }
    NSLog(@"intake count = %lu", (unsigned long)[tmpIntakeList count]);

    [cell setBtnSelected:NO];
    if([tmpIntakeList count]!=0){
        for (int i = 0; i< [tmpIntakeList count]; i++) {
            if([[tmpIntakeList objectAtIndex:i] intValue] == [[[foodDictionary objectAtIndex:indexPath.row] objectForKey:@"foodIndex"] intValue]){
                [cell setBtnSelected:YES];
            }
        }
    }
    if([tableView isEditing]){
        [cell setCellBeginEditingPos];
        
        [lbl_lowfat setFrame:CGRectMake(131, 0, 30, 30)];
        [lbl_lowsalt setFrame:CGRectMake(159, 0 , 30, 30)];
        [lbl_lowsugar setFrame:CGRectMake(190, 0, 30, 30)];
        [lbl_3low setFrame:CGRectMake(221, 0, 30, 30)];
    }
    else{
        [cell setCellEndEditingPos];
        
        [lbl_lowfat setFrame:CGRectMake(156, 0, 30, 30)];
        [lbl_lowsalt setFrame:CGRectMake(184, 0 , 30, 30)];
        [lbl_lowsugar setFrame:CGRectMake(215, 0, 30, 30)];
        [lbl_3low setFrame:CGRectMake(249, 0, 30, 30)];
    }
    cell.backgroundView = cellBackView;
    [cell.textLabel setTextColor:lbl_name.textColor];
    [cell.imageView setCenter:CGPointMake(100, 10)];
    
    [cell setCellID:[[[foodDictionary objectAtIndex:indexPath.row] objectForKey:@"foodIndex"] intValue]];
    [cell.textLabel setText:[[foodDictionary objectAtIndex:indexPath.row] objectForKey:@"foodName"]];
    
    BOOL isLowFat = [[[foodDictionary objectAtIndex:indexPath.row] objectForKey:@"foodLowFat"] boolValue];
    BOOL isLowSalt = [[[foodDictionary objectAtIndex:indexPath.row] objectForKey:@"foodLowSalt"] boolValue];
    BOOL isLowSugar = [[[foodDictionary objectAtIndex:indexPath.row] objectForKey:@"foodLowSugar"] boolValue];
    
    [cell.v_lowfat setHidden:!isLowFat];
    [cell.v_lowsalt setHidden:!isLowSalt];
    [cell.v_lowsugar setHidden:!isLowSugar];
    
    if(isLowFat == true && isLowSalt == true && isLowSugar == true){
        [cell.v_lowfat setHidden:YES];
        [cell.v_lowsalt setHidden:YES];
        [cell.v_lowsugar setHidden:YES];
        [cell.v_lowthree setHidden:NO];
    }else{
        [cell.v_lowthree setHidden:YES];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    // code - fix cell background color problem by CSA4 - 2014.11.15
    // for iOS 6.1 and below - there is no need to change the BackgroundColor of the cell

    [cell setBackgroundColor: [UIColor clearColor]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	[tableView deselectRowAtIndexPath:indexPath animated:NO];
    
//    NSString *view = @"AddEditFood";
//    NSString *mode = [NSString stringWithFormat:@"%i", [[[foodDictionary objectAtIndex:indexPath.row] objectForKey:@"foodIndex"] intValue]];
//    NSLog(@"now mode = %@", mode);
//    NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", mode,@"mode", nil];
//	[[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        int foodIndex = [[[foodDictionary objectAtIndex:indexPath.row] objectForKey:@"foodIndex"] intValue];
        for(int i = 0; i<[[Tool getProfileFoodList] count]; i++){
            if([[[Tool getProfileFoodList] objectAtIndex:i] foodID] == foodIndex){
                NSLog(@"Food %@ in IF %i was deleted", [[[Tool getProfileFoodList] objectAtIndex:i] name],[[[Tool getProfileFoodList] objectAtIndex:i] foodID]);
                
                NSMutableArray *tmpFoodList = [[NSMutableArray alloc] initWithArray: [Tool getProfileFoodList]];
                [tmpFoodList removeObjectAtIndex:i];
                [Tool setProfileFoodList:tmpFoodList];
                [tmpFoodList release];
                break;
            }
        }
        
        for(int i = 0; i<[tmpIntakeList count]; i++){
            if([[tmpIntakeList objectAtIndex:i] intValue] == foodIndex){
                NSLog(@"Intake ID %i is delete", [[tmpIntakeList objectAtIndex:i] intValue]);
                [tmpIntakeList removeObjectAtIndex:i];
                [self storeIntake];
                break;
            }
        }
        
        [self initFoodDictionary];
        [tv_food reloadData];
    }
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSString *searchKey = [searchText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSLog(@"search text length = %lu", (unsigned long)[searchKey length]);
    [foodDictionary removeAllObjects];
    if([searchKey length] != 0){
        for(int i = 0; i<[[Tool getProfileFoodList] count]; i++){
            NSRange textRange;
            NSString *fName = [[[Tool getProfileFoodList] objectAtIndex:i] name];
            textRange =[[fName lowercaseString] rangeOfString:[searchKey lowercaseString]];
            if(textRange.location != NSNotFound){
                NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                      [[[Tool getProfileFoodList] objectAtIndex:i] name] , @"foodName",
//                                      [[[Tool getProfileFoodList] objectAtIndex:i] weightType], @"weightType",
                                      [NSNumber numberWithInt: [[[Tool getProfileFoodList] objectAtIndex:i] foodID]], @"foodIndex",
                                      [NSNumber numberWithBool: [NuFormula calLowFat:[[Tool getProfileFoodList] objectAtIndex:i]]], @"foodLowFat",
                                      [NSNumber numberWithBool: [NuFormula calLowSalt:[[Tool getProfileFoodList] objectAtIndex:i]]], @"foodLowSalt",
                                      [NSNumber numberWithBool: [NuFormula calLowSugar:[[Tool getProfileFoodList] objectAtIndex:i]]], @"foodLowSugar",
                                      [NSNumber numberWithBool: [NuFormula calThreeLow:[[Tool getProfileFoodList] objectAtIndex:i]]], @"foodThreeLow",
                                      nil];
                [foodDictionary addObject:dict];
            }
        }
    }
    else{
        for(int i = 0; i<[[Tool getProfileFoodList] count]; i++){
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                  [[[Tool getProfileFoodList] objectAtIndex:i] name] , @"foodName",
//                                  [[[Tool getProfileFoodList] objectAtIndex:i] weightType], @"weightType",
                                  [NSNumber numberWithInt: [[[Tool getProfileFoodList] objectAtIndex:i] foodID]], @"foodIndex",
                                  [NSNumber numberWithBool: [NuFormula calLowFat:[[Tool getProfileFoodList] objectAtIndex:i]]], @"foodLowFat",
                                  [NSNumber numberWithBool: [NuFormula calLowSalt:[[Tool getProfileFoodList] objectAtIndex:i]]], @"foodLowSalt",
                                  [NSNumber numberWithBool: [NuFormula calLowSugar:[[Tool getProfileFoodList] objectAtIndex:i]]], @"foodLowSugar",
                                  [NSNumber numberWithBool: [NuFormula calThreeLow:[[Tool getProfileFoodList] objectAtIndex:i]]], @"foodThreeLow",
                                  nil];
            [foodDictionary addObject:dict];
        }
    }
    [tv_food reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}

- (IBAction)buttonPress:(id)sender {
    if(sender == btn_myIntake){
        if([tmpIntakeList count] == 0){
            NuCalAlert *noIntakeAlert = [[NuCalAlert alloc]initWithTitle:nil Subtitle:[Language getText:@"alert_nofood_select"] CancelButtonTitle:[Language getText:@"ok"] ButtonTitle:nil];
            [noIntakeAlert show];
            [noIntakeAlert release];
            return;
        }
        else if([[mainController.currentProfile getIntakeHistoryList] count] >= 30){
            NuCalAlert *tooManyIntakeAlert = [[NuCalAlert alloc]initWithTitle:nil Subtitle:[Language getText:@"alert_too_many_food"] CancelButtonTitle:[Language getText:@"no"] ButtonTitle:[NSMutableArray arrayWithObject:[Language getText:@"yes"]]];
            [tooManyIntakeAlert setSubTitleFont:[UIFont systemFontOfSize:16]];
            [tooManyIntakeAlert setTag:FullRecord];
            [tooManyIntakeAlert setDelegate:self];
            [tooManyIntakeAlert show];
            [tooManyIntakeAlert release];
            return;
        }
        
        NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"foodName"  ascending:YES];
        [foodDictionary sortUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
        
        [mainController.currentProfile setIntakeList:tmpIntakeList];
        [self storeProfile:mainController.currentProfile];
        
        NSString *view = @"MyIntake";
        NSString *mode = @"";
        
        NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view",mode, @"mode", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
    }
}

//-(void)NuAlertView:(NuCalAlert *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//
//    if(buttonIndex == 0)
//    {
//        NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: @"MyIntakeHistory", @"view",@"-1", @"mode", nil];
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary]; 
//    }
//    else 
//    {
//        
//    }
//    
//}





- (void)viewDidUnload
{
    [tmpIntakeList release];
    tmpIntakeList = nil;
    [sb_food release];
    sb_food = nil;
    [tv_food release];
    tv_food = nil;
    [lbl_name release];
    lbl_name = nil;
    [self setBtn_myIntake:nil];
    [self setSb_food:nil];
    [self setTv_food:nil];
    [self setLbl_name:nil];
    [self setLbl_selectFood:nil];
    [self setLbl_detail:nil];
    [user_icon release];
    user_icon = nil;
    [processbar release];
    processbar = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//- (NSComparisonResult)compare:(F *)otherObject {
//    return [self.birthDate compare:otherObject.birthDate];
//}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath 
{
    return isEditing;
}

- (void) initWithProfile:(Profile*) profile
{
    
    if (currentProfile != nil)
    {
        [currentProfile release];
        currentProfile = nil;
    }
    currentProfile = [[Profile alloc] initWithProfile:profile];
    
    UIImage *profile_pic = profile.profile_pic;
    
    if(profile_pic != NULL){
        [user_icon setImage:profile_pic];
    }
    else{
        [user_icon setImage:[UIImage imageNamed:@"userpic_default"]];
    }
}





#pragma mark - Picker lifecycle 


- (IBAction)sorting:(id)sender {
    [self pickerViewOpen];
}

- (IBAction)picker_cancel:(id)sender {
    [self pickerViewClose];
}

- (IBAction)picker_confirm:(id)sender {
    
    //    float fat;
    //    NSMutableArray *fat;
    NSSortDescriptor *descriptor;
    
    switch (orderType) {
        case 0:
            [btn_orderType setTitle:[Language getText:@"showallfood"] forState:UIControlStateNormal];
            [im_orderType setImage:nil];
            [self initFoodDictionary];
            [self initIntakeList];
            //sort by name
//            descriptor = [[NSSortDescriptor alloc] initWithKey:@"foodName"  ascending:YES];
//            [foodDictionary sortUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
//            [descriptor release];
            [tv_food reloadData];
            break;
        case 1:
            [btn_orderType setTitle:[Language getText:@"order_fat"] forState:UIControlStateNormal];
            [im_orderType setImage:[UIImage imageNamed:@"order_icon_lowfat"]];
            [self initFoodDictionary];
            [self initIntakeList];
            [self filterFoodExcept:@"foodFatValue" forFoodlist: foodDictionary];
            descriptor = [[NSSortDescriptor alloc] initWithKey:@"foodFatValue"  ascending:YES];
            [foodDictionary sortUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
            [descriptor release];
            [tv_food reloadData];
            break;
        case 2:
            [btn_orderType setTitle:[Language getText:@"order_salt"] forState:UIControlStateNormal];
            [im_orderType setImage:[UIImage imageNamed:@"order_icon_lowsalt"]];
            [self initFoodDictionary];
            [self initIntakeList];
            [self filterFoodExcept:@"foodSaltValue" forFoodlist: foodDictionary];
            descriptor = [[NSSortDescriptor alloc] initWithKey:@"foodSaltValue"  ascending:YES];
            [foodDictionary sortUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
            [descriptor release];
            [tv_food reloadData];
            break;
        case 3:
            [btn_orderType setTitle:[Language getText:@"order_sugar"] forState:UIControlStateNormal];
            [im_orderType setImage:[UIImage imageNamed:@"order_icon_lowsugar"]];
            [self initFoodDictionary];
            [self initIntakeList];
            [self filterFoodExcept:@"foodSugarValue" forFoodlist: foodDictionary];
            descriptor = [[NSSortDescriptor alloc] initWithKey:@"foodSugarValue"  ascending:YES];
            [foodDictionary sortUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
            [descriptor release];
            [tv_food reloadData];
            break;
        case 4:
            [btn_orderType setTitle:[Language getText:@"order_3low"] forState:UIControlStateNormal];
            [im_orderType setImage:[UIImage imageNamed:@"order_icon_3low"]];
            [self initFoodDictionary];
            [self initIntakeList];
            [self filterFoodExcept:@"foodThreeLow" forFoodlist: foodDictionary];
            descriptor = [[NSSortDescriptor alloc] initWithKey:@"foodThreeLow"  ascending:NO];
            [foodDictionary sortUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
            [descriptor release];
            [tv_food reloadData];
            break;
    }
    
    [self pickerViewClose];
}

-(void)pickerViewOpen
{
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.4];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationBeginsFromCurrentState:NO];
    
    [v_picker setFrame:CGRectMake(0, 222, 320, 480-222)];
	// [v_picker setFrame:CGRectMake(0, 222, 320, 258)];
	[UIView commitAnimations];
}
- (void)pickerViewClose
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.4];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationBeginsFromCurrentState:NO];
    
    // code - add support to iphone5 - by csa4 - 15.5.2014
    // if this is iphone5, extra = 88, so after closing it, we need move the picker down (88) vertically (y -> y+88)
    if (IS_IPHONE5()) {
        int extra = MY_EXTRA_HEIGHT();
        [v_picker setFrame:CGRectMake(0, 480+extra, 320, 480-222+extra)];
    } else {
        [v_picker setFrame:CGRectMake(0, 480, 320, 480-222)];
    } // if end
    
    // old code - 5.12.2014
	// [v_picker setFrame:CGRectMake(0, 480, 320, 258)];
	[UIView commitAnimations];
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component 
{
    return[order_arr objectAtIndex:row];
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [order_arr count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    orderType = row;
}

#pragma mark - GKSession lifecycle 

- (void)NuAlertView:(NuCalAlert *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    NSData *food_data = [NSKeyedArchiver archivedDataWithRootObject:[self getIntakeFoodListBlueTooth:tmpIntakeList]];
    
    if (alertView.tag == 333){
        [mSession sendData:food_data toPeers:mPeers withDataMode:GKSendDataReliable error:nil];
        [loadingView setHidden:NO];
        [btn_share setEnabled:NO];
        blueToothTimer = [NSTimer scheduledTimerWithTimeInterval:1.5f target:self selector:@selector(blueToothThread:)userInfo:nil repeats:YES];
    }
    else if(alertView.tag == 777){
        [self disableBlueTooth];
        [self refreshPage];
    }
    else if(alertView.tag == FullRecord)
    {
        if(buttonIndex == 0)
        {
            NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: @"MyIntakeHistory", @"view",@"-1", @"mode", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary]; 
        }
        else 
        {
            
        }
    }
}

//- (NSString*) getPeerName:(NSString*) test
//{
//    return mainController.currentProfile.userName;
//}

- (IBAction)connectClicked:(id)sender {
    [mPicker show];
}

- (void)peerPickerController:(GKPeerPickerController *)picker didSelectConnectionType:(GKPeerPickerConnectionType)type{
	if (type == GKPeerPickerConnectionTypeOnline) {
        picker.delegate = nil;
        [picker dismiss];
        [picker autorelease];
		// Implement your own internet user interface here.
    }
}

- (GKSession *)peerPickerController:(GKPeerPickerController *)picker sessionForConnectionType:(GKPeerPickerConnectionType)type{
    
    
	NSString *txt= mainController.currentProfile.userName;
    
	GKSession* session = [[GKSession alloc] initWithSessionID:@"gavi" displayName:txt sessionMode:GKSessionModePeer];
    
    //    NSLog(@"connectionType:%i",type);
    
    [session autorelease];
    return session;
}

- (void)peerPickerController:(GKPeerPickerController *)picker didConnectPeer:(NSString *)peerID toSession:(GKSession *)session{
    
	NSLog(@"Connected from %@",peerID);
    
	// Use a retaining property to take ownership of the session.
    self.mSession = session;
	// Assumes our object will also become the session's delegate.
    mSession.delegate = self;
    [mSession setDataReceiveHandler: self withContext:nil];
	// Remove the picker.
    picker.delegate = nil;
    [picker dismiss];
    [picker autorelease];
	// Start your game.
}

- (void)peerPickerControllerDidCancel:(GKPeerPickerController *)picker{
    
}


- (void)session:(GKSession *)session didReceiveConnectionRequestFromPeer:(NSString *)peerID
{
	NSError* error=nil;
    [mSession acceptConnectionFromPeer:peerID error:&error];
}

- (BOOL)acceptConnectionFromPeer:(NSString *)peerID error:(NSError *)error
{
	printf("\n\n\n\n\n acceptConnectionFromPeer!!!!!! \n\n\n\n");
	return YES;
}

- (void)session:(GKSession *)session peer:(NSString *)peerID didChangeState:(GKPeerConnectionState)state{
    
    if (state == GKPeerStateConnected)
    {
        if ([session sessionMode] == GKSessionModeServer)
        {
            NSLog(@"Server");
        }
        else 
        {
            NSLog(@"Client");
        }
        
        NSString *str=[NSString stringWithFormat:@"Connected from peer: %@",peerID];
        NSLog(@"peer:%@",str);
        [mPeers addObject:peerID];
        
        NuCalAlert *shareFood = [[NuCalAlert alloc]initWithTitle:nil Subtitle:[Language getText:@"share_food"] CancelButtonTitle:[Language getText:@"yes"] ButtonTitle:nil];
        [shareFood setTag:333];
        [shareFood setDelegate:self];
        [shareFood show];
        [shareFood release];
    }
    else if ( state == GKPeerStateDisconnected)
    {
        NSLog(@"disconnected");
        [mPeers removeObject:peerID];
        
        NSString *str=[NSString stringWithFormat:@"DisConnected from peer: %@",peerID];
        NSLog(@"%@",str);
    }
}

- (NSMutableArray*) getFoodListID
{
    NSMutableArray *foodlist = [[NSMutableArray alloc] initWithArray: [Tool getProfileFoodList]];
    NSMutableArray *foodlistID = [NSMutableArray array];
    for (int i = 0 ; i < [foodlist count]; i++)
    {
        [foodlistID addObject:[[[NSNumber alloc] initWithInt:[[foodlist objectAtIndex:i] foodID]] autorelease]];
    }
    [foodlist release];
    return foodlistID;
}

- (BOOL) checkFoodIDExist:(NSInteger)foodid FoodList:(NSMutableArray*)inArray
{
    for (int i = 0 ; i < [inArray count]; i++)
    {
        if (foodid == [[inArray objectAtIndex:i] foodID])
            return TRUE;
    }
    return FALSE;
}

- (BOOL) checkFoodNameExist:(NSString*)foodName FoodList:(NSMutableArray*)inArray
{
    for (int i = 0 ; i < [inArray count]; i++)
    {
        if ([foodName isEqualToString: [[inArray objectAtIndex:i] name]])
        {
            return TRUE;
        }
    }
    return FALSE;
}

//- (NSString*) renameFood:(NSString*) foodName
//{
//    NSCharacterSet *numberSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
//    NSString *trimmed = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//    NSRange matchRange = [trimmed rangeOfCharacterFromSet:numberSet];
//    BOOL isNumeric = matchRange.location == 0 && matchRange.length == trimmed.length && trimmed.length > 0;
//    
//}
//
//- (int) numberOfIntegerAtTheEnd:(NSString*) inString
//{
//    if (inString rangeOfComposedCharacterSequenceAtIndex:<#(NSUInteger)#>)
//        }


- (NSMutableArray*) mergeFoodList:(NSMutableArray*) addArray CurrentFoodList:(NSMutableArray*) currentArray
{
    NSMutableArray *currentFoodlist = currentArray;
    NSMutableArray *mergeFoodList = [[NSMutableArray alloc] initWithArray:addArray];

    while ([mergeFoodList count] > 0) {
        Food *tempFood = [mergeFoodList lastObject];
        while ([self checkFoodIDExist:[tempFood foodID] FoodList:currentFoodlist]) {
            tempFood.foodID++;
        }
        Food *addFood = [[Food alloc] initWithFoodCopy:tempFood];
        
        [currentFoodlist addObject:addFood];
        [addFood release];
        [mergeFoodList removeObject:tempFood];
    }

    [mergeFoodList release];
    return currentFoodlist;
}

- (void) receiveData:(NSData *)data fromPeer:(NSString *)peer inSession: (GKSession *)session context:(void *)context
{
    // Read the bytes in data and perform an application-specific action.
    NSMutableArray *return_food = [[NSMutableArray alloc] initWithArray:(NSMutableArray*)[NSKeyedUnarchiver unarchiveObjectWithData:data]];
    
    NSMutableArray *result = [[NSMutableArray alloc] initWithArray:[self mergeFoodList:return_food CurrentFoodList:[Tool getProfileFoodList]]];
    
    countArray = [[NSMutableArray alloc] initWithArray:return_food];
    
    NSLog(@"%lu",(unsigned long)[countArray count]);
    
    received = YES;   
    
    [Tool setProfileFoodList:result];
//    [mainController.currentProfile setFoodList:result];
    [result release];
    [return_food release];
    
    NSLog(@"saved food count: %lu",(unsigned long)[[Tool getProfileFoodList] count]);
    [self storeProfile:mainController.currentProfile];
    [self initFoodDictionary];
    [self initIntakeList];
    [tv_food reloadData];
}

- (void) disableBlueTooth{
    [mSession disconnectFromAllPeers];
    [mSession setAvailable:NO];
    [mSession setDelegate:nil];
    [mSession setDataReceiveHandler:nil withContext:nil];
    mSession = nil;
}

- (void) refreshPage{
    NSString *view = @"FoodList";
    NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
}

- (void)blueToothThread:(NSTimer *)theTimer {
    if(received == YES){
        [loadingView setHidden:YES];
        [btn_share setEnabled:YES];
        [blueToothTimer invalidate];
        blueToothTimer = nil;
        
        if ([countArray count] == 1)
        {
        NuCalAlert *finishAlert = [[NuCalAlert alloc]initWithTitle:nil Subtitle:[NSString stringWithFormat:@"%@ (%lu%@)",[Language getText:@"finish_food"],(unsigned long)[countArray count],[Language getText:@"transmitted_record"]] CancelButtonTitle:[Language getText:@"yes"] ButtonTitle:nil];
            
            [finishAlert setTag:777];
            [finishAlert setDelegate:self];
            [finishAlert show];
            [finishAlert release];
        }
        else
        {
        NuCalAlert *finishAlert = [[NuCalAlert alloc]initWithTitle:nil Subtitle:[NSString stringWithFormat:@"%@ (%lu%@)",[Language getText:@"finish_food"],(unsigned long)[countArray count],[Language getText:@"transmitted_records"]] CancelButtonTitle:[Language getText:@"yes"] ButtonTitle:nil];
            
            [finishAlert setTag:777];
            [finishAlert setDelegate:self];
            [finishAlert show];
            [finishAlert release];
        }
        
        [countArray release];
        
    }
    else{
        
    }
}


@end
