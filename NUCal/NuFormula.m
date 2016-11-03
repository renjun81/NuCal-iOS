//
//  NuFormula.m
//  NUCal
//
//  Created by MGIE on 29/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NuFormula.h"


@implementation NuFormula

+(float)calBMIFromWeight:(float)weight inType:(int)weightType AndHeight:(float)height inType:(int)heightType{
    float weightInKG = 0;
    if(weightType == KG){
        weightInKG = weight;
    }
    if(weightType == LBS){
        weightInKG = [self lbsToKG:weight];
    }
    
    float heightInM = 0;

    heightInM = height;

    NSLog(@"weight = %f, height = %f", weightInKG, heightInM);
    if(weightInKG == 0 || heightInM == 0){
        return 0;
    }
    else{
        return  weightInKG / (heightInM * heightInM);
    }
}

+(float)lbsToKG:(float)lbs{
    return lbs * (1/2.20462262185);
}

+(float)KGTolbs:(float)kg{
    return kg * 2.20462262185;
}

+(float)ftToM:(float)ft Inch:(float)inch {
    
    float unit = 0;
    unit = ft + inch/12.0;
    return unit * (1/3.2808399);
}

+(NSMutableArray*)MToft:(float)m{
    
    float unit = 0;
    unit = m * 3.2808399;
    float ft = 0;
    float inch = 0;
    
    ft = floorf(unit);
    inch = (unit - ft) / (1.0/12.0);
    
    NSMutableArray *ftArray = [NSMutableArray arrayWithObjects:[NSString stringWithFormat:@"%f", ft],[NSString stringWithFormat:@"%f", inch], nil];
    
    return ftArray;
}

+(float)KcalToKj:(float)kcal{
    return kcal * 4.184;
}

+(float)KjToKcal:(float)kj{
    return  kj / 4.184;
}

