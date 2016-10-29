//
//  FoodList.h
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

#import "Food.h"
#import "FoodListCell.h"
#import "Profile.h"

@interface FoodList : UIViewController <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource ,GKPeerPickerControllerDelegate,GKSessionDelegate>{
    
    Profile *currentProfile;
    
    IBOutlet UIImageView *user_icon;
    IBOutlet UIImageView *im_orderType;
    
    IBOutlet UIView *v_picker;
    IBOutlet UIButton *btn_orderType;
    IBOutlet UIPickerView *order_picker;
    NSArray *order_arr;
    IBOutlet UIButton *picker_btn_confirm;
    IBOutlet UIButton *picker_btn_cancel;
    NSInteger orderType;
    
    
    IBOutlet UILabel *lbl_name;
    UILabel *lbl_selectFood;
    UILabel *lbl_detail;
    IBOutlet UISearchBar *sb_food;
    IBOutlet UITableView *tv_food;
    IBOutlet UIButton *btn_myIntake;
    IBOutlet UIButton *btn_share;
    NSMutableArray *foodDictionary;
    NSMutableArray *tmpIntakeList;
    NSMutableArray *countArray;
    BOOL isEditing;
    
    
    IBOutlet UILabel *lbl_lowfat;
    IBOutlet UILabel *lbl_lowsalt;
    IBOutlet UILabel *lbl_lowsugar;
    IBOutlet UILabel *lbl_3low;
    
    UIImageView *v_lowfat;
    UIImageView *v_lowsalt;
    UIImageView *v_lowsugar;
    UIImageView *v_lowthree;
    
    GKPeerPickerController *mPicker;
	GKSession *mSession;
    NSMutableArray *mPeers;
    
    NSTimer *blueToothTimer;
    BOOL received;
    
    IBOutlet UIView *loadingView;
    IBOutlet UIActivityIndicatorView *processbar;
}
@property (nonatomic, retain) IBOutlet UISearchBar *sb_food;
@property (nonatomic, retain) IBOutlet UIButton *btn_myIntake;
@property (nonatomic, retain) IBOutlet UITableView *tv_food;
@property (nonatomic, retain) IBOutlet UILabel *lbl_name;
@property (nonatomic, retain) IBOutlet UILabel *lbl_selectFood;
@property (nonatomic, retain) IBOutlet UILabel *lbl_detail;
@property (nonatomic, retain) IBOutlet UIView *loadingView;
@property (retain) GKSession *mSession;

- (void) setMode:(int)mode;
- (void) initFoodDictionary;
- (void) initIntakeList;
- (void) addIntake:(int)intakeNum;
- (NSMutableArray*) getIntakeFoodList:(NSMutableArray*) getList;
- (NSMutableArray*)getIntakeFoodListBlueTooth:(NSMutableArray*) getList;
- (NSMutableArray*) filterFoodExcept:(NSString*) key forFoodlist:(NSMutableArray*) inFoodList;
//- (NSString*) getPeerName:(NSString*) test;
- (void) removeIntake:(int)intakeNum;
- (void) pickerViewOpen;
- (void) pickerViewClose;
- (void) disableBlueTooth;
- (void) refreshPage;
- (void) blueToothThread:(NSTimer *)theTimer;
- (void) storeProfile:(Profile*) profile;
- (void) storeIntake;

- (IBAction)buttonPress:(id)sender;
- (IBAction)sorting:(id)sender;
- (IBAction)picker_cancel:(id)sender;
- (IBAction)picker_confirm:(id)sender;
- (IBAction)connectClicked:(id)sender;

- (void) initWithProfile:(Profile*) profile;


@end
