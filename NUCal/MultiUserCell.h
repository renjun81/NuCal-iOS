//
//  MultiUserCell.h
//  NUCal
//
//  Created by MGIE on 7/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profile.h"

@interface MultiUserCell : UITableViewCell  {

    Profile *currentRowProfilel;
    UIButton *b_detail;
    UIButton *b_select;
    UIImageView *iv_profile;
    UILabel *l_name;
    NSInteger currentRow;
}

@property (nonatomic, retain) UIButton *b_select, *b_detail;



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier profile:(Profile *)profile row:(NSInteger)indexRow;

- (void) buttonPressed:(id) sender;

-(void)setCellBeginEditingPos;
-(void)setCellEndEditingPos;

@end
