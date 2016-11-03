//
//  Food.m
//  NUCal
//
//  Created by MGIECA2011006 on 31/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Food.h"
#import "NUCalViewController.h"

@implementation Food

extern NUCalViewController *mainController;

@synthesize name, type, unitType, weight, energyType, energy, protein, totalFat, saturatedFat, transFat, cholesterol , carbohydratesType, carbohydrates, dietaryFibre, sugars, sodium, foodID;

-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:name forKey:@"name"];
    [encoder encodeObject:[NSString stringWithFormat:@"%d", type] forKey:@"type"];
    [encoder encodeObject:[NSString stringWithFormat:@"%d", unitType] forKey:@"unitType"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", weight] forKey:@"weight"];
    [encoder encodeObject:[NSString stringWithFormat:@"%d", energyType] forKey:@"energyType"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", energy] forKey:@"energy"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", protein] forKey:@"protein"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", totalFat] forKey:@"totalFat"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", saturatedFat] forKey:@"saturatedFat"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", transFat] forKey:@"transFat"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", cholesterol] forKey:@"cholesterol"];
    [encoder encodeObject:[NSString stringWithFormat:@"%ld", (long)carbohydratesType] forKey:@"carbohydratesType"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", carbohydrates] forKey:@"carbohydrates"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", dietaryFibre] forKey:@"dietaryFibre"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", sugars] forKey:@"sugars"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", sodium] forKey:@"sodium"];
    [encoder encodeObject:[NSString stringWithFormat:@"%i", foodID] forKey:@"foodID"];
}

-(id)initWithCoder:(NSCoder*)decoder
{
    // Init first.
    if ((self = [super init]))
    {
        self.name = [decoder decodeObjectForKey:@"name"];
        self.type = [[decoder decodeObjectForKey:@"type"] intValue];
        self.unitType = [[decoder decodeObjectForKey:@"unitType"] intValue];
        self.weight = [[decoder decodeObjectForKey:@"weight"] floatValue];
        self.energyType = [[decoder decodeObjectForKey:@"energyType"] intValue];
        self.energy = [[decoder decodeObjectForKey:@"energy"] floatValue];
        self.protein = [[decoder decodeObjectForKey:@"protein"] floatValue];
        self.totalFat = [[decoder decodeObjectForKey:@"totalFat"] floatValue];
        self.saturatedFat = [[decoder decodeObjectForKey:@"saturatedFat"] floatValue];
        self.transFat = [[decoder decodeObjectForKey:@"transFat"] floatValue];
        self.cholesterol = [[decoder decodeObjectForKey:@"cholesterol"] floatValue];
        self.carbohydratesType = [[decoder decodeObjectForKey:@"carbohydratesType"] intValue];
        self.carbohydrates = [[decoder decodeObjectForKey:@"carbohydrates"] floatValue];
        self.dietaryFibre = [[decoder decodeObjectForKey:@"dietaryFibre"] floatValue];
        self.sugars = [[decoder decodeObjectForKey:@"sugars"] floatValue];
        self.sodium = [[decoder decodeObjectForKey:@"sodium"] floatValue];
        self.foodID = [[decoder decodeObjectForKey:@"foodID"] intValue];
    }
    
    return self;
}


- (id) initWithFood : (NSString*)_name Type:(int)_type UnitType:(int)_unitType Weight:(float)_weight Energy:(float)_energy EnergyType:(int)_energyType Protein:(float)_protein TotalFat:(float)_totalFat SaturatedFat:(float)_saturatedFat TransFat:(float)_transFat Cholesterol:(float)_cholesterol CarbohydratesType:(NSInteger)_carbohydratesType Carbohydrates:(float)_carbohydrates DietaryFibre:(float)_dietaryFibre Sugars:(float)_sugars Sodium:(float)_sodium ID:(int)_foodID
{
    if ((self = [super init]))
    {
        self.name = _name;
        self.type = _type;
        self.unitType = _unitType;
        self.weight = _weight;
        self.energy = _energy;
        self.energyType = _energyType;
        self.protein = _protein;
        self.totalFat = _totalFat;
        self.saturatedFat = _saturatedFat;
        self.transFat = _transFat;
        self.cholesterol = _cholesterol;
        self.carbohydratesType = _carbohydratesType;
        self.carbohydrates = _carbohydrates;
        self.dietaryFibre = _dietaryFibre;
        self.sugars = _sugars;
        self.sodium = _sodium;
        self.foodID = _foodID;
    }
    
    return self;
}

