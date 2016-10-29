//
//  Tool.h
//  NUCal
//
//  Created by MGIECA2011006 on 01/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Profile.h"
#import "Food.h"

#define PERSON [NSHomeDirectory() stringByAppendingString:@"/Documents/person.plist"]
#define DEFAULTPROFILE [NSHomeDirectory() stringByAppendingString:@"/Documents/defaultprofile.TXT"]

@interface Tool : NSObject {
    
}

+ (NSMutableArray*)getProfile;
+ (void)setProfileList:(NSMutableArray*)plistDict;
+ (void)setProfile:(Profile*)inProfile;
+ (void) setProfile:(Profile *)inProfile atIndex:(int)index;
//+ (void)addProfile:(NSMutableArray*)plistDict;
+ (NSMutableArray*)getProfileFoodList;
+ (void)setProfileFoodList:(NSMutableArray*)foodList;
+ (NSInteger)getDefaultProfile;
+ (BOOL)setDefaultProfile:(NSInteger)inset;
@end
