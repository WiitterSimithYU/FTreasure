//
//  PublishedCell.h
//  WinTreasure
//
//  Created by Apple on 16/6/15.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LatestPublishModel;

@interface PublishedCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *productImagView;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *periodNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;
@property (weak, nonatomic) IBOutlet UILabel *participateLabel;
@property (weak, nonatomic) IBOutlet UILabel *luckyNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *publishTimeLabel;


@property (strong, nonatomic) LatestPublishModel *model;

+ (CGSize)getItemSize;

@end
