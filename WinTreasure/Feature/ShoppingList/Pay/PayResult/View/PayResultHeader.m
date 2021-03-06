//
//  PayResultHeader.m
//  WinTreasure
//
//  Created by Apple on 16/6/22.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "PayResultHeader.h"

@interface PayResultHeader ()

@property (nonatomic, strong) YYLabel *productLabel;

@end

@implementation PayResultHeader

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *texts = @[@"确认支付",@"夺宝记录"];
        CGFloat buttonPadding = 15.0;
        CGFloat buttonWidth = (kScreenWidth-buttonPadding*(texts.count+1))/texts.count;
        self.backgroundColor = [UIColor whiteColor];
        UIButton *sucButton = [UIButton buttonWithType:UIButtonTypeCustom];
        sucButton.origin = CGPointMake(0, 30);
        sucButton.size = CGSizeMake(kScreenWidth, 40);
        sucButton.userInteractionEnabled = NO;
        sucButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        sucButton.titleLabel.font = SYSTEM_FONT(30);
        sucButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [sucButton setImage:IMAGE_NAMED(@"支付成功") forState:UIControlStateNormal];
        [sucButton setTitle:@"参与夺宝成功" forState:UIControlStateNormal];
        [sucButton setTitleColor:UIColorHex(0x17A61A) forState:UIControlStateNormal];
        [self addSubview:sucButton];
        
        YYLabel *aLabel = [YYLabel new];
        aLabel.origin = CGPointMake(0, sucButton.bottom+10);
        aLabel.size = CGSizeMake(kScreenWidth, 18);
        aLabel.font = SYSTEM_FONT(16);
        aLabel.textColor = UIColorHex(666666);
        aLabel.text = @"请等待系统为您揭晓！";
        aLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:aLabel];
        
        [texts enumerateObjectsUsingBlock:^(id  _Nonnull obj,
                                            NSUInteger idx,
                                            BOOL * _Nonnull stop) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.origin = CGPointMake(buttonPadding*(idx+1)+buttonWidth*idx, aLabel.bottom+20);
            button.size = CGSizeMake(buttonWidth, 40);
            button.tag = idx+1;
            button.titleLabel.font = SYSTEM_FONT(15);
            button.layer.cornerRadius = 4.0;
            button.backgroundColor = kDefaultColor;
            if (idx==1) {
                button.backgroundColor = [UIColor whiteColor];
                button.layer.borderWidth = CGFloatFromPixel(1);
                button.layer.borderColor = kDefaultColor.CGColor;
                [button setTitleColor:kDefaultColor forState:UIControlStateNormal];
            }
            [button setTitle:texts[idx] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
        }];
        
        CAShapeLayer *seperatorLayer = [CAShapeLayer layer];
        seperatorLayer.origin = CGPointMake(0, aLabel.bottom+20+40+20);
        seperatorLayer.size = CGSizeMake(kScreenWidth, 20);
        seperatorLayer.backgroundColor = UIColorHex(0xeeeeee).CGColor;
        [self.layer addSublayer:seperatorLayer];
        
        _productLabel = [YYLabel new];
        _productLabel.origin = CGPointMake(buttonPadding, seperatorLayer.bottom+20);
        _productLabel.size = CGSizeMake(kScreenWidth-buttonPadding*2, 18);
        _productLabel.font = SYSTEM_FONT(16);
        _productLabel.textColor = UIColorHex(666666);
        _productLabel.text = @"成功参与2件商品,共2人次";
        [self addSubview:_productLabel];
        
        self.height = _productLabel.bottom+21;
    }
    return self;
}

- (void)clickButton:(UIButton *)sender {
    if (_clickButton) {
        _clickButton(sender.tag);
    }
}

@end
