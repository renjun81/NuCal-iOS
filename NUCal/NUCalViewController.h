//
//  NUCalViewController.h
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Profile.h"
#import "Food.h"
#import "Tool.h"
#import "UserProfile.h"
#import "NuCalAlert.h"
#import "Language.h"
#import "ChooseUser.h"

#define NO_ALERT_HOME 0
#define TYPE_ALERT_HOME 1

@interface NUCalViewController : UIViewController<NuCalAlertDelegate> {
    
    int homeType;
    BOOL firstRun;
    Profile *currentProfile;
    NSInteger currentProfileIndex;
    BOOL isHome;
    BOOL newUser;
    
    UIViewController *currentViewController;
    UIViewController *prevViewController;
    UIViewController *nextViewController;
    
    IBOutlet UIView *contentView;
    IBOutlet UIView *navigationView;
    IBOutlet UILabel *navigationTitle;
    IBOutlet UIButton *editButton;
    IBOutlet UIButton *backButton;
    IBOutlet UIButton *homeButton;
    IBOutlet UIButton *changeUserButton;
    
    IBOutlet UISegmentedControl *segmentedControl;
    
    IBOutlet UIView *v_version;
}

@property(nonatomic) NSInteger currentProfileIndex;
@property(nonatomic) BOOL firstRun, isHome, newUser;
@property(nonatomic, retain) Profile *currentProfile;

- (void) init;
- (void) reloadCurrentProfile;

- (void)loadViewHandler:(NSNotification *)notification;
//- (int)getPageNumberFromPage:(NSString *)page;
- (void)updateNavigationHandler:(NSNotification *)notification;
- (void)alertViewHandler:(NSNotification *)notification;

- (void)homeButton:(NSNotification *)notification;
//- (void)backButton:(NSNotification *)notification;
//- (void)editButton:(NSNotification *)notification;

- (IBAction) buttonPressed:(id)button;

- (void) dumpFonts;

- (void) testWriteProfile;
- (void) testReadProfile;

@end
