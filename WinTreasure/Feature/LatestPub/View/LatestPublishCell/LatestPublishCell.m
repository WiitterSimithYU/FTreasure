//
//  LatestPublishCell.m
//  WinTreasure
//
//  Created by Apple on 16/6/16.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "LatestPublishCell.h"
#define kLatestPublishCellImageViewPadding 20
#define kLatestPublishCellImageViewMargin 8

@interface LatestPublishCell ()

@property (weak, nonatomic) IBOutlet UIImageView *productImgView;

@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *periodLabel;

@end

@implementation LatestPublishCell

- (void)awakeFromNib {
    [super awakeFromNib];

    _countLabel.textAlignment = NSTextAlignmentLeft;
    [self registerNSNotificationCenter];

}

+ (CGSize)itemSize {
    CGFloat imgHeight = (kScreenWidth-0.5)/2.0-kLatestPublishCellImageViewPadding*2;
    CGFloat productNameHeight = 38.0;
    CGFloat countLabelHeight = 30.0;
    CGSize size = CGSizeMake((kScreenWidth-0.5)/2.0, kLatestPublishCellImageViewMargin+imgHeight+kLatestPublishCellImageViewMargin+productNameHeight+14+4+15+countLabelHeight+2);
    return size;
}

- (void)loadData:(LatestPublishModel *)model indexPath:(NSIndexPath *)indexPath {
    [self storeWeakValueWithData:model indexPath:indexPath];
    [_productImgView setImageURL:[NSURL URLWithString:model.imgUrl]];
    _countLabel.text = [NSString stringWithFormat:@"%@",model.valueString];
    _productNameLabel.text = model.productName;
    _periodLabel.text = model.periodNumber;
    if ([_countLabel.text isEqualToString:@"00:00:00"]) {
        if (_delegate && [_delegate respondsToSelector:@selector(countdownDidEnd:)]) {
            [_delegate countdownDidEnd:self.indexPath];
        }
    }
}

- (void)storeWeakValueWithData:(LatestPublishModel *)model indexPath:(NSIndexPath *)indexPath {
    self.model = model;
    self.indexPath = indexPath;
}

#pragma mark - 通知中心
- (void)registerNSNotificationCenter {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notificationCenterEvent:)
                                                 name:NOTIFICATION_TIME_CELL
                                               object:nil];
}

- (void)removeNSNotificationCenter {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFICATION_TIME_CELL object:nil];
}

- (void)notificationCenterEvent:(id)sender {
    
    if (self.isDisplayed) {
        [self loadData:self.model indexPath:self.indexPath];
    }
}

- (void)dealloc {
    
    [self removeNSNotificationCenter];
}

@end
