//
//  WorkView.m
//  vwork
//
//  Created by 王鑫 on 2019/03/15.
//  Copyright © 2019年 wangxin. All rights reserved.
//

#import "WorkTableView.h"
#import "WorkTableViewCell.h"
#import "Work.h"
#import <WXKit/WXMacro.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import <MJRefresh/MJRefresh.h>

@interface WorkTableView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) WorkVM *vm;
@property (nonatomic, strong) NSArray *datas;
@property (nonatomic, assign) int page;

@end

@implementation WorkTableView

- (instancetype)initWithVM:(WorkVM *)vm {
    self = [super init];
    if (self) {
        self.vm = vm;
        [self initView];
        [self fillView];
    }
    return self;
}

#pragma mark - View
- (void)initView {
    self.frame = CGRectMake(0, 0, kScreen.width, kScreen.height);
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.delegate = self;
    self.dataSource = self;
    
    // separate
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1)];
    footerView.backgroundColor = [UIColor clearColor];
    self.tableFooterView = footerView;
    
    [self initRefresh];
}

- (void)initRefresh {
    // 头部
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 1;
        [self.vm get:self.page];
    }];
    header.lastUpdatedTimeLabel.hidden = YES;
    self.mj_header = header;
    [self.mj_header beginRefreshing];
    
    // 尾部
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        self.page++;
        [self.vm get:self.page];
    }];
    footer.refreshingTitleHidden = YES;
    footer.stateLabel.hidden = YES;
    self.mj_footer = footer;
}

/**
 *  UITableViewDelegate
 **/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas ? self.datas.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifier = @"WorkTableViewCell";
    WorkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[WorkTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    [cell fillView:self.datas[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - Model
- (void)fillView {
    [RACObserve(self.vm, datas) subscribeNext:^(id  _Nullable x) {
        self.datas = x;
        [self reloadData];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.mj_header endRefreshing];
            [self.mj_footer endRefreshing];
        });
    }];
}

@end
