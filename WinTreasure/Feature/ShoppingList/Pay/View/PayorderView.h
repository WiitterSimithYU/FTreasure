//
//  PayorderView.h
//  WinTreasure
//
//  Created by Apple on 16/6/21.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayorderView : UIView

/**订单编号
 */
@property (nonatomic,copy) NSString *orderNumber;

/**订单金额
 */
@property (nonatomic,copy) NSString *orderSum;


@end
