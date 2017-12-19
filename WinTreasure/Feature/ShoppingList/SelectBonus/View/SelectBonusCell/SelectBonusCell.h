//
//  SelectBonusCell.h
//  WinTreasure
//
//  Created by Apple on 16/6/21.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectBonusModel.h"

@interface SelectBonusCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *selectButton;

@property (strong, nonatomic) SelectBonusModel *model;

+ (CGFloat)height;
+ (instancetype)cellWithTableView:(UITableView *)tableview;

@end
