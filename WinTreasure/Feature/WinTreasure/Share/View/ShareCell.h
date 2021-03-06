//
//  ShareCell.h
//  WinTreasure
//
//  Created by Apple on 16/6/8.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareLayout.h"

@class ShareCell;

@interface ShareView : UIView

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UIButton *headButton;

@property (nonatomic, strong) YYLabel *usernameLabel;

@property (nonatomic, strong) YYLabel *timeLabel;

@property (nonatomic, strong) ShareLayout *layout;

/**背景图
 */
@property (nonatomic, strong) UIImageView *backImageView;

/**分享标题
 */
@property (nonatomic, strong) YYLabel *headLabel;

/**产品名称
 */
@property (nonatomic, strong) YYLabel *productNameLabel;

/**产品期号
 */
@property (nonatomic, strong) YYLabel *periodLabel;

/**分享内容
 */
@property (nonatomic, strong) YYLabel *contentLabel;

/**图片
 */
@property (nonatomic, strong) NSArray<UIView *> *picViews;

@property (nonatomic, weak) ShareCell *cell;

- (void)_hideImageViews;

@end

typedef void(^ShareCellHeadImageBlock)(NSIndexPath *indexPath);

@interface ShareCell : UITableViewCell

@property (nonatomic, strong) ShareView *shareView;

@property (nonatomic, copy) NSIndexPath *indexpath;

@property (nonatomic, copy) ShareCellHeadImageBlock clickHeadImage;

- (void)setLayout:(ShareLayout *)layout;

+ (instancetype)cellWithTableView:(UITableView *)tableview;

@end
