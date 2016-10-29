//
//  MyIntakeHistory.h
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IntakeHistoryCell.h"
#import "Profile.h"

@interface MyIntakeHistory : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    
    Profile *currentProfile;
    
    UILabel *lbl_name;
    UITableView *tv_historyList;
    
    IBOutlet UIImageView *user_icon;
    
    BOOL isEditing;
    
    NSMutableArray *tmpIntakeHistoryList;
    
}
@property (nonatomic, retain) IBOutlet UILabel *lbl_name;
@property (nonatomic, retain) IBOutlet UITableView *tv_historyList;
@property (nonatomic, retain) IBOutlet UIImageView *user_icon;

- (void)setMode:(int)mode;
- (void) storeProfile:(Profile*) profile;
@end
