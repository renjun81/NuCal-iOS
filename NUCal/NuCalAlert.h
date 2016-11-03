//
//  NuCalAlert.h
//  NUCal
//
//  Created by MGIE on 15/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView-AlertAnimations.h"
#import <QuartzCore/QuartzCore.h>

@protocol NuCalAlertDelegate;

@interface NuCalAlert : UIView {
    id <NuCalAlertDelegate> delegate;
    NSMutableArray *buttonArray;
    UIImageView *alertBGView;
    UIImageView *alertBoxView;
    UIView *alertContentView;
    UILabel *lbl_title, *lbl_subTitle;
    
    NSString *title;
    //NSString *subTitle;
}
@property(nonatomic,assign) id delegate;

- (id)initWithTitle:(NSString*)title Subtitle:(NSString*)subTitle CancelButtonTitle:(NSString*)cancelTitle ButtonTitle:(NSMutableArray*)buttonTitle;
- (IBAction)show;
- (IBAction)dismiss;
- (void)setSubTitleFont:(UIFont*)font;
//- (void)setButtonFont:(UIFont*)font;

@end

@protocol NuCalAlertDelegate<NSObject>
@optional

- (void)NuAlertView:(NuCalAlert *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end
