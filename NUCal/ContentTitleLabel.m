//
//  ContentTitleLabel.m
//  NUCal
//
//  Created by MGIECA2011006 on 31/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ContentTitleLabel.h"


@implementation ContentTitleLabel

- (void)awakeFromNib
{
    [super awakeFromNib];
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if(version >= 4.0){
        self.font = [UIFont fontWithName:@"HelveticaNeueLT-MediumCond" size:self.font.pointSize];
    }
}


@end
