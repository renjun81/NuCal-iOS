//
//  About.h
//  NUCal
//
//  Created by MGIECA2011006 on 24/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Language.h"

@interface About : UIViewController {

    IBOutlet UIScrollView *sv_content;
    
    UIImageView *img_about;
    UIButton *btn_url;
}
@property (nonatomic, retain) IBOutlet UIImageView *img_about;
@property (nonatomic, retain) IBOutlet UIButton *btn_url;

- (IBAction) buttonPressed:(id)button;

- (void)setMode:(int)mode;

@end
