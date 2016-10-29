//
//  Profile.m
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Profile.h"


@implementation Profile

@synthesize userName, gender, weight, weightType, height, heightType, age, activityLv, intakeList, intakeHistoryList, energyReq, profile_pic , asian, height_ft, height_inch, foodList;
//@synthesize asian;

-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:userName forKey:@"userName"];
    [encoder encodeObject:[NSString stringWithFormat:@"%d", gender] forKey:@"gender"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", weight] forKey:@"weight"];
    [encoder encodeObject:[NSString stringWithFormat:@"%d", weightType] forKey:@"weightType"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", height] forKey:@"height"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", height_ft] forKey:@"height_ft"];
    [encoder encodeObject:[NSString stringWithFormat:@"%f", height_inch] forKey:@"height_inch"];
    [encoder encodeObject:[NSString stringWithFormat:@"%d", heightType] forKey:@"heightType"];
    [encoder encodeObject:[NSString stringWithFormat:@"%d", age] forKey:@"age"];
    [encoder encodeObject:[NSString stringWithFormat:@"%d", activityLv] forKey:@"activityLv"];
    [encoder encodeObject:[NSString stringWithFormat:@"%d", energyReq] forKey:@"energyReq"];
    [encoder encodeObject:UIImagePNGRepresentation(profile_pic) forKey:@"profilePic"];
    [encoder encodeObject:[NSString stringWithFormat:@"%d", asian] forKey:@"asian"];
    [encoder encodeObject:foodList forKey:@"foodList"]; //Don't use after phase1
    [encoder encodeObject:intakeList forKey:@"intakeList"];
    [encoder encodeObject:intakeHistoryList forKey:@"intakeHistoryList"];
}

-(id)initWithCoder:(NSCoder*)decoder
{
    // Init first.
    if ((self = [super init]))
    {
        self.userName = [decoder decodeObjectForKey:@"userName"];
        self.gender = [[decoder decodeObjectForKey:@"gender"] intValue];
        self.weight = [[decoder decodeObjectForKey:@"weight"] floatValue];
        self.weightType = [[decoder decodeObjectForKey:@"weightType"] intValue];
        self.height = [[decoder decodeObjectForKey:@"height"] floatValue];
        self.height_ft = [[decoder decodeObjectForKey:@"height_ft"] floatValue];
        self.height_inch = [[decoder decodeObjectForKey:@"height_inch"] floatValue];
        self.heightType = [[decoder decodeObjectForKey:@"heightType"] intValue];
        self.age = [[decoder decodeObjectForKey:@"age"] intValue];
        self.activityLv = [[decoder decodeObjectForKey:@"activityLv"] intValue];
        self.energyReq = [[decoder decodeObjectForKey:@"energyReq"] intValue];
        [self setProfilePic: [UIImage imageWithData: [decoder decodeObjectForKey:@"profilePic"]]];
        self.asian = [[decoder decodeObjectForKey:@"asian"] intValue];
        self.foodList = [decoder decodeObjectForKey:@"foodList"]; //Don't use after phase1
        self.intakeList = [decoder decodeObjectForKey:@"intakeList"];
        self.intakeHistoryList = [decoder decodeObjectForKey:@"intakeHistoryList"];
    }
    
    return self;
}

- (id) initWithData:(NSString*)_name Gender:(int)_gender Weight:(float)_weight WeightType:(float)_weightType Height:(float)_height Height_ft:(float)_height_ft  Height_inch:(float)_height_inch HeightType:(int)_heightType Age:(int)_age ActivityLv:(int)_activityLv EnergyReq:(int)_energyReq ProfilePic:(UIImage *)_profilePic Asian:(int)_asian
{
    // Init first.
    if ((self = [super init]))
    {
        self.userName = _name;
        self.gender = _gender;
        self.weight = _weight;
        self.weightType = _weightType;
        self.height = _height;
        self.height_ft = _height_ft;
        self.height_inch = _height_inch;
        self.heightType = _heightType;
        self.age = _age;
        self.activityLv = _activityLv;
        self.energyReq = _energyReq;
        self.profile_pic = _profilePic;
        self.asian = _asian;
    }
    
    if (foodList == nil) //Don't use after phase1
    {
        foodList = [[NSMutableArray alloc] init]; //Don't use after phase1
    }
    if (intakeList == nil)
    {
        intakeList = [[NSMutableArray alloc] init];
    }  
    if (intakeHistoryList == nil)
    {
        intakeHistoryList = [[NSMutableArray alloc] init];
    }  
    
    return self;
}

