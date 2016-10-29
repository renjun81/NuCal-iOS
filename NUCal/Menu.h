//
//  Menu.h
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NuCalAlert.h"
#import "Tool.h"

@interface Menu : UIViewController<NuCalAlertDelegate> {
    
    IBOutlet UIButton *b_addFood;
    IBOutlet UIButton *b_foodList;
    IBOutlet UIButton *b_intake;
    IBOutlet UIButton *b_history;
    IBOutlet UIButton *b_about;
    IBOutlet UIButton *b_profile;
    IBOutlet UIButton *b_setting;
    IBOutlet UIButton *b_introduction;
    IBOutlet UIImageView *iv_header;
    
    // banner view controller
    IBOutlet UIImageView *im_addfood;
    
    // image view background
    IBOutlet UIImageView *im_bg;
    
    NSTimer *timer;
    NSTimer *loopTimer;
    
    NSInteger currentBanner;
    UIImageView *currentBannerView, *prevBannerView, *nextBannerView;
    
    NSString *currentView;
    
}
@property (nonatomic, retain) NSTimer *timer;

- (void)setMode:(int)mode;
- (IBAction) buttonPressed:(id)button;
- (void)updateCounter:(NSTimer *)theTimer;
- (void) loopCounter:(NSTimer *)timer;
- (void)addfoodAnimation;
- (void)foodlistAnimation;
- (void)historyAnimation;
- (void)intakeAnimation;
- (void) bannerControl;
//- (void)stopAnimation;
@end
