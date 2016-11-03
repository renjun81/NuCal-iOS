//
//  NuFormula.h
//  NUCal
//
//  Created by MGIE on 29/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Profile.h"
#import "Food.h"

@interface NuFormula : NSObject {

}

+(float)calBMIFromWeight:(float)weight inType:(int)weightType AndHeight:(float)height inType:(int)heightType;

+(float)lbsToKG:(float)lbs;

+(float)KGTolbs:(float)kg;

+(float)ftToM:(float)ft Inch:(float)inch ;

+(NSMutableArray*)MToft:(float)m;

+(float)KcalToKj:(float)kcal;

+(float)KjToKcal:(float)kj;

+(float)calEnergyRequirment:(Profile*)profile;

+(float)calProteinIntake:(Profile*)profile;

+(float)calTotalFatIntake:(Profile*)profile;
+(float)calSatFatIntake:(Profile*)profile;
+(float)calTranFatIntake:(Profile*)profile;
+(float)calCarbohydratesIntake:(Profile*)profile;
+(float)calFibreIntake;
+(float)calSugarIntake:(Profile*)profile;
+(float)calSodiumIntake;
+(float)calCholesterolIntake;

+(BOOL)calLowFat:(Food*)food;
+(BOOL)calLowSugar:(Food*)food;
+(BOOL)calLowSalt:(Food*)food;
+(BOOL)calThreeLow:(Food *)food;
@end
