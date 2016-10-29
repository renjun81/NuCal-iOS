//
//  ContentButton.m
//  NUCal
//
//  Created by MGIECA2011006 on 31/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ContentButton.h"


@implementation ContentButton

- (void)awakeFromNib
{
    [super awakeFromNib];
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if(version >= 4.0){
        [self titleLabel].font = [UIFont fontWithName:@"HelveticaNeueLT-LightCond" size:[self titleLabel].font.pointSize];
    }
}

@end
