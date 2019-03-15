//
//  AffairVM.m
//  outwork
//
//  Created by 王鑫 on 2019/03/14.
//  Copyright © 2019年 wangxin. All rights reserved.
//

#import "AffairVM.h"
#import "Affair.h"
#import <WXKit/WXBaseRequest.h>

@implementation AffairVM

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
                       @"method":@"getAffairsInBoxListNew",
                       @"params":@{
                               @"userId":@"胡雷明",
                               @"page": @(page),
                               @"pageSize": @10
                               }
                       };
    [request get:[Affair class] block:^(id datas) {
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
    Affair *affair = [[Affair alloc] init];
    affair.initiateUserName = @"新增";
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.datas];
    [array insertObject:affair atIndex:0];
    self.datas = array;
}

@end