+(float)calEnergyRequirment:(Profile*)profile{
    float weight = profile.weight;
    if(profile.age>=7 && profile.age<=10){
        if(profile.gender == MALE){
            if(profile.activityLv == AL_LOW){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 22.7 + 495) * 1.55;
                }else{
                    return (weight * 22.7 + 495) * 1.55;
                }
            }
            else if(profile.activityLv == AL_MEDIUM){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 22.7 + 495) * 1.75;
                }else{
                    return (weight * 22.7 + 495) * 1.75;
                }
            }
            if(profile.activityLv == AL_HIGH){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 22.7 + 495) * 1.95;
                }else{
                    return (weight * 22.7 + 495) * 1.95;
                }
            }
        }
        else if(profile.gender == FEMALE){
            if(profile.activityLv == AL_LOW){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 22.5 + 499) * 1.50;
                }else{
                    return (weight * 22.5 + 499) * 1.50;
                }
            }
            else if(profile.activityLv == AL_MEDIUM){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 22.5 + 499) * 1.70;
                }else{
                    return (weight * 22.5 + 499) * 1.70;
                }
            }
            if(profile.activityLv == AL_HIGH){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 22.5 + 499) * 1.90;
                }else{
                    return (weight * 22.5 + 499) * 1.90;
                }
            }
        }
    }
    else if(profile.age>=11 && profile.age<=13){
        if(profile.gender == MALE){
            if(profile.activityLv == AL_LOW){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 17.5 + 651) * 1.55;
                }else{
                    return (weight * 17.5 + 651) * 1.55;
                }
            }
            else if(profile.activityLv == AL_MEDIUM){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 17.5 + 651) * 1.75;
                }else{
                    return (weight * 17.5 + 651) * 1.75;
                }
            }
            if(profile.activityLv == AL_HIGH){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 17.5 + 651) * 1.95;
                }else{
                    return (weight * 17.5 + 651) * 1.95;
                }
            }
        }
        else if(profile.gender == FEMALE){
            if(profile.activityLv == AL_LOW){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 12.2 + 746) * 1.50;
                }else{
                    return (weight * 12.2 + 746) * 1.50;
                }
            }
            else if(profile.activityLv == AL_MEDIUM){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 12.2 + 746) * 1.70;
                }else{
                    return (weight * 12.2 + 746) * 1.70;
                }
            }
            if(profile.activityLv == AL_HIGH){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 12.2 + 746) * 1.90;
                }else{
                    return (weight * 12.2 + 746) * 1.90;
                }
            }
        }
    }
    else if(profile.age>=14 && profile.age<=17){
        if(profile.gender == MALE){
            if(profile.activityLv == AL_LOW){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 17.5 + 651) * 1.60;
                }else{
                    return (weight * 17.5 + 651) * 1.60;
                }
            }
            else if(profile.activityLv == AL_MEDIUM){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 17.5 + 651) * 1.80;
                }else{
                    return (weight * 17.5 + 651) * 1.80;
                }
            }
            if(profile.activityLv == AL_HIGH){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 17.5 + 651) * 2.05;
                }else{
                    return (weight * 17.5 + 651) * 2.05;
                }
            }
        }
        else if(profile.gender == FEMALE){
            if(profile.activityLv == AL_LOW){
                if(profile.weightType == LBS){
                    NSLog(@"lbsToKG%f",[NuFormula lbsToKG:weight]);
                    return ([NuFormula lbsToKG:weight] * 12.2 + 746) * 1.45;
                    
                }else{
                    return (weight * 12.2 + 746) * 1.45;
                }
            }
            else if(profile.activityLv == AL_MEDIUM){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 12.2 + 746) * 1.65;
                }else{
                    return (weight * 12.2 + 746) * 1.65;
                }
            }
            if(profile.activityLv == AL_HIGH){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 12.2 + 746) * 1.85;
                }else{
                    return (weight * 12.2 + 746) * 1.85;
                }
            }
        }
    }
    else if(profile.age>=18 && profile.age<=49){
        if(profile.gender == MALE){
            if(profile.activityLv == AL_LOW){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 15.3 + 679) * 0.95 * 1.55;
                }else{
                    return (weight * 15.3 + 679) * 0.95 * 1.55;
                }
            }
            else if(profile.activityLv == AL_MEDIUM){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 15.3 + 679) * 0.95 * 1.78;
                }else{
                    return (weight * 15.3 + 679) * 0.95 * 1.78;
                }
            }
            if(profile.activityLv == AL_HIGH){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 15.3 + 679) * 0.95 * 2.10;
                }else{
                    return (weight * 15.3 + 679) * 0.95 * 2.10;
                }
            }
        }
        else if(profile.gender == FEMALE){
            if(profile.activityLv == AL_LOW){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 14.7 + 496) * 0.95 * 1.56;
                }else{
                    return (weight * 14.7 + 496) * 0.95 * 1.56;
                }
            }
            else if(profile.activityLv == AL_MEDIUM){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 14.7 + 496) * 0.95 * 1.64;
                }else{
                    return (weight * 14.7 + 496) * 0.95 * 1.64;
                }
            }
            if(profile.activityLv == AL_HIGH){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 14.7 + 496) * 0.95 * 1.82;
                }else{
                    return (weight * 14.7 + 496) * 0.95 * 1.82;
                }
            }
        }
    }
    else if(profile.age>=50 && profile.age<=59){
        if(profile.gender == MALE){
            if(profile.activityLv == AL_LOW){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 11.6 + 879) * 0.95 * 1.55;
                }else{
                    return (weight * 11.6 + 879) * 0.95 * 1.55;
                }
            }
            else if(profile.activityLv == AL_MEDIUM){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 11.6 + 879) * 0.95 * 1.78;
                }else{
                    return (weight * 11.6 + 879) * 0.95 * 1.78;
                }
            }
            if(profile.activityLv == AL_HIGH){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 11.6 + 879) * 0.95 * 2.10;
                }else{
                    return (weight * 11.6 + 879) * 0.95 * 2.10;
                }
            }
        }
        else if(profile.gender == FEMALE){
            if(profile.activityLv == AL_LOW){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 8.7 + 829) * 0.95 * 1.56;
                }else{
                    return (weight * 8.7 + 829) * 0.95 * 1.56;
                }
            }
            else if(profile.activityLv == AL_MEDIUM){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 8.7 + 829) * 0.95 * 1.64;
                }else{
                    return (weight * 8.7 + 829) * 0.95 * 1.64;
                }
            }
            if(profile.activityLv == AL_HIGH){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 8.7 + 829) * 0.95 * 1.82;
                }else{
                    return (weight * 8.7 + 829) * 0.95 * 1.82;
                }
            }
        }
    }
    else if(profile.age>=60 && profile.age<=69){
        if(profile.gender == MALE){
            if(profile.activityLv == AL_LOW){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 13.5 + 487) * 0.95 * 1.53;
                }else{
                    return (weight * 13.5 + 487) * 0.95 * 1.53;
                }
            }
            else if(profile.activityLv == AL_MEDIUM){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 13.5 + 487) * 0.95 * 1.66;
                }else{
                    return (weight * 13.5 + 487) * 0.95 * 1.66;
                }
            }
        }
        else if(profile.gender == FEMALE){
            if(profile.activityLv == AL_LOW){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 10.5 + 596) * 0.95 * 1.54;
                }else{
                    return (weight * 10.5 + 596) * 0.95 * 1.54;
                }
            }
            else if(profile.activityLv == AL_MEDIUM){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 10.5 + 596) * 0.95 * 1.64;
                }else{
                    return (weight * 10.5 + 596) * 0.95 * 1.64;
                }
            }
        }
    }
    else if(profile.age>=70 && profile.age<=79){
        if(profile.gender == MALE){
            if(profile.activityLv == AL_LOW){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 13.5 + 487) * 0.95 * 1.51;
                }else{
                    return (weight * 13.5 + 487) * 0.95 * 1.51;
                }
            }
            else if(profile.activityLv == AL_MEDIUM){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 13.5 + 487) * 0.95 * 1.64;
                }else{
                    return (weight * 13.5 + 487) * 0.95 * 1.64;
                }
            }
        }
        else if(profile.gender == FEMALE){
            if(profile.activityLv == AL_LOW){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 10.5 + 596) * 0.95 * 1.51;
                }else{
                    return (weight * 10.5 + 596) * 0.95 * 1.51;
                }
            }
            else if(profile.activityLv == AL_MEDIUM){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 10.5 + 596) * 0.95 * 1.62;
                }else{
                    return (weight * 10.5 + 596) * 0.95 * 1.62;
                }
            }
        }
    }
    else if(profile.age>=80){
        if(profile.gender == MALE){
            if(profile.activityLv == AL_LOW){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 13.5 + 487) * 0.95 * 1.49;
                }else{
                    return (weight * 13.5 + 487) * 0.95 * 1.49;
                }
            }
        }
        else if(profile.gender == FEMALE){
            if(profile.activityLv == AL_LOW){
                if(profile.weightType == LBS){
                    return ([NuFormula lbsToKG:weight] * 10.5 + 596) * 0.95 * 1.49;
                }else{
                    return (weight * 10.5 + 596) * 0.95 * 1.49;
                }
            }
        }
    }
    
    return 0;
}

