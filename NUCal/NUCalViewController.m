//
//  NUCalViewController.m
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NUCalViewController.h"
NUCalViewController *mainController;

@implementation NUCalViewController

@synthesize firstRun, isHome, currentProfile, newUser, currentProfileIndex;

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"loadView" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"updateNavigation" object:nil];
    [currentProfile release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
//    [self dumpFonts];
    [super viewDidLoad];
    mainController = self;
    [self onInit];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadViewHandler:) name:@"loadView" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateNavigationHandler:) name:@"updateNavigation" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alertViewHandler:) name:@"alertView" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(homeButton:) name:@"homeButton" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editButton:) name:@"editButton" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backButton:) name:@"backButton" object:nil];
    
    if (firstRun)
    {
        NSString *view = @"Introduction";
        NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
    }
    else
    {
        NSString *view = @"Menu";
        NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
    }

//    
//    [self dumpFonts];

//    [self testWriteProfile];
//    [self testReadProfile];
    
}

- (void) onInit
{
    firstRun = YES;
    NSMutableArray *temp = [Tool getProfile];
    currentProfileIndex = [Tool getDefaultProfile];
    
    if ([temp count] <= currentProfileIndex)
    {
        currentProfileIndex = 0;
        [Tool setDefaultProfile:currentProfileIndex];
        currentProfile  = [Profile alloc];
    }
    else
    {
        firstRun = NO;
        currentProfile = [[Profile alloc] updateProfile:[temp objectAtIndex:currentProfileIndex]];
    }   
    
    [self.view addSubview:v_version];
}

- (void) reloadCurrentProfile
{
    if (currentProfile != nil)
    {
        [currentProfile release];
        currentProfile = nil;
    }
    
    NSMutableArray *profileArray = [[NSMutableArray alloc] initWithArray:[Tool getProfile]];
    
    if ([profileArray count] > [Tool getDefaultProfile])
    {
        currentProfile = [[Profile alloc] initWithProfile:[profileArray objectAtIndex:[Tool getDefaultProfile]]];
    }
    else
    {
        currentProfile = [[Profile alloc] initWithProfile:[profileArray objectAtIndex:0]];
        [Tool setDefaultProfile:0];
    }
    [profileArray release];
}

//- (void) testWriteProfile
//{
//    Profile *user1 = [[Profile alloc] initWithData:@"peter" Gender:MALE Weight:54.5 WeightType:KG Height:1.7 HeightType:METER Age:20 ActivityLv:AL_HIGH];
//    NSLog(@"%@", user1.userName);
//    
//    Food *food1 = [[Food alloc] initWithFood:@"coke" Type:PER100GML Weight:0 Energy:1000 EnergyType:KCAL Protein:10 TotalFat:20 SaturatedFat:30 TransFat:40 CarbohydratesType:TOTALCARBOHYDRATES Carbohydrates:60 DietaryFibre:70 Sugars:80 Sodium:90];
//    
//    NSLog(@"%@", food1.name);
//    NSLog(@"carbohydrates : %f", food1.carbohydrates);
//    
//    [user1 addFood:food1];
//    
//    NSMutableArray *saveArray = [[NSMutableArray alloc] initWithObjects:user1,user1,user1, nil];
//
//    [Tool setProfileList:saveArray];
//    
//    [food1 release];
//    [user1 release];
//
//}

- (void) testReadProfile
{

    NSMutableArray *loadArray = [[NSMutableArray alloc] initWithArray:[Tool getProfile]];
    
    for(Profile *p in loadArray)
    {
        NSLog(@"%@", p.userName);
    }
    
    
//    NSMutableArray *foodlist = [getProfile getFoodList];
//    
//    Food *getFood = [foodlist objectAtIndex:0];
//    
//    NSLog(@"%@", getFood.name);
//    NSLog(@"%f", getFood.energy);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    // return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return NO;
}



