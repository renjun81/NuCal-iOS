//
//  FoodListCell.h
//  NUCal
//
//  Created by MGIE on 05/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FoodList;

@interface FoodListCell : UITableViewCell {
    FoodList *currentFoodList;
    UIButton *btn_Select;
    UILabel *lbl_Title;
    UIButton *btn_EditFood;
    UIImageView *arrow;
    int cellID;
    UIImageView *v_lowfat;
    UIImageView *v_lowsalt;
    UIImageView *v_lowsugar;
    UIImageView *v_lowthree; 
}

@property (nonatomic, retain)  UIImageView *v_lowfat, *v_lowsalt , *v_lowsugar , *v_lowthree;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withController:(FoodList*)list;
- (void)setCellID:(int)ID;
-(void)setBtnSelected:(BOOL)selected;
-(void)setCellBeginEditingPos;
-(void)setCellEndEditingPos;

@end
