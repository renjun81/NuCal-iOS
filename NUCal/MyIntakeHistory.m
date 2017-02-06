//
//  MyIntakeHistory.m
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyIntakeHistory.h"
#import "NUCalViewController.h"

@implementation MyIntakeHistory
@synthesize user_icon;
@synthesize lbl_name;
@synthesize tv_historyList;

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
    [tv_historyList release];
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
    // Do any additional setup after loading the view from its nib.
    isEditing = NO;
    
    [self initWithProfile:mainController.currentProfile];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editIntakeHistory:) name:@"editButton" object:nil];
    
    NSString *view2 = [Language getText:@"my_intake_history"];
//    @"My Intake History";
    NSString *isHidden = @"NO";
    NSString *buttonMode = @"edit";
	NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
    
    [lbl_name setText:mainController.currentProfile.userName];
    [tv_historyList setDelegate:self];
    [tv_historyList setDataSource:self];
    
    if (IS_IPHONE5()){
        // 1) handle view size
        int extra = MY_EXTRA_HEIGHT() / 2;
        CGRect a1 = self.view.frame;
        a1.size.height += extra - 10; // increase view size by 88
        self.view.frame = a1;
        // debug
        NSUInteger tag = self.view.tag;
        int h = self.view.frame.size.height;
        int y = self.view.frame.origin.y;
        NSString *a = [[NSString alloc] initWithFormat:@"UIView tag%lu, y=%d, h=%d", (unsigned long)tag, y, h ];
        NSLog(@"--- %@", a);
        [a release];
        
        // 2) handle tableview height
        // CGRect a2 = tv_historyList.frame;
        // a2.size.height += 0;
        // tv_historyList.frame = a2;
        
        // debug
        tag = tv_historyList.tag;
        h = tv_historyList.frame.size.height;
        y = tv_historyList.frame.origin.y;
        NSString *b = [[NSString alloc] initWithFormat:@"TableView tag%lu, y=%d, h=%d", (unsigned long)tag, y, h ];
        NSLog(@"--- %@", b);
        [b release];
        
    } else {
    } // if end
    // code - add iphone5 support by csa4 - 4.6.2014
    
    tmpIntakeHistoryList = [[NSMutableArray alloc]initWithArray:[mainController.currentProfile getIntakeHistoryList]];
    
//    NSLog(@"count:%i",[tmpIntakeHistoryList count]);
//    
//    if([[currentProfile getIntakeHistoryList] count] >= 30){
//        NuCalAlert *tooManyIntakeAlert = [[NuCalAlert alloc]initWithTitle:nil Subtitle:[Language getText:@"alert_too_many_food"] CancelButtonTitle:[Language getText:@"ok"] ButtonTitle:nil];
//        [tooManyIntakeAlert show];
//        [tooManyIntakeAlert release];
//    }
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
    [self setTv_historyList:nil];
    [user_icon release];
    user_icon = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)setMode:(int)mode{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if([[mainController.currentProfile getIntakeHistoryList] count] <= 30){
        if ([[mainController.currentProfile getIntakeHistoryList] count] == 0)
            return 1;
        else
            return [[mainController.currentProfile getIntakeHistoryList] count];
    }
    else{
        return 30;
    }
}

//- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
//	[super setEditing:editing animated:animated];
//	if(editing) {
//		self.navigationItem.rightBarButtonItem.enabled = NO;
//	} else {
//		self.navigationItem.rightBarButtonItem.enabled = YES;
//	}
//}

- (void)editIntakeHistory:(NSNotification *)notification{
    [tv_historyList setEditing:!tv_historyList.editing];
    
    if(tv_historyList.editing){
        isEditing = YES;
    }
    else{
        isEditing = NO;
    }
    
    if(tv_historyList.editing){
        isEditing = YES;
        NSString *view2 = [Language getText:@"my_intake_history"];
        NSString *isHidden = @"NO";
        NSString *buttonMode = @"Cancel";
        NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
        
//        self.navigationItem.rightBarButtonItem.enabled = NO;
    }
    else{
        isEditing = NO;
        NSString *view2 = [Language getText:@"my_intake_history"];
        NSString *isHidden = @"NO";
        NSString *buttonMode = @"edit";
        NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
        
//        self.navigationItem.rightBarButtonItem.enabled = YES;
    }
    [tv_historyList reloadData];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath 
{
    if([[mainController.currentProfile getIntakeHistoryList] count] > 0)
    {
    return isEditing;
    }
    else
    {
        return NO;
    }
}
//
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:
//(NSIndexPath *)indexPath
//{
//    if(indexPath.row <= 0)
//    {
//        return UITableViewCellEditingStyleInsert;
//    }
//    else
//    {
//        return UITableViewCellEditingStyleDelete;
//    }
//}
////
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) 
        {
        int intakeIndex = [[mainController.currentProfile getIntakeHistoryList] count]- 1 - indexPath.row;
        //NSString *intakeHistory = [NSString stringWithFormat:@"%lu", [[mainController.currentProfile getIntakeHistoryList] count]- 1 - indexPath.row];
        //intakeIndex = [intakeHistory intValue];
            
            
            if([[mainController.currentProfile getIntakeHistoryList] count] > 0){ 
            [[mainController.currentProfile getIntakeHistoryList] removeObjectAtIndex:intakeIndex];
            }
            
            if([tmpIntakeHistoryList count] >0){
            [tmpIntakeHistoryList removeObjectAtIndex:intakeIndex];
            }
            
            [mainController.currentProfile setIntakeHistoryList:tmpIntakeHistoryList];
            [self storeProfile:mainController.currentProfile];
            [tv_historyList reloadData];
        }
    
    if([[mainController.currentProfile getIntakeHistoryList] count] <=0){
        isEditing = NO;
        
        NSString *view2 = [Language getText:@"my_intake_history"];
        NSString *isHidden = @"NO";
        NSString *buttonMode = @"edit";
        NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
    }
}