- (void)loadViewHandler:(NSNotification *)notification
{
	NSDictionary* userInfo = [notification userInfo];
	NSString *view = [userInfo objectForKey:@"view"];
    NSString *mode = [userInfo objectForKey:@"mode"];
    NSString *index = [userInfo objectForKey:@"index"];
    
    if( currentViewController != nil )
	{
		[currentViewController.view removeFromSuperview];
        [currentViewController release];
		currentViewController = nil;
        [currentViewController dealloc];
	}
    
	// Init class from string
	currentViewController = [[NSClassFromString(view) alloc] initWithNibName:view bundle:nil];
	[currentViewController setMode:[mode intValue]];
    
    if ([view isEqualToString:@"UserProfile"])
    {
        if (newUser)
        {
            if ([[Tool getProfile] count] != 0)
            {
                [currentViewController setIndex: [[Tool getProfile] count]];
            }
            else
            {
                 [currentViewController setIndex: [index integerValue]];
            }
        }
        else
        {
            [currentViewController setIndex: [index integerValue]];
        }
        
    }
    
    [contentView addSubview:currentViewController.view];
}

- (void)updateNavigationHandler:(NSNotification *)notification
{
    NSArray *buttonArray = [NSArray arrayWithObjects:homeButton, backButton, editButton, nil];
    
	NSDictionary* userInfo = [notification userInfo];
	NSString *text = [userInfo objectForKey:@"title"];
    BOOL isHidden = [[userInfo objectForKey:@"isHidden"] boolValue];
    NSString *mode = [userInfo objectForKey:@"buttonMode"];
    
    for (UIButton *b in buttonArray)
    {
        [b setHidden:YES];
    }
    
    if ([mode isEqualToString:@"home"])
    {
        [homeButton setHidden:NO];
        [changeUserButton setHidden:YES];
        homeType = NO_ALERT_HOME;
    }
    else if ([mode isEqualToString:@"null"]){
        [homeButton setHidden:YES];
        [changeUserButton setHidden:YES];
        [homeButton setHidden:YES];
        [editButton setHidden:YES];
    }
    else if([mode isEqualToString:@"userhome"]){
        [homeButton setHidden:NO];
        [changeUserButton setHidden:NO];
        homeType = NO_ALERT_HOME;
    }
    else if ([mode isEqualToString:@"home_alert"])
    {
        [homeButton setHidden:NO];
        [changeUserButton setHidden:YES];
        homeType = TYPE_ALERT_HOME;
    }
    else if ([mode isEqualToString:@"edit"])
    {
        [homeButton setHidden:NO];
        [editButton setHidden:NO];
        [changeUserButton setHidden:YES];
        [editButton setTitle:@"Edit" forState:UIControlStateNormal];
        [editButton setImage:[UIImage imageNamed:@"btn_edit"] forState:UIControlStateNormal];
        homeType = NO_ALERT_HOME;
    }
    else if ([mode isEqualToString:@"Cancel"])
    {
        [homeButton setHidden:NO];
        [editButton setHidden:NO];
        [changeUserButton setHidden:YES];
        [editButton setTitle:@"Cancel" forState:UIControlStateNormal];
        homeType = NO_ALERT_HOME;
        
        if([[Language currentLanguage] isEqualToString:@"en"]){
            [editButton setImage:[UIImage imageNamed:@"btn_cancel"] forState:UIControlStateNormal];
        }
        else if([[Language currentLanguage] isEqualToString:@"zh"]){
            [editButton setImage:[UIImage imageNamed:@"btn_cancel_tc"] forState:UIControlStateNormal];
        }
        else if([[Language currentLanguage] isEqualToString:@"sc"]){
            [editButton setImage:[UIImage imageNamed:@"btn_cancel_tc"] forState:UIControlStateNormal];
        }
    }
    else if ([mode isEqualToString:@"back"])
    {
        [homeButton setHidden:NO];
        [backButton setHidden:NO];
        [editButton setHidden:YES];
        [changeUserButton setHidden:YES];
        homeType = TYPE_ALERT_HOME;
    }
    else if ([mode isEqualToString:@"profileback"])
    {
        [homeButton setHidden:YES];
        [backButton setHidden:NO];
        [editButton setHidden:YES];
        [changeUserButton setHidden:YES];
        homeType = NO_ALERT_HOME;
    }
    
	[navigationTitle setText:text];
    if([[Language currentLanguage] isEqualToString:@"en"]){
        navigationTitle.font = [UIFont fontWithName:@"HelveticaNeueLT-MediumCond" size:navigationTitle.font.pointSize];
    }
    else if([[Language currentLanguage] isEqualToString:@"zh"]){
        navigationTitle.font = [UIFont fontWithName:@"DFNYuan-W9-WINP-BF" size:navigationTitle.font.pointSize];
    }
    else if([[Language currentLanguage] isEqualToString:@"sc"]){
        navigationTitle.font = [UIFont fontWithName:@"DFYuanW9-GB" size:navigationTitle.font.pointSize];
    }
    [navigationView setHidden:isHidden];
    
    

    
    if([[Language currentLanguage] isEqualToString:@"en"]){
        [changeUserButton setImage:[UIImage imageNamed:@"btn_changeuser"] forState:UIControlStateNormal];
    }
    else if([[Language currentLanguage] isEqualToString:@"zh"]){
        [changeUserButton setImage:[UIImage imageNamed:@"btn_changeuser_tc"] forState:UIControlStateNormal];
    }
    else if([[Language currentLanguage] isEqualToString:@"sc"]){
        [changeUserButton setImage:[UIImage imageNamed:@"btn_changeuser_sc"] forState:UIControlStateNormal];
    }
}

