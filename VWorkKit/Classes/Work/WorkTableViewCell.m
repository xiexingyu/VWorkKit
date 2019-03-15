//
//  WorkTableViewCell.m
//  vwork
//
//  Created by 王鑫 on 2019/03/15.
//  Copyright © 2019年 wangxin. All rights reserved.
//

#import "WorkTableViewCell.h"
#import <WXKit/NSBundle+WXAdd.h>

@interface WorkTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (nonatomic, strong) Work *work;

@end

@implementation WorkTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSString *path = [NSBundle getPodBundlePath:[self class] podName:@"work"];
        self = [[NSBundle bundleWithPath:path] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil][0];
        [self initView];
    }
    return self;
}

#pragma mark - View
- (void)initView {
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

#pragma mark - Model
- (void)fillView:(Work *)work {
    self.work = work;
    self.nameLabel.text = work.name;
    self.timeLabel.text = work.time;
    self.contentLabel.text = [work.content stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end
