//
//  PersonalCenterCell.m
//  WinTreasure
//
//  Created by Apple on 16/6/14.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "PersonalTreasureCell.h"

@implementation ResultView

- (instancetype)initWithFrame:(CGRect)frame type:(ResultViewType)type {
    self = [super initWithFrame:frame];
    if (self) {
        _type = type;
    }
    return self;
}

- (void)setup {
    switch (_type) {
        case ResultViewTypeNotFull:
            
            break;
        case ResultViewTypePublished:
            
            break;
        case ResultViewTypeUnPublished:
            
            break;
        default:
            break;
    }
}

@end

@implementation PersonalTreasureCell

+ (instancetype)cellWithTableView:(UITableView *)tableview {
    static NSString *cellID = @"PersonalTreasureCell";
    PersonalTreasureCell *cell = [tableview dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil) {
        cell = [[PersonalTreasureCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = UIColorHex(0xe5e5e5);
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
