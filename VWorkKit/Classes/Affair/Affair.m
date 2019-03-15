//
//  Affair.m
//  outwork
//
//  Created by 王鑫 on 2019/03/14.
//  Copyright © 2019年 wangxin. All rights reserved.
//

#import "Affair.h"
#import <YYKit/YYKit.h>

@implementation Affair

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{};
}

- (NSString *)time {
    NSDate *date = [NSDate dateWithString:_time format:@"YYYY-MM-dd HH:mm:ss"];
    return [date stringWithFormat:@"YY/MM/dd HH:mm"];
}

@end
