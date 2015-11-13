//
//  CommonUtility.h
//  GuidePage
//
//  Created by 艾葭 on 15/11/13.
//  Copyright © 2015年 艾葭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonUtility : NSObject
+(CommonUtility *)shareInstance;
- (void)setGuideViewHidden:(BOOL)hidden;
- (BOOL)getGuideViewHidden;
@end
