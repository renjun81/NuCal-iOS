//
//  Profile.h
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Food.h"
#import "IntakeHistory.h"

#define MALE 0
#define FEMALE 1

#define LBS 0
#define KG 1

#define FT 0
#define METER 1

#define ASIAN 1
#define NONASIAN 2

#define AL_LOW 0
#define AL_MEDIUM 1
#define AL_HIGH 2




@interface Profile : NSObject {
    
    NSString *userName;
    int gender;
    float weight;
    int weightType;
    float height;
    float height_ft;
    float height_inch;
    int heightType;
    int age;
    int activityLv;
    int energyReq;
    UIImage* profile_pic;
    int asian;
    
    NSMutableArray *foodList; //Don't use after phase1
    NSMutableArray *intakeList;
    NSMutableArray *intakeHistoryList;
}

@property (nonatomic, retain) NSString *userName;
@property (nonatomic) int asian; 
@property (nonatomic) int gender;
@property (nonatomic) float weight;
@property (nonatomic) int weightType;
@property (nonatomic) float height;
@property (nonatomic) float height_ft;
@property (nonatomic) float height_inch;
@property (nonatomic) int heightType;
@property (nonatomic) int age;
@property (nonatomic) int activityLv;
@property (nonatomic) int energyReq;
@property (nonatomic, retain) UIImage *profile_pic;
@property (nonatomic, retain) NSMutableArray *foodList; //Don't use after phase1
@property (nonatomic, retain) NSMutableArray *intakeList;
@property (nonatomic, retain) NSMutableArray *intakeHistoryList;


- (id) initWithProfile:(Profile *)profile;
- (id) initWithData:(NSString*)_name Gender:(int)_gender Weight:(float)_weight WeightType:(float)_weightType Height:(float)_height Height_ft:(float)_height_ft  Height_inch:(float)_height_inch HeightType:(int)_heightType Age:(int)_age ActivityLv:(int)_activityLv EnergyReq:(int)_energyReq ProfilePic:(UIImage *)_profilePic Asian:(int)_asian;
- (id) updateProfile:(Profile*) profile;
- (NSMutableArray*) getIntakeList;
- (void) setIntakeList:(NSMutableArray*) inIntakeList;

- (void) addIntakeHistory:(IntakeHistory*) intakeHistory;
- (void) removeIntakeHistory:(IntakeHistory*) intakeHistory;
- (NSMutableArray*) getIntakeHistoryList;
- (void) setIntakeHistoryList:(NSMutableArray*) inIntakeHistoryList;
- (void) setEnergyRequirment:(int)req;
- (void) setProfilePic:(UIImage*) profile_pic;
//- (void) setAsian:(int)asian;

- (void) addFood :(Food*) food; //Don't use after phase1
- (void) removeFood:(Food*) food; //Don't use after phase1
- (NSMutableArray*) getFoodList; //Don't use after phase1
- (void) setFoodList:(NSMutableArray*) inFoodList; //Don't use after phase1
- (void) addIntake :(Food*) intake; //Don't use after phase1
- (void) removeIntake:(Food*) intake; //Don't use after phase1

@end
