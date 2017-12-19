//
//  TreasureDetailModel.m
//  WinTreasure
//
//  Created by Apple on 16/6/23.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "TreasureDetailModel.h"

@implementation TreasureDetailModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.imgUrl = @"https://tse4-mm.cn.bing.net/th?id=OIP.M9271c634f71d813901afbc9e69602dcfo2&pid=15.1";
        self.nickname = @"斯嘉丽·约翰逊(Scarlett Johansson)";
        self.ipAddress = @"(美国好莱坞：1.1.1.1)";
        self.partInTimes = @5;
        self.time = @"2016-05-18 14:15:16";
    }
    return self;
}

@end
