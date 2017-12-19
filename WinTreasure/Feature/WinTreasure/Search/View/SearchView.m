//
//  SearchView.m
//  WinTreasure
//
//  Created by Apple on 16/6/24.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "SearchView.h"

@interface SearchView () <UISearchBarDelegate>

@end

@implementation SearchView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _searchBar=[[UISearchBar alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth-70, 30)];
        [_searchBar setSearchBarStyle:UISearchBarStyleMinimal];
        [_searchBar setDelegate:self];
        [self addSubview:_searchBar];
        
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(_searchBar.frame.size.width+10, 0, 50, 30);
        button.titleLabel.font = SYSTEM_FONT(14);
        [button setTitle:@"取消" forState:UIControlStateNormal];
        [button setTitleColor:UIColorHex(999999) forState:UIControlStateNormal];
        [button setTitleColor:UIColorHex(666666) forState:UIControlStateSelected];
        [button addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];        
    }
    return self;
}

- (void)beginSearch {
    [_searchBar becomeFirstResponder];
}

- (void)pop {
    [_searchBar resignFirstResponder];
    if (_cancelBlock) {
        _cancelBlock();
    }
}

- (NSString *)text {
    return _searchBar.text;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    if (_delegate&&[_delegate respondsToSelector:@selector(searchViewShouldBeginEditing:)]) {
        [_delegate searchViewShouldBeginEditing:self];
    }
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    if (_delegate&&[_delegate respondsToSelector:@selector(searchViewTextDidBeginEditing:)]) {
        [_delegate searchViewTextDidBeginEditing:self];
    }
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    if (_delegate&&[_delegate respondsToSelector:@selector(searchViewShouldEndEditing:)]) {
        [_delegate searchViewShouldEndEditing:self];
    }
    return YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    if (_delegate&&[_delegate respondsToSelector:@selector(searchViewTextDidEndEditing:)]) {
        [_delegate searchViewTextDidEndEditing:self];
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (_delegate&&[_delegate respondsToSelector:@selector(searchView:textDidChange:)]) {
        [_delegate searchView:self textDidChange:searchText];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (_delegate&&[_delegate respondsToSelector:@selector(searchViewSearchButtonClicked:)]) {
        [_delegate searchViewSearchButtonClicked:self];
    }
}

@end
