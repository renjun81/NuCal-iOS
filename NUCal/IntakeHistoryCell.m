//
//  IntakeHistoryCell.m
//  NUCal
//
//  Created by MGIE on 08/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IntakeHistoryCell.h"


@implementation IntakeHistoryCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier detailIcon:(BOOL)detailIconHidden
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        isOver = NO;
        lbl_date = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 220, 35)];
        float version = [[[UIDevice currentDevice] systemVersion] floatValue];
        if(version >= 4.0){
            [lbl_date setFont:[UIFont fontWithName:@"HelveticaNeueLT-MediumCond" size:self.textLabel.font.pointSize]];
        }
        [lbl_date setBackgroundColor:[UIColor clearColor]];
        healthIcon = [[UIImageView alloc]initWithFrame:CGRectMake(240, 3, 28, 24)];
        
        if (!detailIconHidden) {
             arrowImg = [[UIImageView alloc]initWithFrame:CGRectMake(285, 5, 26, 26)];
            [arrowImg setImage:[UIImage imageNamed:@"btn_details.png"]];
            [self addSubview:arrowImg];
            [arrowImg release];
        }
        [self addSubview:lbl_date];
        [self addSubview:healthIcon];
        [lbl_date release];
        [healthIcon release];
        
    }
    return self;
}

- (void)setID:(int)ID{
    cellID = ID;
}

- (UILabel*)textLabel{
    return lbl_date;
}

- (void)setOver:(BOOL)over{
    isOver = over;
    if (!isOver) {
        [healthIcon setImage:[UIImage imageNamed:@"smiley"]];
        [healthIcon setFrame:CGRectMake(240, 5, 25, 25)];
    }else{
        [healthIcon setImage:[UIImage imageNamed:@"icon_alert.png"]];
        [healthIcon setFrame:CGRectMake(240, 3, 28, 24)];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellEndEditingPos{
    [healthIcon setHidden:NO];
    [arrowImg setHidden:NO];
    [lbl_date setFrame:CGRectMake(20, 0, 220, 35)];
}

-(void)setCellBeginEditingPos{
    [healthIcon setHidden:YES];
    [arrowImg setHidden:YES];
    [lbl_date setFrame:CGRectMake(50, 0, 180, 35)];
}

- (void)dealloc
{
    [super dealloc];
}

@end
