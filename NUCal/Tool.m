//
//  Tool.m
//  NUCal
//
//  Created by MGIECA2011006 on 01/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Tool.h"


@implementation Tool

+ (NSMutableArray*)getProfile
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathsWithFilename = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"profile.txt"];
    NSMutableArray* plistDict = [NSMutableArray arrayWithContentsOfFile:pathsWithFilename];
    
    NSMutableArray* returnArray = [NSMutableArray array];
    
    int i = 0;
    
    for (i = 0; i < [plistDict count]; i++) {
        
        NSMutableData *data = [[NSMutableData alloc] initWithData:[plistDict objectAtIndex:i]];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        NSLog(@"load userprofile=profile%d", i);
        Profile *profile = [unarchiver decodeObjectForKey:[NSString stringWithFormat:@"profile%d", i]];
        [returnArray addObject:profile];
        [unarchiver finishDecoding];
        [unarchiver release];
        [data release];
    }
    return returnArray;
}

+ (void)setProfileList:(NSMutableArray*)plistDict
{
    int i = 0;
//    int i = [self getDefaultProfile];
    
    NSMutableArray *storeArray = [[NSMutableArray alloc] init];
    for (Profile *p in plistDict)
    {
        NSMutableData *data = [[NSMutableData alloc] init];
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
        [archiver encodeObject:p forKey:[NSString stringWithFormat:@"profile%d", i]];
        NSLog(@"store profile%d", i);
        [archiver finishEncoding];
        [archiver release];
        [storeArray addObject:data];
        [data release];
        i++;
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathsWithFilename = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"profile.txt"];
    [storeArray writeToFile:pathsWithFilename atomically:YES];
    [storeArray release];
}

+ (NSMutableArray*)getProfileFoodList
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathsWithFilename = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"foodlist.txt"];
    NSMutableArray* plistDict = [NSMutableArray arrayWithContentsOfFile:pathsWithFilename];
    
    NSMutableArray* returnArray = [NSMutableArray array];
    
    int i = 0;
    
    for (i = 0; i < [plistDict count]; i++) {
        
        NSMutableData *data = [[NSMutableData alloc] initWithData:[plistDict objectAtIndex:i]];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        NSLog(@"load food%d", i);
        Food *food = [unarchiver decodeObjectForKey:[NSString stringWithFormat:@"food%d", i]];
        [returnArray addObject:food];
        [unarchiver finishDecoding];
        [unarchiver release];
        [data release];
    }
    return returnArray;
}

+ (void)setProfileFoodList:(NSMutableArray*)foodList
{
    int i = 0;
    //    int i = [self getDefaultProfile];
    
    NSMutableArray *storeArray = [[NSMutableArray alloc] init];
    for (Food *f in foodList)
    {
        NSMutableData *data = [[NSMutableData alloc] init];
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
        [archiver encodeObject:f forKey:[NSString stringWithFormat:@"food%d", i]];
        NSLog(@"store food%d", i);
        [archiver finishEncoding];
        [archiver release];
        [storeArray addObject:data];
        [data release];
        i++;
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathsWithFilename = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"foodlist.txt"];
    [storeArray writeToFile:pathsWithFilename atomically:YES];
    [storeArray release];
}   

+ (void)setProfile:(Profile*)inProfile
{    
    [self setProfile:inProfile atIndex:[self getDefaultProfile]];
}

+ (void) setProfile:(Profile *)inProfile atIndex:(int)index
{
    NSMutableArray *storeArray = [[NSMutableArray alloc] initWithArray:[self getProfile]];
    Profile *currentProfile = [[Profile alloc] initWithProfile:inProfile];
    
    if (index < [storeArray count])
        [storeArray replaceObjectAtIndex:index withObject:currentProfile];
    
    [Tool setProfileList:storeArray];
    [storeArray release];
    [currentProfile release];
}


+ (NSInteger)getDefaultProfile
{
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:DEFAULTPROFILE])
		[self setDefaultProfile:0];
	NSError *error = NULL;
	NSString *profile = [NSString stringWithContentsOfFile:DEFAULTPROFILE encoding:NSUTF8StringEncoding error:&error];
	if (error)
	{
		profile = @"0";
	}
    
	NSInteger index = [profile integerValue];
	return index;
}

+ (BOOL)setDefaultProfile:(NSInteger)inset
{
	NSString *outstring = [NSString stringWithFormat:@"%i", inset];
    NSError *error = NULL;
	[outstring writeToFile:DEFAULTPROFILE atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (error == NULL)
        return YES;
    else
        return NO;
}




@end
