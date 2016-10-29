//
//  Introduction.h
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Language.h"

@interface Introduction : UIViewController<UIScrollViewDelegate> {
    
    IBOutlet UIButton *b_profile;
    IBOutlet UIScrollView *sv_content;
    
    UIImageView *img_help;
}
@property (nonatomic, retain) IBOutlet UIImageView *img_help;

- (IBAction) buttonHandler:(UIButton*)button;

- (void)setMode:(int)mode;

@end