- (id) initWithFoodCopy : (Food*)inFood
{
    if ((self = [super init]))
    {
        self.name = inFood.name;
        self.type = inFood.type;
        self.unitType = inFood.unitType;
        self.weight = inFood.weight;
        self.energy = inFood.energy;
        self.energyType = inFood.energyType;
        self.protein = inFood.protein;
        self.totalFat = inFood.totalFat;
        self.saturatedFat = inFood.saturatedFat;
        self.transFat = inFood.transFat;
        self.cholesterol = inFood.cholesterol;
        self.carbohydratesType = inFood.carbohydratesType;
        self.carbohydrates = inFood.carbohydrates;
        self.dietaryFibre = inFood.dietaryFibre;
        self.sugars = inFood.sugars;
        self.sodium = inFood.sodium;
        self.foodID = inFood.foodID;
    }
    
    return self;
}

- (id) initWithFoodCopyTest : (Food*)inFood
{
    if ((self = [super init]))
    {
        //        self.name = inFood.name;
        self.name = [NSString stringWithFormat:@"%@ (%@)",inFood.name, mainController.currentProfile.userName];
        self.type = inFood.type;
        self.unitType = inFood.unitType;
        self.weight = inFood.weight;
        self.energy = inFood.energy;
        self.energyType = inFood.energyType;
        self.protein = inFood.protein;
        self.totalFat = inFood.totalFat;
        self.saturatedFat = inFood.saturatedFat;
        self.transFat = inFood.transFat;
        self.cholesterol = inFood.cholesterol;
        self.carbohydratesType = inFood.carbohydratesType;
        self.carbohydrates = inFood.carbohydrates;
        self.dietaryFibre = inFood.dietaryFibre;
        self.sugars = inFood.sugars;
        self.sodium = inFood.sodium;
        self.foodID = inFood.foodID;
    }
    
    return self;
}

- (void)printFood{
    NSLog(@"\nFood Name: %@\nNuType: %@\nWeight: %f\nEnergyType: %@\nEnergy: %f\nProtein: %f\nTotalFat: %f\nSaturatedFat: %f\nTransFay: %f\nCarbohydratesType: %@\nCarbohydrates: %f\nDietaryFibre: %f\nSugars: %f\nSodium: %f\nFood ID: %i", name,type==PER100GML ? @"per100g/mL" : @"per serving", weight, energyType==KCAL ? @"kcal" : @"kJ", energy, protein, totalFat, saturatedFat, transFat, carbohydratesType==CARBOHYDRATES ? @"Carbohydrates" : (carbohydratesType==TOTALCARBOHYDRATES ? @"Total Carbohydrates" : @"Available Carbohydrates"), carbohydrates, dietaryFibre, sugars, sodium, foodID);
}


- (NSComparisonResult)compareFatByFood:(Food*)infood
{
    if (self.totalFat < infood.totalFat)
        return NSOrderedAscending;
    else if (self.totalFat > infood.totalFat)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}

- (NSComparisonResult)compareSaltByFood:(Food*)infood
{
    if (self.sodium < infood.sodium)
        return NSOrderedAscending;
    else if (self.sodium > infood.sodium)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}

- (NSComparisonResult)compareSugarByFood:(Food*)infood
{
    if (self.sugars < infood.sugars)
        return NSOrderedAscending;
    else if (self.sugars > infood.sugars)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}



@end
