//
//  LuckyRecordModel.m
//  WinTreasure
//
//  Created by Apple on 16/6/15.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "LuckyRecordModel.h"

@implementation LuckyRecordModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.productLuckyNo = @"10008611";
        self.productImgUrl = @"https://tse4-mm.cn.bing.net/th?id=OIP.M9271c634f71d813901afbc9e69602dcfo2&pid=15.1";
        self.productName = @"斯嘉丽·约翰逊(Scarlett Johansson),1984年11月22日生于纽约，美国女演员。";
        self.productNeedAmount = @"9999";
        self.productPartInAmount = @"9998";
        self.productPeriodNo = @"30978754";
        self.productPublishTime = @"2016-06-10";
    }
    return self;
}

@end
