//
//  GuideViewController.h
//  GuidePage
//
//  Created by 艾葭 on 15/11/13.
//  Copyright © 2015年 艾葭. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GuideViewController;

@protocol GuideViewControllerDelegate <NSObject>

-(void)buttonPressedToStart:(UIViewController *)sender;

@end

@interface GuideViewController : UIViewController
@property (nonatomic, assign) id<GuideViewControllerDelegate> delegate;

@end
