//
//  LogisticsCell.m
//  WinTreasure
//
//  Created by Apple on 16/6/28.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "LogisticsCell.h"

@interface LogisticsCell ()

@property (nonatomic, strong) CAShapeLayer *stautsLayer;

@end

@implementation LogisticsCell

- (CAShapeLayer *)stautsLayer {
    if (!_stautsLayer) {
        _stautsLayer = [CAShapeLayer layer];
        _stautsLayer.origin = CGPointMake(15, 25);
        _stautsLayer.size = CGSizeMake(10, 10);
        _stautsLayer.backgroundColor = UIColorHex(666666).CGColor;
        _stautsLayer.cornerRadius = 5.0;
    }
    return _stautsLayer;
}

- (void)awakeFromNib {
    [super awakeFromNib];

    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.origin = CGPointMake(20, 0);
    lineLayer.size = CGSizeMake(CGFloatFromPixel(1), self.height);
    lineLayer.backgroundColor = UIColorHex(0xeeeeee).CGColor;
    [self.contentView.layer addSublayer:lineLayer];

    [self.contentView.layer addSublayer:self.stautsLayer];
    
}

+ (instancetype)cellWithTableView:(UITableView *)tableview {
    static NSString *cellID = @"LogisticsCell";
    LogisticsCell *cell = [tableview dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = (LogisticsCell *)[[[NSBundle mainBundle] loadNibNamed:@"LogisticsCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(LogisticsModel *)model {
    _model = model;
    _statusLabel.text = _model.status;
    _timeLabel.text = _model.time;
    _stautsLayer.backgroundColor = _model.isUpdated ? UIColorHex(0x22A44E).CGColor : UIColorHex(666666).CGColor;
}

@end

@implementation LogisticsFollowCell

+ (instancetype)cellWithTableView:(UITableView *)tableview {
    static NSString *cellID = @"LogisticsFollowCell";
    LogisticsFollowCell *cell = [tableview dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil) {
        cell = [[LogisticsFollowCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    for (UIView *view in self.subviews) {
        if([view isKindOfClass:[UIScrollView class]]) {
            ((UIScrollView *)view).delaysContentTouches = NO;
            // Remove touch delay for iOS 7
            break;
        }
    }
    self.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0);
    self.exclusiveTouch = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.contentView.backgroundColor = [UIColor whiteColor];
    YYLabel *titleLabel = [YYLabel new];
    titleLabel.font = SYSTEM_FONT(16);
    titleLabel.origin = CGPointMake(15, (self.height-16)/2.0);
    titleLabel.size = CGSizeMake(kScreenWidth-15*2, 16);
    titleLabel.textColor = UIColorHex(333333);
    titleLabel.text = @"物流跟踪";
    [self.contentView addSubview:titleLabel];
    return self;
}

@end