+(float)calProteinIntake:(Profile*)profile{
    float energy = profile.energyReq;
    return (energy * 0.12)/4;
}
+(float)calTotalFatIntake:(Profile*)profile{
    float energy = profile.energyReq;
    return (energy * 0.27)/9;
}
+(float)calSatFatIntake:(Profile*)profile{
    float energy = profile.energyReq;
    return (energy * 0.09)/9;
}
+(float)calTranFatIntake:(Profile*)profile{
    float energy = profile.energyReq;
    return (energy * 0.01)/9;
}
+(float)calCarbohydratesIntake:(Profile*)profile{
    float energy = profile.energyReq;
    return (energy * 0.60)/4;
}
+(float)calFibreIntake{
    return 25;
}
+(float)calSugarIntake:(Profile*)profile{
    float energy = profile.energyReq;
    return (energy * 0.1)/4;
}
+(float)calSodiumIntake{
    return 2000;
}
+(float)calCholesterolIntake{
    return 300;
}

+(BOOL)calLowFat:(Food*)food{
    float fat = food.totalFat;
    float amount = food.weight;
    
    if (fat  < 0)
        return false;

    if(food.type == PER100GML){
        if((fat/100.0) <= (3.00001/100.0)){
            return true;
        }
        else{
            return false;
        }
    }
    else if(food.type == PER100ML){
        if((fat/100.0) <= (1.50001/100.0)){
            return true;
        }
        else{
            return false;
        }
    }
    else if(food.type == PERSERVING){
        if(food.unitType == g){
            if((fat/amount) <= (3.00001/100.0)){
                return true;
            }
            else{
                return false;
            }  
        }
        else if(food.unitType == ml){
            if((fat/amount) <= (1.50001/100.0)){
                return true;
            }
            else{
                return false;
            }
        }
    }
    
    return false;
}

+(BOOL)calLowSugar:(Food *)food{
    float sugar = food.sugars;
    float amount = food.weight;
    
    if (sugar  < 0)
        return false;
    
    NSLog(@"%f", sugar/amount);
    if((sugar/amount) <= (5.0001/100.0)){   // sugar / amount
        return true; //1 = YES  ,  2 = NO
    }
    else{
        return false;
    }
    
}

+(BOOL)calLowSalt:(Food *)food{
    float salt = food.sodium;
    float amount = food.weight;

    if ((salt/1000.0)  < 0)
        return false;
    
    if(((salt/1000.0)/amount) <= (0.120001/100.0)){   //  salt / amount
        return true; 
    }
    else {
        return false;
    }
}

+(BOOL)calThreeLow:(Food *)food{

    if ([self calLowFat:food] && [self calLowSalt:food] && [self calLowSugar:food])
        return YES;
    else
        return NO;
    
}




@end
