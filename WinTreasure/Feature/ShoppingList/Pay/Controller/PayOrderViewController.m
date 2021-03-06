//
//  PayOrderViewController.m
//  WinTreasure
//
//  Created by Apple on 16/6/20.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "PayOrderViewController.h"
#import "PayResultViewController.h"
#import "PayorderView.h"
#import "TopUpCell.h"

@interface PayOrderViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSIndexPath *_selectedIndexPath;
}
@property (nonatomic, assign) BOOL isTimeOut;

@property (nonatomic, strong) NSArray *imgs;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation PayOrderViewController

- (NSArray *)imgs {
    if (!_imgs) {
        _imgs = @[@"微信支付",@"招行",@"招行",@"其它银行"];
    }
    return _imgs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"支付订单";
    [self setupHeader];
    [self setupFooter];
}

- (void)setupHeader {
    PayorderView *orderView = [[PayorderView alloc]init];
    _tableView.tableHeaderView = orderView;
}

- (void)setupFooter {
    UIView *contentView = [[UIView alloc]initWithFrame:({
        CGRect rect = {0,0,kScreenWidth,65};
        rect;
    })];
    
    UIButton *payButton = [UIButton buttonWithType:UIButtonTypeCustom];
    payButton.frame = ({
        CGRect rect = {10,10,kScreenWidth-10*2,contentView.height-10*2};
        rect;
    });
    payButton.backgroundColor = kDefaultColor;
    payButton.titleLabel.font = SYSTEM_FONT(15);
    payButton.layer.cornerRadius = 3.0;
    [payButton setTitle:@"确认支付" forState:UIControlStateNormal];
    [payButton addTarget:self action:@selector(confirmPay) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:payButton];
    _tableView.tableFooterView = contentView;
}

- (void)confirmPay {
    PayResultViewController *vc = [[PayResultViewController alloc]init];
    [self hideBottomBarPush:vc];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imgs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TopUpCell *cell = [TopUpCell cellWithTableView:tableView];
    cell.imgView.image = IMAGE_NAMED(_imgs[indexPath.row]);
    cell.payWayLabel.text = _imgs[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TopUpCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (_selectedIndexPath) {
        TopUpCell *selectedCell = [tableView cellForRowAtIndexPath:_selectedIndexPath];
        selectedCell.selecedButton.hidden = YES;
    }
    _selectedIndexPath = indexPath;
    cell.selecedButton.hidden = NO;
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}


@end
