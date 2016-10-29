//
//  IntakeHistory.m
//  NUCal
//
//  Created by MGIE on 07/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IntakeHistory.h"

@implementation IntakeHistory

@synthesize intakeDate, intakeFoodList, totalEnergy, totalProtein, totalFat, totalSatFat, totalTranFat, totalCar,totalFibre, totalSodium, totalSugar, energyBarVal, proteinBarVar, totalFatBarVal, SatFatBarVal, TranFatBarVal, choBarVal, carBarVal, fibreBarValue, sodiumBarVal, sugarBarVal, overTake, energyRequired, totalCho;



-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:intakeDate forKey:@"intakeDate"];
    [encoder encodeObject:intakeFoodList forKey:@"intakeFoodList"];

    [encoder encodeObject:[NSString stringWithFormat:@"%f", totalEnergy] forKey:@"totalEnergy"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", totalProtein] forKey:@"totalProtein"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", totalFat] forKey:@"totalFat"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", totalSatFat] forKey:@"totalSatFat"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", totalTranFat] forKey:@"totalTranFat"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", totalCho] forKey:@"totalCho"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", totalCar] forKey:@"totalCar"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", totalFibre] forKey:@"totalFibre"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", totalSodium] forKey:@"totalSodium"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", totalSugar] forKey:@"totalSugar"];
    
    [encoder encodeObject:[NSString stringWithFormat:@"%f", energyBarVal] forKey:@"energyBarVal"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", proteinBarVar] forKey:@"proteinBarVar"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", totalFatBarVal] forKey:@"totalFatBarVal"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", SatFatBarVal] forKey:@"SatFatBarVal"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", TranFatBarVal] forKey:@"TranFatBarVal"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", choBarVal] forKey:@"choBarVal"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", carBarVal] forKey:@"carBarVal"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", fibreBarValue] forKey:@"fibreBarValue"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", sodiumBarVal] forKey:@"sodiumBarVal"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", sugarBarVal] forKey:@"sugarBarVal"];
    
    [encoder encodeBool:overTake forKey:@"overTake"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", energyRequired] forKey:@"energyRequired"];
}

-(id)initWithCoder:(NSCoder*)decoder
{
    // Init first.
    if ((self = [super init]))
    {
        self.intakeDate = [decoder decodeObjectForKey:@"intakeDate"];
        self.intakeFoodList = [decoder decodeObjectForKey:@"intakeFoodList"];
        
        self.totalEnergy = [[decoder decodeObjectForKey:@"totalEnergy"] floatValue];
        self.totalProtein = [[decoder decodeObjectForKey:@"totalProtein"] floatValue];
        self.totalFat = [[decoder decodeObjectForKey:@"totalFat"] floatValue];
        self.totalSatFat = [[decoder decodeObjectForKey:@"totalSatFat"] floatValue];
        self.totalTranFat = [[decoder decodeObjectForKey:@"totalTranFat"] floatValue];
        self.totalCho = [[decoder decodeObjectForKey:@"totalCho"] floatValue];
        self.totalCar = [[decoder decodeObjectForKey:@"totalCar"] floatValue];
        self.totalFibre = [[decoder decodeObjectForKey:@"totalFibre"] floatValue];
        self.totalSodium = [[decoder decodeObjectForKey:@"totalSodium"] floatValue];
        self.totalSugar = [[decoder decodeObjectForKey:@"totalSugar"] floatValue];
        
        self.energyBarVal = [[decoder decodeObjectForKey:@"energyBarVal"] floatValue];
        self.proteinBarVar = [[decoder decodeObjectForKey:@"proteinBarVar"] floatValue];
        self.totalFatBarVal = [[decoder decodeObjectForKey:@"totalFatBarVal"] floatValue];
        self.SatFatBarVal = [[decoder decodeObjectForKey:@"SatFatBarVal"] floatValue];
        self.TranFatBarVal = [[decoder decodeObjectForKey:@"TranFatBarVal"] floatValue];
        self.choBarVal = [[decoder decodeObjectForKey:@"choBarVal"] floatValue];
        self.carBarVal = [[decoder decodeObjectForKey:@"carBarVal"] floatValue];
        self.fibreBarValue = [[decoder decodeObjectForKey:@"fibreBarValue"] floatValue];
        self.sodiumBarVal = [[decoder decodeObjectForKey:@"sodiumBarVal"] floatValue];
        self.sugarBarVal = [[decoder decodeObjectForKey:@"sugarBarVal"] floatValue];
        
        self.overTake = [decoder decodeBoolForKey:@"overTake"];
        self.energyRequired = [[decoder decodeObjectForKey:@"energyRequired"] floatValue];
    }
    
    return self;
}


