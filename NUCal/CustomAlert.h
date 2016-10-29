//
//  CustomAlert.h
//  NUCal
//
//  Created by MGIE on 14/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CustomAlert : UIAlertView
{
    
}

+ (void) setBackgroundColor:(UIColor *) background 
            withStrokeColor:(UIColor *) stroke;

@end