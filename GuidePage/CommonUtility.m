//
//  CommonUtility.m
//  GuidePage
//
//  Created by 艾葭 on 15/11/13.
//  Copyright © 2015年 艾葭. All rights reserved.
//

#import "CommonUtility.h"

NSString* kGuide =  @"GuideG";
static CommonUtility *utility = nil;
@implementation CommonUtility
+(CommonUtility *)shareInstance{
    if (utility == nil) {
        utility = [[CommonUtility alloc]init];
    }
    return utility;
}

- (void)setGuideViewHidden:(BOOL)hidden{
    [[NSUserDefaults standardUserDefaults] setObject: [NSNumber numberWithBool: hidden] forKey: kGuide];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

- (BOOL)getGuideViewHidden{
    NSNumber* data = [[NSUserDefaults standardUserDefaults] objectForKey: kGuide];
    return (data != nil) ? (BOOL)[data boolValue] : NO;
}

@end
