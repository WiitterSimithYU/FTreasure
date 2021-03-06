//
//  NoticeCell.m
//  WinTreasure
//
//  Created by Apple on 16/7/4.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "NoticeCell.h"

@implementation NoticeCell

+ (instancetype)cellWithTableView:(UITableView *)tableview {
    static NSString *cellID = @"NoticeCell";
    NoticeCell *cell = [tableview dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = (NoticeCell *)[[[NSBundle mainBundle] loadNibNamed:@"NoticeCell" owner:self options:nil] lastObject];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    return cell;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
