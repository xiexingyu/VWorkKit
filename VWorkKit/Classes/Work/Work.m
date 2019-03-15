//
//  Work.m
//  vwork
//
//  Created by 王鑫 on 2019/03/15.
//  Copyright © 2019年 wangxin. All rights reserved.
//

#import "Work.h"

@implementation Work

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name": @"shareUserName",
             @"time": @"shareDate",
             @"content": @"shareContent"};
}

@end
