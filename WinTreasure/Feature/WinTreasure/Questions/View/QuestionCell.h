//
//  QuestionCell.h
//  WinTreasure
//
//  Created by Apple on 16/6/13.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionCell : UITableViewCell

@property (nonatomic, copy) NSString *answer;

@property (nonatomic, strong) YYLabel *answerLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableview;

+ (CGFloat)height:(NSString *)answer;

@end
