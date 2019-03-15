//
//  WorkVM.m
//  vwork
//
//  Created by 王鑫 on 2019/03/15.
//  Copyright © 2019年 wangxin. All rights reserved.
//

#import "WorkVM.h"
#import "Work.h"
#import <WXKit/WXBaseRequest.h>

@implementation WorkVM

- (instancetype)initWithVC:(UIViewController *)vc {
    self = [super init];
    if (self) {
        self.vc = vc;
    }
    return self;
}

- (void)get:(int)page {
    WXBaseRequest *request = [WXBaseRequest new];
    request.interface = @"RedseaPlatform/MobileInterface/ios.mb";
    request.params = @{
                       @"method":@"getOwShareListV1",
                       @"params":@{
                               @"userId":@"王鑫",
                               @"page": @(page),
                               @"pageSize": @10
                               }
                       };
    [request get:[Work class] block:^(id datas) {
        if (page == 1) {
            self.datas = datas;
        } else {
            NSMutableArray *array = [NSMutableArray arrayWithArray:self.datas];
            [array addObjectsFromArray:datas];
            self.datas = array;
        }
    }];
}

- (void)insert {
    Work *work = [[Work alloc] init];
    work.name = @"新增";
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.datas];
    [array insertObject:work atIndex:0];
    self.datas = array;
}

@end
