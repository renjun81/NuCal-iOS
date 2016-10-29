//
//  IntakeHistory.h
//  NUCal
//
//  Created by MGIE on 07/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FullRecord 0

@interface IntakeHistory : NSObject {
    NSDate *intakeDate;
    NSMutableArray *intakeFoodList;
    float totalEnergy, totalProtein, totalFat, totalSatFat, totalTranFat,totalCho, totalCar,totalFibre, totalSodium, totalSugar;
//    float totalEnergy, totalProtein, totalFat, totalSatFat, totalTranFat, totalCar,totalFibre, totalSodium, totalSugar;
    float energyBarVal, proteinBarVar, totalFatBarVal, SatFatBarVal, TranFatBarVal,choBarVal, carBarVal, fibreBarValue, sodiumBarVal, sugarBarVal, energyRequired;
    BOOL overTake;
}

@property (nonatomic, retain) NSDate *intakeDate;
@property (nonatomic, retain) NSMutableArray *intakeFoodList;
@property (nonatomic) float totalEnergy;
@property (nonatomic) float totalProtein;
@property (nonatomic) float totalFat;
@property (nonatomic) float totalSatFat;
@property (nonatomic) float totalTranFat;
@property (nonatomic) float totalCho;
@property (nonatomic) float totalCar;
@property (nonatomic) float totalFibre;
@property (nonatomic) float totalSodium;
@property (nonatomic) float totalSugar;

@property (nonatomic) float energyBarVal;
@property (nonatomic) float proteinBarVar;
@property (nonatomic) float totalFatBarVal;
@property (nonatomic) float SatFatBarVal;
@property (nonatomic) float TranFatBarVal;
@property (nonatomic) float choBarVal;
@property (nonatomic) float carBarVal;
@property (nonatomic) float fibreBarValue;
@property (nonatomic) float sodiumBarVal;
@property (nonatomic) float sugarBarVal;

@property (nonatomic) BOOL overTake;
@property (nonatomic) float energyRequired;

- (id) initWithIntakeHistory : (NSDate*)_intakeDate List:(NSMutableArray*)_intakeFoodList TotalEnergy:(float)_totalEnergy TotalProtein:(float)_totalProtein TotalFat:(float)_totalFat TotalSatFat:(float)_totalSatFat TotalTranFat:(float)_totalTranFat TotalCho:(float)_totalCho TotalCar:(float)_totalCar TotalFibre:(float)_totalFibre TotalSodium:(float)_totalSodium TotalSugar:(float)_totalSugar EnergyPercent:(float)_energyBarVal ProteinPercent:(float)_proteinBarVar TotalFatPercent:(float)_totalFatBarVal SatFatPercent:(float)_SatFatBarVal TranFatPercent:(float)_TranFatBarVal ChoBarPercent:(float)_choBarVal CarPercent:(float)_carBarVal FibrePercent:(float)_fibreBarValue SodiumPercent:(float)_sodiumBarVal SugarPercent:(float)_sugarBarVal OverTake:(BOOL)_overTake EnergyRequired:(float)_energyRequired;

//- (id) initWithIntakeHistory : (NSDate*)intakeDate List:(NSMutableArray*)intakeFoodList TotalEnergy:(float)totalEnergy TotalProtein:(float)totalProtein TotalFat:(float)totalFat TotalSatFat: (float)totalSatFat TotalTranFat:(float)totalTranFat TotalCar:(float)totalCar TotalFibre:(float)totalFibre TotalSodium:(float)totalSodium TotalSugar:(float)totalSugar EnergyPercent:(float)energyBarVal ProteinPercent:(float)proteinBarVar TotalFatPercent:(float)totalFatBarVal SatFatPercent:(float)SatFatBarVal TranFatPercent:(float)TranFatBarVal CarPercent:(float)carBarVal FibrePercent:(float)fibreBarValue SodiumPercent:(float)sodiumBarVal SugarPercent:(float)sugarBarVal OverTake:(BOOL)overTake EnergyRequired:(float)energyRequired;



@end