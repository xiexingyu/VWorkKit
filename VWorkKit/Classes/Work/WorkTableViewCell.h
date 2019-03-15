//
//  WorkTableViewCell.h
//  vwork
//
//  Created by 王鑫 on 2019/03/15.
//  Copyright © 2019年 wangxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Work.h"

@interface WorkTableViewCell : UITableViewCell

- (void)fillView:(Work *)work;

@end
