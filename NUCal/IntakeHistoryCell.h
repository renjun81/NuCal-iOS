//
//  IntakeHistoryCell.h
//  NUCal
//
//  Created by MGIE on 08/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface IntakeHistoryCell : UITableViewCell {
    int cellID;
    BOOL isOver;
    UILabel *lbl_date;
    UIImageView *healthIcon;
    
    UIImageView *arrowImg;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier detailIcon:(BOOL)detailIconHidden;

- (void)setID:(int)ID;

- (void)setOver:(BOOL)over;

-(void)setCellBeginEditingPos;
-(void)setCellEndEditingPos;

@end
