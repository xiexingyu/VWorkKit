//
//  Affair.h
//  outwork
//
//  Created by 王鑫 on 2019/03/14.
//  Copyright © 2019年 wangxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Affair : NSObject

/** <#initialUerId#>*/
@property (nonatomic, copy) NSString *initialUerId;

/** <#content#>*/
@property (nonatomic, copy) NSString *content;

/** <#time#>*/
@property (nonatomic, copy) NSString *time;

/** <#isRead#>*/
@property (nonatomic, copy) NSString *isRead;

/** <#initiateUserPhoto#>*/
@property (nonatomic, copy) NSString *initiateUserPhoto;

/** <#title#>*/
@property (nonatomic, copy) NSString *title;

/** <#affairId#>*/
@property (nonatomic, copy) NSString *affairId;

/** <#inputDate#>*/
@property (nonatomic, copy) NSString *inputDate;

/** <#type#>*/
@property (nonatomic, strong) NSNumber *type;

/** <#initiateUserName#>*/
@property (nonatomic, copy) NSString *initiateUserName;

/** <#initiateUserDeptName#>*/
@property (nonatomic, copy) NSString *initiateUserDeptName;

@end
