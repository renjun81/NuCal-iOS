//
//  ChooseUser.m
//  NUCal
//
//  Created by MGIE on 2/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ChooseUser.h"
#import "NUCalViewController.h"

extern NUCalViewController *mainController;


@implementation ChooseUser

@synthesize  table_user, profileArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editUserList:) name:@"editButton" object:nil];
    
    NSString *view2 = [Language getText:@"user_profile"];
    NSString *isHidden = @"NO";
    NSString *buttonMode = @"edit";
	NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];

    profileArray = [[NSMutableArray alloc] initWithArray: [Tool getProfile]];
    cellArray = [[NSMutableArray alloc] init];
    
    [b_adduser setTitle:[Language getText:@"add_user"] forState:UIControlStateNormal];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [cellArray release];
    [b_adduser release];
    [table_user release];
    [profileArray release];
    [super dealloc];
}

- (void)setMode:(int)mode
{
    
}

- (IBAction)addUser:(id)sender {
    
    mainController.newUser = YES;
    NSString *view = @"UserProfile";
    NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
    
}

- (void) loadUserDetail:(id)sender
{
    mainController.newUser = NO;
    mainController.currentProfile = [profileArray objectAtIndex:[sender tag]];
    
    NSString *view = @"UserProfile";
    NSString *profileIndex = [NSString stringWithFormat:@"%li", (long)[sender tag]];
    NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", profileIndex, @"index", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
}

- (void)editUserList:(NSNotification *)notification{
    [table_user setEditing:!table_user.editing];

    if(table_user.editing){
        isEditing = YES;
    }
    else{
        isEditing = NO;
    }
    
    if(table_user.editing){
        NSString *view2 = [Language getText:@"user_profile"];
        NSString *isHidden = @"NO";
        NSString *buttonMode = @"Cancel";
        NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
    }
    else{
        NSString *view2 = [Language getText:@"user_profile"];
        NSString *isHidden = @"NO";
        NSString *buttonMode = @"edit";
        NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys: view2, @"title", buttonMode, @"buttonMode", isHidden, @"isHidden", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateNavigation" object:self userInfo:dictionary2];
    }
    [table_user reloadData];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath 
{
    return isEditing;
}

-(MultiUserCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSInteger row = indexPath.row;
    
    MultiUserCell *cell = (MultiUserCell*)[tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"Cell %li",(long)indexPath.section]];
    
    if (cell == nil) {
        cell = [[[MultiUserCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[NSString stringWithFormat:@"Cell %li",(long)indexPath.section] profile:[profileArray objectAtIndex:row] row:(NSInteger)indexPath.row]autorelease];
    }
    [cell setTag:row];
    
    UIView *cellBackView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    cellBackView.backgroundColor = [UIColor clearColor];
    cell.backgroundView = cellBackView;

    if (row == [Tool getDefaultProfile])
        [cell.b_select setSelected:YES];
    
        [cell.b_detail setTag:row];
        [cell.b_detail addTarget:self action:@selector(loadUserDetail:) forControlEvents:UIControlEventTouchUpInside];
    
    if ([cellArray count] > indexPath.row)
        [cellArray replaceObjectAtIndex:indexPath.row withObject:cell];
    else
        [cellArray addObject:cell];
    
    if([tableView isEditing]){
        [cell setCellBeginEditingPos];
    }
    else{
        [cell setCellEndEditingPos];
        }
    
    return  cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) 
    {
        NSInteger userIndex = indexPath.row;
        
        NSLog(@"index:%li", (long)userIndex);
        
        if ([profileArray count] > 1)
        {
            [profileArray removeObjectAtIndex:userIndex];
            [Tool setProfileList:profileArray];
            
            if(userIndex == 0)
            {
                [Tool setDefaultProfile:userIndex];
                mainController.currentProfileIndex = userIndex;
            }
            else
            {
                [Tool setDefaultProfile:userIndex -1];
                mainController.currentProfileIndex = userIndex -1;
            }
            mainController.currentProfile = [[Tool getProfile] objectAtIndex:mainController.currentProfileIndex];
            
//            [table_user reloadData];
            NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: @"ChooseUser", @"view",@"-1", @"mode", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
        }
    }
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [profileArray count];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *profileList = [Tool getProfile];
    
    if ([profileList count] > indexPath.row)
    {
        
        mainController.currentProfile = [[Tool getProfile] objectAtIndex:indexPath.row];
        [Tool setDefaultProfile:indexPath.row];
    
    }
    
    NSLog(@"selectIndex:%li",(long)indexPath.row);
    
    for (MultiUserCell *cell in cellArray)
    {
        [cell.b_select setSelected:NO];
    }
    [[(MultiUserCell*)[cellArray objectAtIndex:indexPath.row] b_select] setSelected:YES];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void) storeProfile:(Profile*) profile
{
    [Tool setProfile:profile];
    [mainController reloadCurrentProfile];
}


@end