- (void)alertViewHandler:(NSNotification *)notification
{
    NSDictionary* userInfo = [notification userInfo];
	NSString *alertMessage = [userInfo objectForKey:@"alertMessage"];
    UIFont *alertFont = [userInfo objectForKey:@"alertFont"];
    
//    CustomAlert *invalid = [[CustomAlert alloc]initWithTitle:@"" message:alertMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//    [invalid show];
//    [invalid release];
    
    NuCalAlert *invalid = [[NuCalAlert alloc]initWithTitle:@"" Subtitle:alertMessage CancelButtonTitle:[Language getText:@"ok"] ButtonTitle:nil];
    if(alertFont != nil){
        [invalid setSubTitleFont:alertFont];
    }
    [invalid show];
    [invalid release];
}

- (IBAction) buttonPressed:(id)button
{
    if (button == homeButton)
    {
        if (homeType == TYPE_ALERT_HOME) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"homeAlertButton" object:self userInfo:nil];
        }
        else if(homeType == NO_ALERT_HOME){
            [[NSNotificationCenter defaultCenter] postNotificationName:@"homeButton" object:self userInfo:nil];
        }
    }
    if (button == editButton){
        [[NSNotificationCenter defaultCenter] postNotificationName:@"editButton" object:self userInfo:nil];
    }
    if (button == backButton){
        [[NSNotificationCenter defaultCenter] postNotificationName:@"backButton" object:self userInfo:nil];
    }
    
    if (button == changeUserButton){
        NSLog(@"changeuser");
        mainController.newUser = NO;
        NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: @"ChooseUser", @"view", @"home", @"mode", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
    }
}

- (void) homeButton:(NSNotification *)notification
{
    mainController.newUser = NO;
    NSString *view = @"Menu";
	NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", nil];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
    id appDelegate = [[UIApplication sharedApplication] delegate];
    UIWindow *window = [appDelegate window];
    for(UIView* sub in [window subviews]){
        NSLog(@"%@", [sub class]);
        if ([sub class] == NSClassFromString(@"NuCalAlert")) {
            [sub setAlpha:0];
            [sub dismiss];
            break;
        }
    }
}


- (void) dumpFonts
{
    for (NSString *fontName in [UIFont familyNames])
    {
        NSLog(@"fontName = %@", fontName);
        for (NSString *familyMemberName in [UIFont fontNamesForFamilyName:fontName])
        {
            NSLog(@"- fmailyMemberName = %@", familyMemberName);
        }
    }
}
@end
