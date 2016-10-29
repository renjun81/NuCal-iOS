//
//  Food.h
//  NUCal
//
//  Created by MGIECA2011006 on 31/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PER100GML 0
#define PERSERVING 1
#define PER100ML 2

#define KCAL 0
#define KJ 1

#define CARBOHYDRATES 0
#define TOTALCARBOHYDRATES 1
#define AVAILABLECARBOHYDRATES 2

#define g 0
#define ml 1

@interface Food : NSObject {
    NSString *name;
    int type;
    int unitType;
    float weight;
    float energy;
    int energyType;
    float protein;
    float totalFat;
    float saturatedFat;
    float transFat;
    float cholesterol;
    int carbohydratesType;
    float carbohydrates;
    float dietaryFibre;
    float sugars;
    float sodium;
    int foodID;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic) int type;
@property (nonatomic) int unitType;
@property (nonatomic) float weight;
@property (nonatomic) float energy;
@property (nonatomic) int energyType;
@property (nonatomic) float protein;
@property (nonatomic) float totalFat;
@property (nonatomic) float saturatedFat;
@property (nonatomic) float transFat;
@property (nonatomic) float cholesterol;
@property (nonatomic) int carbohydratesType;
@property (nonatomic) float carbohydrates;
@property (nonatomic) float dietaryFibre;
@property (nonatomic) float sugars;
@property (nonatomic) float sodium;
@property (nonatomic) int foodID;

- (id) initWithFood : (NSString*)_name Type:(int)_type UnitType:(int)_unitType Weight:(float)_weight Energy:(float)_energy EnergyType:(int)_energyType Protein:(float)_protein TotalFat:(float)_totalFat SaturatedFat:(float)_saturatedFat TransFat:(float)_transFat Cholesterol:(float)_cholesterol CarbohydratesType:(int)_carbohydratesType Carbohydrates:(float)_carbohydrates DietaryFibre:(float)_dietaryFibre Sugars:(float)_sugars Sodium:(float)_sodium ID:(int)_foodID;
- (id) initWithFoodCopy : (Food*)inFood;
- (id) initWithFoodCopyTest : (Food*)inFood;

- (void)printFood;


- (NSComparisonResult)compareFatByFood:(Food*)infood;
- (NSComparisonResult)compareSaltByFood:(Food*)infood;
- (NSComparisonResult)compareSugarByFood:(Food*)infood;

@end
