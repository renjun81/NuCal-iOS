//
//  NuCalAlert.m
//  NUCal
//
//  Created by MGIE on 15/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NuCalAlert.h"

@implementation NuCalAlert
@synthesize delegate;

-(id)initWithTitle:(NSString*)title Subtitle:(NSString*)subTitle CancelButtonTitle:(NSString*)cancelTitle ButtonTitle:(NSMutableArray*)buttonTitle{
    self = [super initWithFrame:CGRectMake(0, 0, 320, 480)];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        alertBGView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"popup_bg"]];
        
        BOOL haveCancel = YES;
        int buttonNumber = 0;
        
        if(cancelTitle == nil){
            haveCancel = NO;
        }else{
            haveCancel = YES;
        }
        
        if(buttonTitle == nil){
            buttonNumber = 0;
        }
        else{
            buttonNumber = [buttonTitle count];
        }
        
        switch (buttonNumber) {
            case 0:
                alertContentView = [[UIView alloc]initWithFrame:CGRectMake(21, 150, 278, 180)];
                    
                alertBoxView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"popup_box"]];
                
                [alertBoxView setFrame:CGRectMake(0, 0, 278, 180)];
                
                [alertContentView addSubview:alertBoxView];
                    
                lbl_subTitle = [[UILabel alloc]initWithFrame:CGRectMake(12, 12, 250, 110)];
                [lbl_subTitle setBackgroundColor:[UIColor clearColor]];
                [lbl_subTitle setNumberOfLines:5];
                [lbl_subTitle setFont:[UIFont systemFontOfSize:18]];
                [lbl_subTitle setMinimumFontSize:14];
                [lbl_subTitle setText:subTitle];
                [lbl_subTitle setTextAlignment:UITextAlignmentCenter];
                [alertContentView addSubview:lbl_subTitle];
                if (haveCancel) {
                    UIButton *tmp = [[UIButton alloc]initWithFrame:CGRectMake(12, 120, 256, 43)];
                    [tmp setBackgroundImage:[UIImage imageNamed:@"popup_btn_large"] forState:UIControlStateNormal];
                    [tmp setTitle:cancelTitle forState:UIControlStateNormal];
                    [tmp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    [tmp setTag:9999];
                    [tmp addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
                    [alertContentView addSubview:tmp];
                    [tmp release];
                }
                    
                [self addSubview:alertBGView];
                //                    [self addSubview:alertBoxView];
                [self addSubview:alertContentView];
                break;
            case 1:
                alertContentView = [[UIView alloc]initWithFrame:CGRectMake(21, 150, 278, 180)];
                    
                alertBoxView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"popup_box"]];
                    
                [alertContentView addSubview:alertBoxView];
                    
                lbl_subTitle = [[UILabel alloc]initWithFrame:CGRectMake(12, 12, 250, 110)];
                [lbl_subTitle setBackgroundColor:[UIColor clearColor]];
                [lbl_subTitle setNumberOfLines:5];
                [lbl_subTitle setFont:[UIFont systemFontOfSize:18]];
                [lbl_subTitle setMinimumFontSize:14];
                [lbl_subTitle setText:subTitle];
                [lbl_subTitle setTextAlignment:UITextAlignmentCenter];
                [alertContentView addSubview:lbl_subTitle];
                
                if (haveCancel == NO) {
                    UIButton *tmp = [[UIButton alloc]initWithFrame:CGRectMake(12, 120, 250, 43)];
                    [tmp setBackgroundImage:[UIImage imageNamed:@"popup_btn_large"] forState:UIControlStateNormal];
                    [tmp setTitle:cancelTitle forState:UIControlStateNormal];
                    [tmp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    [tmp setTag:9999];
                    [tmp addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
                    [alertContentView addSubview:tmp];
                    [tmp release];
                }
                else{
                    UIButton *tmp = [[UIButton alloc]initWithFrame:CGRectMake(143, 120, 128, 43)];
                    [tmp setBackgroundImage:[UIImage imageNamed:@"popup_btn"] forState:UIControlStateNormal];
                    [tmp setTitle:cancelTitle forState:UIControlStateNormal];
                    [tmp setTag:9999];
                    [tmp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    [tmp addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
                    [alertContentView addSubview:tmp];
                    [tmp release];
                    UIButton *tmp1 = [[UIButton alloc]initWithFrame:CGRectMake(7, 120, 128, 43)];
                    [tmp1 setBackgroundImage:[UIImage imageNamed:@"popup_btn"] forState:UIControlStateNormal];
                    [tmp1 setTitle:[buttonTitle objectAtIndex:0] forState:UIControlStateNormal];
                    [tmp1 setTag:0];
                    [tmp1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    [tmp1 addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
                    [alertContentView addSubview:tmp1];
                    [tmp1 release];
                }
                [self addSubview:alertBGView];
//                    [self addSubview:alertBoxView];
                [self addSubview:alertContentView];
                break;
            case 2:
//                if(YES){
//                    alertContentView = [[UIView alloc]initWithFrame:CGRectMake(21, 150, 278, 130)];
//                
//                    alertBoxView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"popup_box"]];
//                
//                    [alertContentView addSubview:alertBoxView];
//                    	
//                    lbl_subTitle = [[UILabel alloc]initWithFrame:CGRectMake(12, 12, 256, 50)];
//                    [lbl_subTitle setBackgroundColor:[UIColor clearColor]];
//                    [lbl_subTitle setNumberOfLines:5];
//                    [lbl_subTitle setFont:[UIFont systemFontOfSize:13]];
//                    [lbl_subTitle setText:subTitle];
//                    [lbl_subTitle setTextAlignment:UITextAlignmentCenter];
//                    [alertContentView addSubview:lbl_subTitle];
//                
//                    UIButton *tmp1 = [[UIButton alloc]initWithFrame:CGRectMake(136, 70, 128, 43)];
//                    [tmp1 setBackgroundImage:[UIImage imageNamed:@"popup_btn"] forState:UIControlStateNormal];
//                    [tmp1 setTitle:[buttonTitle objectAtIndex:0] forState:UIControlStateNormal];
//                    [tmp1 setTag:0];
//                    [tmp1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//                    [tmp1 addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
//                    [alertContentView addSubview:tmp1];
//                    [tmp1 release];
//                    UIButton *tmp2 = [[UIButton alloc]initWithFrame:CGRectMake(4, 70, 128, 43)];
//                    [tmp2 setBackgroundImage:[UIImage imageNamed:@"popup_btn"] forState:UIControlStateNormal];
//                    [tmp2 setTitle:[buttonTitle objectAtIndex:1] forState:UIControlStateNormal];
//                    [tmp2 setTag:1];
//                    [tmp2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//                    [tmp2 addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
//                    [alertContentView addSubview:tmp2];
//                    [tmp2 release];
//                }
                break;
            case 3:
                alertContentView = [[UIView alloc]initWithFrame:CGRectMake(21, 150, 278, 280)];
                    
                alertBoxView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"popup_box_large"]];
                [alertBoxView setFrame:CGRectMake(0, 0, 278, 280)];
                    
                [alertContentView addSubview:alertBoxView];
                    
                lbl_subTitle = [[UILabel alloc]initWithFrame:CGRectMake(12, 12, 256, 50)];
                [lbl_subTitle setBackgroundColor:[UIColor clearColor]];
                [lbl_subTitle setNumberOfLines:5];
                [lbl_subTitle setFont:[UIFont systemFontOfSize:18]];
                [lbl_subTitle setMinimumFontSize:14];
                [lbl_subTitle setText:subTitle];
                [lbl_subTitle setTextAlignment:UITextAlignmentCenter];
                [alertContentView addSubview:lbl_subTitle];
                
                if(haveCancel){
                    UIButton *tmp = [[UIButton alloc]initWithFrame:CGRectMake(12, 220, 256, 43)];
                    [tmp setBackgroundImage:[UIImage imageNamed:@"popup_btn_large"] forState:UIControlStateNormal];
                    [tmp setTitle:cancelTitle forState:UIControlStateNormal];
                    [tmp setTag:9999];
                    [tmp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    [tmp addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
                    [alertContentView addSubview:tmp];
                    [tmp release];
                    UIButton *tmp1 = [[UIButton alloc]initWithFrame:CGRectMake(12, 70, 256, 43)];
                    [tmp1 setBackgroundImage:[UIImage imageNamed:@"popup_btn_large"] forState:UIControlStateNormal];
                    [tmp1 setTitle:[buttonTitle objectAtIndex:0] forState:UIControlStateNormal];
                    [tmp1 setTag:0];
                    [tmp1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    [tmp1 addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
                    [alertContentView addSubview:tmp1];
                    [tmp1 release];
                    UIButton *tmp2 = [[UIButton alloc]initWithFrame:CGRectMake(12, 120, 256, 43)];
                    [tmp2 setBackgroundImage:[UIImage imageNamed:@"popup_btn_large"] forState:UIControlStateNormal];
                    [tmp2 setTitle:[buttonTitle objectAtIndex:1] forState:UIControlStateNormal];
                    [tmp2 setTag:1];
                    [tmp2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    [tmp2 addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
                    [alertContentView addSubview:tmp2];
                    [tmp2 release];
                    UIButton *tmp3 = [[UIButton alloc]initWithFrame:CGRectMake(12, 170, 256, 43)];
                    [tmp3 setBackgroundImage:[UIImage imageNamed:@"popup_btn_large"] forState:UIControlStateNormal];
                    [tmp3 setTitle:[buttonTitle objectAtIndex:2] forState:UIControlStateNormal];
                    [tmp3 setTag:2];
                    [tmp3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    [tmp3 addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
                    [alertContentView addSubview:tmp3];
                    [tmp3 release];
                }else{
                    UIButton *tmp1 = [[UIButton alloc]initWithFrame:CGRectMake(12, 70, 256, 43)];
                    [tmp1 setBackgroundImage:[UIImage imageNamed:@"popup_btn_large"] forState:UIControlStateNormal];
                    [tmp1 setTitle:[buttonTitle objectAtIndex:0] forState:UIControlStateNormal];
                    [tmp1 setTag:0];
                    [tmp1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    [tmp1 addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
                    [alertContentView addSubview:tmp1];
                    [tmp1 release];
                    UIButton *tmp2 = [[UIButton alloc]initWithFrame:CGRectMake(12, 120, 256, 43)];
                    [tmp2 setBackgroundImage:[UIImage imageNamed:@"popup_btn_large"] forState:UIControlStateNormal];
                    [tmp2 setTitle:[buttonTitle objectAtIndex:1] forState:UIControlStateNormal];
                    [tmp2 setTag:1];
                    [tmp2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    [tmp2 addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
                    [alertContentView addSubview:tmp2];
                    [tmp2 release];
                    UIButton *tmp3 = [[UIButton alloc]initWithFrame:CGRectMake(12, 170, 256, 43)];
                    [tmp3 setBackgroundImage:[UIImage imageNamed:@"popup_btn_large"] forState:UIControlStateNormal];
                    [tmp3 setTitle:[buttonTitle objectAtIndex:2] forState:UIControlStateNormal];
                    [tmp3 setTag:2];
                    [tmp3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    [tmp3 addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
                    [alertContentView addSubview:tmp3];
                    [tmp3 release];
                    [alertBoxView setFrame:CGRectMake(0, 0, 278, 240)];
                }
                [self addSubview:alertBGView];
                //                    [self addSubview:alertBoxView];
                [self addSubview:alertContentView];
                break;
            default:
                break;
        }
    }
    return self;
}

-(IBAction)btnPress:(UIButton*)button{

    [delegate NuAlertView:self clickedButtonAtIndex:button.tag];
    [self dismiss];

}

- (IBAction)show
{
    // Retaining self is odd, but we do it to make this "fire and forget"
    [self retain];
    
    // We need to add it to the window, which we can get from the delegate
    id appDelegate = [[UIApplication sharedApplication] delegate];
    UIWindow *window = [appDelegate window];
    [window addSubview:self];
    
    // Make sure the alert covers the whole window
    self.frame = window.frame;
    self.center = window.center;
    
    // "Pop in" animation for alert
    [alertContentView doPopInAnimationWithDelegate:self];
    
    // "Fade in" animation for background
    [alertBGView doFadeInAnimation];
}

- (IBAction)dismiss
{
    [UIView beginAnimations:nil context:nil];
    self.alpha = 0.0;
    [UIView commitAnimations];
    
    [self performSelector:@selector(alertDidFadeOut) withObject:nil afterDelay:0.5];
}

- (void)alertDidFadeOut
{    
    [self removeFromSuperview];
    [self autorelease];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    [alertBGView release];
    [alertBoxView release];
    [alertContentView release];
    [lbl_subTitle release];
    [super dealloc];
}

- (void)setSubTitleFont:(UIFont*)font{
    for (UILabel *subView in [alertContentView subviews]) {
//        NSLog(@"%@",[subView class]);
        if([subView class] == NSClassFromString(@"UILabel")){
            [subView setFont:font];
        }
    }
}

@end
