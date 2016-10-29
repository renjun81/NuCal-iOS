//
//  ProfileFoodList.h
//  NUCal
//
//  Created by MGIECA2011006 on 4/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Food.h"

@interface ProfileFoodList : NSObject
{
     NSMutableArray *foodList;
}

@property (nonatomic, retain) NSMutableArray *foodList;

- (id) init;
- (id) initWithFoodList:(ProfileFoodList *)foodList;

@end
