//
//  AffairVC.m
//  outwork
//
//  Created by 王鑫 on 2019/03/14.
//  Copyright © 2019年 wangxin. All rights reserved.
//

#import "AffairVC.h"
#import "AffairVM.h"
#import "AffairTableView.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface AffairVC ()

@property (nonatomic, strong) AffairVM *vm;
@property (nonatomic, strong) AffairTableView *tableView;

@end

@implementation AffairVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.vm = [[AffairVM alloc] initWithVC:self];
    [self initView];
    [self initTableView];
}

#pragma mark - View
- (void)initView {
    self.title = @"模版";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertAffair)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)insertAffair {
    [self.vm insert];
}

- (void)initTableView {
    self.tableView = [[AffairTableView alloc] initWithVM:self.vm];
    [self.view addSubview:self.tableView];
}

@end
