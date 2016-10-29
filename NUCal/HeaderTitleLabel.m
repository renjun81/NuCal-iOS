//
//  HeaderTitleLabel.m
//  NUCal
//
//  Created by MGIECA2011006 on 31/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HeaderTitleLabel.h"


@implementation HeaderTitleLabel

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    int h = [[UIScreen mainScreen] bounds].size.height;
    int w = [[UIScreen mainScreen] bounds].size.width;
    
    // add iPhone5/5S support
    if (IS_IPHONE5()) {
        NSLog(@"iPhone 5/5S/6/6+, coordinate space - device width=%d, height=%d", w, h);
    } else if (IS_IPHONE4()){
        NSLog(@"iPhone 3GS/4/4S or IPad, coordinate space - device width=%d, height=%d", w, h);
    } else {
        NSLog(@"Unknown IPhone Model, coordinate space - device width=%d, height=%d", w, h);
    } // if end
    
    if(version >= 4.2){
        NSLog(@"iOS version=%f", version);
//        if([[Language currentLanguage] isEqualToString:@"en"]){
//            self.font = [UIFont fontWithName:@"HelveticaNeueLT-MediumCond" size:self.font.pointSize];
//        }
//        else if([[Language currentLanguage] isEqualToString:@"zh"]){
//            self.font = [UIFont fontWithName:@"DFNYuan-W9-WINP-BF" size:self.font.pointSize];
//        }
//        else if([[Language currentLanguage] isEqualToString:@"sc"]){
//            self.font = [UIFont fontWithName:@"YentiEG-Ultra-GB" size:self.font.pointSize];
//        }
    } // if end


} // awakeFromNib

@end