- (void) storeProfile:(Profile*) profile
{
    [Tool setProfile:profile];
    [mainController reloadCurrentProfile];
}

-(IntakeHistoryCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
  	IntakeHistoryCell *cell = (IntakeHistoryCell*)[tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"Cell %li",(long)indexPath.section]];
    
    UIView *cellBackView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    cellBackView.backgroundColor = [UIColor clearColor];
    
    
	if (cell == nil) {
        if ([[mainController.currentProfile getIntakeHistoryList] count] > 0)
        {
            cell = [[[IntakeHistoryCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[NSString stringWithFormat:@"Cell %li",(long)indexPath.section] detailIcon:NO]autorelease];
        }
        else
        {
            cell = [[[IntakeHistoryCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[NSString stringWithFormat:@"Cell %li",(long)indexPath.section] detailIcon:YES]autorelease];
        }

    }
    
    if([tableView isEditing]){
        NSLog(@"edit");
        [cell setCellBeginEditingPos];
    }
    else{
        NSLog(@"noEdit");
        if([tmpIntakeHistoryList count] > 0){
        [cell setCellEndEditingPos];
        }
    }
    
    if ([[mainController.currentProfile getIntakeHistoryList] count] > 0)
    {
        NSDate *cellData = [[[mainController.currentProfile getIntakeHistoryList]objectAtIndex:[[mainController.currentProfile getIntakeHistoryList] count]- 1 - indexPath.row] intakeDate];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        
        
        NSLocale *locale;
        if([[Language currentLanguage] isEqualToString: @"zh"]){
            locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh-Hant"];
            [formatter setDateFormat:@"yyyy年MMMdd日 a hh:mm"];
        }
        else if([[Language currentLanguage] isEqualToString: @"sc"]){
            locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh-Hans"];
            [formatter setDateFormat:@"yyyy年MMMdd日 a hh:mm"];
        }
        else //if([[Language currentLanguage] isEqualToString: @"en"])
        {
            locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
            [formatter setDateFormat:@"yyyy MMM dd 'at' hh:mm a"];
        }
    
        [formatter setLocale:locale];
        
        NSString *dateStr = [formatter stringFromDate:cellData];
        
        [cell setID:[[mainController.currentProfile getIntakeHistoryList] count]- 1 - indexPath.row];
        [[cell textLabel] setText:dateStr];
        [[cell textLabel]setFont:[UIFont systemFontOfSize:18]];
        
        BOOL isOver = [[[mainController.currentProfile getIntakeHistoryList]objectAtIndex:[[mainController.currentProfile getIntakeHistoryList] count]- 1 - indexPath.row] overTake];
        
        if(isOver){
            [[cell textLabel]setTextColor:[UIColor colorWithRed:200/255.0 green:0 blue:0 alpha:1.0]];
        }
        else{
            [[cell textLabel]setTextColor:lbl_name.textColor];
        }
        [cell setOver:isOver];
        [formatter release];
    }
    else
    {
        [[cell textLabel] setText:[Language getText:@"no_record"]];
        [[cell textLabel] setFrame:CGRectMake(20, 0, 200, 35)];
        [[cell textLabel] setFont:[UIFont systemFontOfSize:18]];
        [[cell textLabel] setTextColor:[UIColor blackColor]];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    // code - fix cell background color problem by CSA4 - 2014.11.15
    // for iOS 6.1 and below - there is no need to change the BackgroundColor of the cell
    // for iOS 7.0 and above - you need to need to change the BackgroundColor of the cell
    [cell setBackgroundColor: [UIColor clearColor]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([[mainController.currentProfile getIntakeHistoryList] count] > 0)
    {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        NSString *view = @"MyIntakeHistoryDetail";
        NSInteger idx = [[mainController.currentProfile getIntakeHistoryList] count]- 1 - indexPath.row;
        NSString *mode = [NSString stringWithFormat:@"%u", idx];
        
        NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view",mode, @"mode", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
    }
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