- (id) initWithProfile:(Profile *)profile
{
    // Init first.
    if ((self = [super init]))
    {
        self.userName = profile.userName;
        self.gender = profile.gender;
        self.weight = profile.weight;
        self.weightType = profile.weightType;
        self.height = profile.height;
        self.height_ft = profile.height_ft;
        self.height_inch = profile.height_inch;
        self.heightType = profile.heightType;
        self.age = profile.age;
        self.activityLv = profile.activityLv;
        self.energyReq = profile.energyReq;
        self.profile_pic = profile.profile_pic;
        self.asian = profile.asian;
    }
    
    if (foodList != nil) //Don't use after phase1
    {
        [foodList release]; //Don't use after phase1
        foodList = nil; //Don't use after phase1
    }
    
    foodList = [[NSMutableArray alloc] initWithArray:profile.foodList]; //Don't use after phase1
    
    if (intakeList != nil)
    {
        [intakeList release];
        intakeList = nil;
    }
    
    intakeList = [[NSMutableArray alloc] initWithArray:profile.intakeList];
    
    if (intakeHistoryList != nil)
    {
        [intakeHistoryList release];
        intakeHistoryList = nil;
    }
    
    intakeHistoryList = [[NSMutableArray alloc] initWithArray:profile.intakeHistoryList];
    
    return self;
}

- (id) updateProfile:(Profile*) profile
{
    self.userName = profile.userName;
    self.gender = profile.gender;
    self.weight = profile.weight;
    self.weightType = profile.weightType;
    self.height = profile.height;
    self.height_ft = profile.height_ft;
    self.height_inch = profile.height_inch;
    self.heightType = profile.heightType;
    self.age = profile.age;
    self.activityLv = profile.activityLv;
    self.energyReq= profile.energyReq;
    self.profile_pic = profile.profile_pic;
    self.asian = profile.asian;
    
    if (foodList != nil) //Don't use after phase1
    {
        [foodList release]; //Don't use after phase1
        foodList = nil; //Don't use after phase1
    }
    
    foodList = [[NSMutableArray alloc] initWithArray:profile.foodList]; //Don't use after phase1
    
    if (intakeList != nil)
    {
        [intakeList release];
        intakeList = nil;
    }
    
    intakeList = [[NSMutableArray alloc] initWithArray:profile.intakeList];
    
    if (intakeHistoryList != nil)
    {
        [intakeHistoryList release];
        intakeHistoryList = nil;
    }
    
    intakeHistoryList = [[NSMutableArray alloc] initWithArray:profile.intakeHistoryList];
    
    return self;
}

-(void) dealloc {
    
    [profile_pic release], profile_pic = nil;
    [foodList release], foodList = nil; //Don't use after phase1
    [intakeList release], intakeList = nil;
    [intakeHistoryList release], intakeHistoryList = nil;
    [userName release], userName = nil;
    [super dealloc];
}

- (void) addFood :(Food*) food //Don't use after phase1
{
    [foodList addObject:food];
}

- (void) removeFood:(Food*) food //Don't use after phase1
{
    [foodList removeObject:food];
}

- (NSMutableArray*) getFoodList //Don't use after phase1
{
    return foodList;
}

- (void) setFoodList:(NSMutableArray*) inFoodList //Don't use after phase1
{
    if (inFoodList != nil)
    {
        [foodList release];
        foodList = nil;
        foodList = [[NSMutableArray alloc] initWithArray:inFoodList];
    }
}

- (void) addIntake :(Food*) intake //Don't use after phase1
{
    [intakeList addObject:intake];
}

- (void) removeIntake:(Food*) intake //Don't use after phase1
{
    [intakeList removeObject:intake];
}

- (NSMutableArray*) getIntakeList
{
    return intakeList;
}

- (void) setIntakeList:(NSMutableArray*) inIntakeList
{
    if (inIntakeList != nil)
    {
        [intakeList release];
        intakeList = nil;
        intakeList = [[NSMutableArray alloc] initWithArray:inIntakeList];
    }
}

- (void) addIntakeHistory:(IntakeHistory*) intakeHistory
{
    [intakeHistoryList addObject:intakeHistory];
}

- (void) removeIntakeHistory:(IntakeHistory*) intakeHistory
{
    [intakeHistoryList removeObject:intakeHistory];
}

- (NSMutableArray*) getIntakeHistoryList
{
    return intakeHistoryList;
}

- (void) setIntakeHistoryList:(NSMutableArray*) inIntakeHistoryList
{
    if (inIntakeHistoryList != nil)
    {
        [intakeHistoryList release];
        intakeHistoryList = nil;
        intakeHistoryList = [[NSMutableArray alloc] initWithArray:inIntakeHistoryList];
    }
}

- (void) setEnergyRequirment:(int)req{
    self.energyReq = req;
}

- (void) setProfilePic:(UIImage*) pic{
    if (self.profile_pic != nil)
    {
        [self.profile_pic release];
        self.profile_pic = nil;
    }
    self.profile_pic = [pic copy];
}
//

//- (void) setAsian:(int)asian{
//    self.asian = asian;
//}



@end