- (id) initWithIntakeHistory : (NSDate*)_intakeDate List:(NSMutableArray*)_intakeFoodList TotalEnergy:(float)_totalEnergy TotalProtein:(float)_totalProtein TotalFat:(float)_totalFat TotalSatFat:(float)_totalSatFat TotalTranFat:(float)_totalTranFat TotalCho:(float)_totalCho TotalCar:(float)_totalCar TotalFibre:(float)_totalFibre TotalSodium:(float)_totalSodium TotalSugar:(float)_totalSugar EnergyPercent:(float)_energyBarVal ProteinPercent:(float)_proteinBarVar TotalFatPercent:(float)_totalFatBarVal SatFatPercent:(float)_SatFatBarVal TranFatPercent:(float)_TranFatBarVal ChoBarPercent:(float)_choBarVal CarPercent:(float)_carBarVal FibrePercent:(float)_fibreBarValue SodiumPercent:(float)_sodiumBarVal SugarPercent:(float)_sugarBarVal OverTake:(BOOL)_overTake EnergyRequired:(float)_energyRequired
//- (id) initWithIntakeHistory : (NSDate*)_intakeDate List:(NSMutableArray*)intakeFoodList TotalEnergy:(float)totalEnergy TotalProtein:(float)totalProtein TotalFat:(float)totalFat TotalSatFat:(float)totalSatFat TotalTranFat:(float)totalTranFat TotalCar:(float)totalCar TotalFibre:(float)totalFibre TotalSodium:(float)totalSodium TotalSugar:(float)totalSugar EnergyPercent:(float)energyBarVal ProteinPercent:(float)proteinBarVar TotalFatPercent:(float)totalFatBarVal SatFatPercent:(float)SatFatBarVal TranFatPercent:(float)TranFatBarVal CarPercent:(float)carBarVal FibrePercent:(float)fibreBarValue SodiumPercent:(float)sodiumBarVal SugarPercent:(float)sugarBarVal OverTake:(BOOL)overTake EnergyRequired:(float)energyRequired

{
    if ((self = [super init]))
    {
        self.intakeDate = _intakeDate;
        self.intakeFoodList = _intakeFoodList;
        self.totalEnergy = _totalEnergy;
        self.totalProtein = _totalProtein;
        self.totalFat = _totalFat;
        self.totalSatFat = _totalSatFat;
        self.totalTranFat = _totalTranFat;
        self.totalCho = _totalCho;
        self.totalCar = _totalCar;
        self.totalFibre = _totalFibre;
        self.totalSodium = _totalSodium;
        self.totalSugar = _totalSugar;
        
        self.energyBarVal = _energyBarVal;
        self.proteinBarVar = _proteinBarVar;
        self.totalFatBarVal = _totalFatBarVal;
        self.SatFatBarVal = _SatFatBarVal;
        self.TranFatBarVal = _TranFatBarVal;
        self.choBarVal = _choBarVal;
        self.carBarVal = _carBarVal;
        self.fibreBarValue = _fibreBarValue;
        self.sodiumBarVal = _sodiumBarVal;
        self.sugarBarVal = _sugarBarVal;
        
        self.overTake = _overTake;
        self.energyRequired = _energyRequired;
    }
    
    return self;
}

//- (void)printFood{
//    NSLog(@"\nFood Name: %@\nNuType: %@\nWeight: %f\nEnergyType: %@\nEnergy: %f\nProtein: %f\nTotalFat: %f\nSaturatedFat: %f\nTransFay: %f\nCarbohydratesType: %@\nCarbohydrates: %f\nDietaryFibre: %f\nSugars: %f\nSodium: %f\nFood ID: %i", name,type==PER100GML ? @"per100g/mL" : @"per serving", weight, energyType==KCAL ? @"kcal" : @"kJ", energy, protein, totalFat, saturatedFat, transFat, carbohydratesType==CARBOHYDRATES ? @"Carbohydrates" : (carbohydratesType==TOTALCARBOHYDRATES ? @"Total Carbohydrates" : @"Available Carbohydrates"), carbohydrates, dietaryFibre, sugars, sodium, foodID);
//}

@end

