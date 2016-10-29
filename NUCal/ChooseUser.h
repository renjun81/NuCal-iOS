//
//  ChooseUser.h
//  NUCal
//
//  Created by MGIE on 2/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MultiUserCell.h"
#import "Profile.h"
#import "UserProfile.h"

@interface ChooseUser : UIViewController <UITableViewDataSource , UITableViewDelegate>{

    IBOutlet UIButton *b_adduser;
    IBOutlet UITableView *table_user;
    
//    NSInteger userIndex;
    
    NSMutableArray *profileArray;
    Profile *currentProfile;
    NSMutableArray *cellArray;
    
    BOOL isEditing;
}

@property (nonatomic, retain) IBOutlet UITableView *table_user;
@property (nonatomic, retain) NSMutableArray *profileArray;

- (void)setMode:(int)mode;
- (IBAction)addUser:(id)sender;
- (void) loadUserDetail:(id)sender;
- (void) storeProfile:(Profile*) profile;
@end
