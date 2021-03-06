//
//  TreasureDetailViewController.m
//  WinTreasure
//
//  Created by Apple on 16/6/3.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "TreasureDetailViewController.h"
#import "ProductDetailsViewController.h"
#import "PersonalCenterViewController.h"
#import "ShoppingListViewController.h"
#import "EarlyPublishViewController.h"
#import "CountDetailViewController.h"
#import "ShareViewController.h"
#import "TreasureDetailHeader.h"
#import "TreasureDetailCell.h"
#import "TreasurePriceView.h"
#import "TreasureDetailFooter.h"
#import "WinTreasureModel.h"

@interface TreasureDetailViewController () <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,TreasureDetailFooterDelegate> {
    BOOL _isAdded;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) TreasureDetailFooter *footer;

@property (strong, nonatomic) NSMutableArray *datasource;

@end

@implementation TreasureDetailViewController

- (NSMutableArray *)datasource {
    if (!_datasource) {
        _datasource = [NSMutableArray array];
    }
    return _datasource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftImageNamed:@"detail_nav_back" action:nil];
    [self setupNavBarItems];
    [self configBottomMenu];
    [self getDatasource];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNavigationBarBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]]
                                tintColor:[UIColor clearColor]
                                textColor:[UIColor clearColor]
                           statusBarStyle:UIStatusBarStyleDefault];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setCoverViewBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0]];
}

- (void)getDatasource {
    for (int i=0; i<8; i++) {
        TreasureDetailModel *model = [[TreasureDetailModel alloc]init];
        [self.datasource addObject:model];
    }
    [_tableView reloadData];
    [self configTableView];
}

- (void)configTableView {
    _tableView.estimatedRowHeight = 35;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    TreasureDetailHeader *header = [[TreasureDetailHeader alloc]initWithFrame:({
        CGRect rect = {0, 0, kScreenWidth, 1};
        rect;
    }) type:_showType countTime:_count];
    @weakify(self);
    header.clickMenuBlock = ^(id object) {
        @strongify(self);
        [self setBackItem];
        switch ([object integerValue]) {
            case 0: {
                ProductDetailsViewController *vc = [[ProductDetailsViewController alloc]init];
                [self hideBottomBarPush:vc];
            }
                break;
            case 1: {
                NSLog(@"往期揭晓");
                EarlyPublishViewController *vc = [[EarlyPublishViewController alloc]init];
                [self hideBottomBarPush:vc];
            }
                break;
            case 2: {
                ShareViewController *vc = [[ShareViewController alloc]init];
                [self hideBottomBarPush:vc];
            }
                break;
            default:
                break;
        }
    };
    header.countDetailBlock = ^(){
        NSLog(@"计算详情");
        @strongify(self);
        [self setBackItem];
        CountDetailViewController *vc = [[CountDetailViewController alloc]init];
        [self hideBottomBarPush:vc];

    };
    _tableView.tableHeaderView = header;
}

- (void)setupNavBarItems {
    NSArray *imgs = @[@"detail_nav_share",@"detail_nav_home",@"detail_nav_car"];
    [self setupRightItems:imgs];
    @weakify(self);
    self.block = ^(NSInteger index) {
        NSLog(@"index %@",@(index));
        @strongify(self);
        switch (index) {
            case 1: {
                NSLog(@"分享");
            }
                break;
            case 2: {
                [self.navigationController popViewControllerAnimated:YES];
            }
                break;
            case 3: {
                [self setBackItem];
                ShoppingListViewController *vc = [[ShoppingListViewController alloc]init];
                vc.isPushed = YES;
                [self hideBottomBarPush:vc];
            }
                break;
            default:
                break;
        }
    };
}

- (void)configBottomMenu {
    _footer = [[TreasureDetailFooter alloc]initWithType:(_showType==TreasureDetailHeaderTypeNotParticipate)?TreasureUnPublishedType:TreasurePublishedType];
    _footer.delegate = self;
    [self.view addSubview:_footer];
}

#pragma mark - TreasureDetailFooterDelegate
- (void)checkNewTreasre { //(新一轮前往)
    TreasureDetailViewController *vc =[[TreasureDetailViewController alloc]init];
    [self hideBottomBarPush:vc];
}

- (void)clickMenuButtonWithIndex:(NSInteger)index {
    switch (index) {
        case 1: {
            TreasurePriceView *priceView = [TreasurePriceView priceViewWithData:@[@"10",@"20",@"50",@"100"]];
            [priceView show];
            priceView.winTreasure = ^(){ //点击立即夺宝
                [self setBackItem];
                [AppDelegate getAppDelegate].value = 1;
                ShoppingListViewController *vc = [[ShoppingListViewController alloc]init];
                vc.isPushed = YES;
                [self hideBottomBarPush:vc];
            };
        }
            break;
        case 2: {
            if (!_isAdded) {
                [AppDelegate getAppDelegate].value += 1;
                [self setTreasureDetailBadge:[AppDelegate getAppDelegate].value];
                _isAdded = YES;
                return;
            }
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                           message:@"已加入清单"
                                                          delegate:self
                                                 cancelButtonTitle:nil
                                                 otherButtonTitles:@"确定", nil];
            [alert show];
        }
            break;
        default:
            break;
    }
}

#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasource.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        TimeLineCell *cell = [TimeLineCell cellWithTableView:tableView];
        cell.timeLine = @"2016-05-18";
        return cell;
    }
    TreasureDetailCell *cell = [TreasureDetailCell cellWithTableView:tableView];
    cell.indexPath = indexPath;
    cell.model = _datasource[indexPath.row - 1];
    @weakify(self);
    cell.clickHeadImage = ^(NSIndexPath *indexpath) {
        @strongify(self);
        [self setBackItem];
        PersonalCenterViewController *vc = [[PersonalCenterViewController alloc]init];
        [self hideBottomBarPush:vc];
    };
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self setNavigationBarCover:scrollView color:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}



@end
