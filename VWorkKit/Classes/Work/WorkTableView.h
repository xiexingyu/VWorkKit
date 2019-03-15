//
//  WorkView.h
//  vwork
//
//  Created by 王鑫 on 2019/03/15.
//  Copyright © 2019年 wangxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkVM.h"

@interface WorkTableView : UITableView

- (instancetype)initWithVM:(WorkVM *)vm;

@end
