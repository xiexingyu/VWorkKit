//
//  WorkVC.m
//  vwork
//
//  Created by 王鑫 on 2019/03/15.
//  Copyright © 2019年 wangxin. All rights reserved.
//

#import "WorkVC.h"
#import "WorkVM.h"
#import "WorkTableView.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface WorkVC ()

@property (nonatomic, strong) WorkVM *vm;
@property (nonatomic, strong) WorkTableView *tableView;

@end

@implementation WorkVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.vm = [[WorkVM alloc] initWithVC:self];
    [self initView];
    [self initTableView];
}

#pragma mark - View
- (void)initView {
    self.title = @"办公";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertWork)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)insertWork {
    [self.vm insert];
}

- (void)initTableView {
    self.tableView = [[WorkTableView alloc] initWithVM:self.vm];
    [self.view addSubview:self.tableView];
}

@end
