//
//  MultiUserCell.m
//  NUCal
//
//  Created by MGIE on 7/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MultiUserCell.h"

#import "NUCalViewController.h"
extern NUCalViewController *mainController;

@implementation MultiUserCell

@synthesize b_detail, b_select;
//@synthesize b_select;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier profile:(Profile *)profile row:(NSInteger)indexRow
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        currentRow = indexRow;

        b_select = [[UIButton alloc] initWithFrame:CGRectMake(20, 9, 26, 26)];
        [b_select setImage:[UIImage imageNamed:@"btn_radio.png"] forState:UIControlStateNormal];
        [b_select setImage:[UIImage imageNamed:@"btn_radio_on.png"] forState:UIControlStateSelected];
        [b_select addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [b_select setUserInteractionEnabled:NO];
        [self addSubview:b_select];
        [b_select release];
        
        b_detail = [[UIButton alloc]initWithFrame:CGRectMake(285, 9, 26, 26)];
        [b_detail setImage:[UIImage imageNamed:@"btn_details.png"] forState:UIControlStateNormal];
        
        [self addSubview:b_detail];
        [b_detail release];
        
        UIImageView *im_bound = [[UIImageView alloc] initWithFrame:CGRectMake(53, 0, 44, 44)];
        [im_bound setImage:[UIImage imageNamed:@"userpic_large.png"]];
        [self addSubview:im_bound];
        [im_bound release];
        
        iv_profile = [[UIImageView alloc] initWithFrame:CGRectMake(56, 3, 38, 38)];
        if ([profile profile_pic] != nil)
            [iv_profile setImage:[profile profile_pic]];
        else
            [iv_profile setImage:[UIImage imageNamed:@"userpic_default.png"]];
        [self addSubview:iv_profile];
        [iv_profile release];
        
        l_name = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 200, self.frame.size.height)];
        [self addSubview:l_name];
        [l_name setBackgroundColor:[UIColor clearColor]];
        [l_name setText:[profile userName]];
        [l_name release];
        
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void) buttonPressed:(id) sender
{
//    if (sender == b_select)
//    {
//        [b_select setSelected:YES];
//    }
//    if (sender == b_detail)
//    {
//        mainController.newUser = NO;
//        NSString *view = @"UserProfile";
//        NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys: view, @"view", nil];
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"loadView" object:self userInfo:dictionary];
//    }
}

-(void)setCellEndEditingPos{
    [b_select setHidden:NO];
    [b_detail setHidden:NO];
//    [lbl_date setFrame:CGRectMake(20, 0, 220, 35)];
}

-(void)setCellBeginEditingPos{
    [b_select setHidden:YES];
    [b_detail setHidden:YES];
//    [lbl_date setFrame:CGRectMake(50, 0, 180, 35)];
}

@end
