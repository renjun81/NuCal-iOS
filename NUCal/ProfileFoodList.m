//
//  ProfileFoodList.m
//  NUCal
//
//  Created by MGIECA2011006 on 4/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProfileFoodList.h"

@implementation ProfileFoodList

@synthesize foodList;

-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:foodList forKey:@"foodList"];
}

-(id)initWithCoder:(NSCoder*)decoder
{
    // Init first.
    if ((self = [super init]))
    {
        self.foodList = [decoder decodeObjectForKey:@"foodList"];
    }
    
    return self;
}

- (id) init
{
    if ((self = [super init]))
    {
        self.foodList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id) initWithFoodList:(ProfileFoodList *)inFoodList
{
    // Init first.
    if ((self = [super init]))
    {
        self.foodList = [[NSMutableArray alloc] initWithArray: inFoodList.foodList];
    }
    return self;
}

@end
