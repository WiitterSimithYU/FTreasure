//
//  LocationModel.m
//  iLight
//
//  Created by linitial on 5/11/15.
//  Copyright (c) 2015 linitial. All rights reserved.
//

#import "LocationModel.h"
#import "CityModel.h"

@implementation LocationModel

- (id)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    
    if (self) {
        self.locationCode = [dic objectForKey:@"ProvinceCode"];
        self.locationId = [dic objectForKey:@"ProvinceId"];
        self.locationPinyin = [dic objectForKey:@"ProvincePinyin"];
        self.locationName = [dic objectForKey:@"ProviceName"];
        NSArray *cityArr = (NSArray *)[dic objectForKey:@"CityList"];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [cityArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                CityModel *model = [[CityModel alloc]initWithDictionary:obj];
                [self.cityArray addObject:model];
            }];
        });
    }
    
    return self;
}

- (NSMutableArray *)cityArray {
    if (!_cityArray) {
        _cityArray = [NSMutableArray array];
    }
    return _cityArray;
}
@end
