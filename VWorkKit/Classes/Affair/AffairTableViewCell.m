//
//  AffairTableViewCell.m
//  outwork
//
//  Created by 王鑫 on 2019/03/14.
//  Copyright © 2019年 wangxin. All rights reserved.
//

#import "AffairTableViewCell.h"
#import <WXKit/UIImageView+WXAdd.h>

@interface AffairTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (nonatomic, strong) Affair *affair;

@end

@implementation AffairTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        NSString *path = [bundle pathForResource:@"VWorkKit" ofType:@"bundle"];
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
- (void)fillView:(Affair *)affair {
    self.affair = affair;
    [self.avatarView displayUser:[WXUser getUserWithUserId:affair.initialUerId userName:affair.initiateUserName userPhoto:affair.initiateUserPhoto]];
    self.nameLabel.text = affair.initiateUserName;
    self.titleLabel.text = affair.title;
    self.timeLabel.text = affair.time;
    self.contentLabel.text = [affair.content stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end
