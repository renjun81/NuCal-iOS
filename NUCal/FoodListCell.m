//
//  FoodListCell.m
//  NUCal
//
//  Created by MGIE on 05/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FoodListCell.h"
#import "FoodList.h"

@implementation FoodListCell

@synthesize v_lowfat , v_lowsalt , v_lowsugar , v_lowthree;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withController:(FoodList*)list
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTick:) name:@"setTickAble" object:nil];
    currentFoodList = list;
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImage *lowfat = [UIImage imageNamed:@"icon_lowfat.png"];
        UIImage *lowsalt = [UIImage imageNamed:@"icon_lowsalt.png"];
        UIImage *lowsugar = [UIImage imageNamed:@"icon_lowsugar.png"];
        UIImage *lowthree = [UIImage imageNamed:@"icon_3low.png"];
        
        v_lowfat = [[UIImageView alloc]initWithImage:lowfat];
        v_lowsalt = [[UIImageView alloc]initWithImage:lowsalt];
        v_lowsugar = [[UIImageView alloc]initWithImage:lowsugar];
        v_lowthree = [[UIImageView alloc]initWithImage:lowthree];
        
//        UIImageView *upperLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"line.png"]];
//        [upperLine setCenter:CGPointMake(160, 0)];
//        
//        UIImageView *lowerLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"line.png"]];
//        [lowerLine setCenter:CGPointMake(160, 45)];
        
        btn_Select = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 45, 45)];
        [btn_Select setImage:[UIImage imageNamed:@"checklist_off.png"] forState:UIControlStateNormal];
        [btn_Select setImage:[UIImage imageNamed:@"checklist_on.png"] forState:UIControlStateSelected];
        [btn_Select setContentMode:UIViewContentModeCenter];
        [btn_Select addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        
        lbl_Title = [[UILabel alloc]initWithFrame:CGRectMake(40, 0, 100, 45)];
        [lbl_Title setBackgroundColor:[UIColor clearColor]];
        
        arrow = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"btn_details.png"]];
        [arrow setFrame:CGRectMake(286, 11, 22, 22)];
        
        btn_EditFood = [[UIButton alloc]initWithFrame:CGRectMake(240, 0, 80, 45)];
        [btn_EditFood addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:v_lowfat];
        [self addSubview:v_lowsalt];
        [self addSubview:v_lowsugar];
        [self addSubview:v_lowthree];
//        
        [v_lowfat setCenter:CGPointMake(170, 20)];
        [v_lowsalt setCenter:CGPointMake(200, 20)];
        [v_lowsugar setCenter:CGPointMake(230, 20)];
        [v_lowthree setCenter:CGPointMake(260, 20)];

        [self addSubview:arrow];
        [self addSubview:btn_Select];
        [self addSubview:btn_EditFood];
        [self addSubview:lbl_Title];
//        [self addSubview:upperLine];
//        [self addSubview:lowerLine];
        [arrow release];
        [btn_Select release];
        [btn_EditFood release];
        [lbl_Title release];
        [v_lowfat release];
        [v_lowsalt release];
        [v_lowsugar release];
        [v_lowthree release];
//        [upperLine release];
//        [lowerLine release];
    }
    return self;
}

-(void)setCellBeginEditingPos{
    [btn_Select setFrame:CGRectMake(0, 0, 45, 45)];
    [lbl_Title setFrame:CGRectMake(40, 0, 100, 45)];
    
    [v_lowfat setCenter:CGPointMake(146, 20)];
    [v_lowsalt setCenter:CGPointMake(174, 20)];
    [v_lowsugar setCenter:CGPointMake(205, 20)];
    [v_lowthree setCenter:CGPointMake(236, 20)];
}

-(void)setCellEndEditingPos{
    [btn_Select setFrame:CGRectMake(0, 0, 45, 45)];
    [lbl_Title setFrame:CGRectMake(40, 0, 100, 45)];
    [v_lowfat setCenter:CGPointMake(171, 20)];
    [v_lowsalt setCenter:CGPointMake(199, 20)];
    [v_lowsugar setCenter:CGPointMake(230, 20)];
    [v_lowthree setCenter:CGPointMake(259, 20)];
}

- (void)setCellID:(int)ID{
    cellID = ID;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(BOOL)isBtnSelected{
    return  btn_Select.selected;
}

-(UILabel*)textLabel{
    return lbl_Title;
}

-(IBAction)selectClick:(UIButton*)button{
    if(button == btn_Select){
        if(btn_Select.selected == YES){
            btn_Select.selected = NO;
            [currentFoodList removeIntake:cellID];
        }
        else if(btn_Select.selected == NO){
            btn_Select.selected = YES;
            [currentFoodList addIntake:cellID];
        }
    }
    if(button == btn_EditFood){
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loadEditFood" object:[NSNumber numberWithInt:cellID]];
    }
}

-(void)setBtnSelected:(BOOL)selected{
    [btn_Select setSelected:selected];
}

//- (void)willTransitionToState:(UITableViewCellStateMask)state {
//    
//    [super willTransitionToState:state];
//    
//    if ((state & UITableViewCellStateShowingDeleteConfirmationMask) == UITableViewCellStateShowingDeleteConfirmationMask) {
//        
//        for (UIView *subview in self.subviews) {
//            
//            if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewCellDeleteConfirmationControl"]) {             
//                
//                subview.hidden = YES;
//                subview.alpha = 0.0;
//            }
//        }
//    }
//}
//
//- (void)didTransitionToState:(UITableViewCellStateMask)state {
//    
//    [super didTransitionToState:state];
//    
//    if (state == UITableViewCellStateShowingDeleteConfirmationMask || state == UITableViewCellStateDefaultMask) {
//        for (UIView *subview in self.subviews) {
//            
//            if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewCellDeleteConfirmationControl"]) {
//                
//                UIView *deleteButtonView = (UIView *)[subview.subviews objectAtIndex:0];
//                CGRect f = deleteButtonView.frame;
//                f.origin.x -= 20;
//                deleteButtonView.frame = f;
//                
//                subview.hidden = NO;
//                
//                [UIView beginAnimations:@"anim" context:nil];
//                subview.alpha = 1.0;
//                [UIView commitAnimations];
//            }
//        }
//    }
//}

-(void)setTick:(NSNotification *)notification{
    NSString *tmp = [notification object];
    NSLog(@"%@", tmp);
    if([tmp isEqualToString:@"NO"]){
        [btn_Select setHidden:YES];
        [btn_EditFood setHidden:YES];
        [arrow setHidden:YES];
    }
    else if([tmp isEqualToString:@"YES"]){
        [btn_Select setHidden:NO];
        [btn_EditFood setHidden:NO];
        [arrow setHidden:NO];
    }
}

- (void)dealloc
{
    [super dealloc];
}

@end
