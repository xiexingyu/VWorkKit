//
//  AffairTableViewCell.h
//  outwork
//
//  Created by 王鑫 on 2019/03/14.
//  Copyright © 2019年 wangxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Affair.h"

@interface AffairTableViewCell : UITableViewCell

- (void)fillView:(Affair *)affair;

@end
