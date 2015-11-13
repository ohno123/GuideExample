//
//  ViewController.m
//  GuidePage
//
//  Created by 艾葭 on 15/11/13.
//  Copyright © 2015年 艾葭. All rights reserved.
//

#import "ViewController.h"
#import "GuideViewController.h"
#import "CommonUtility.h"

@interface ViewController ()<GuideViewControllerDelegate>{
    UIViewController *_guideController;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViewController];
    self.view.backgroundColor = [UIColor greenColor];
}

-(void)setupViewController{
    
    //判断是不是第一次启动应用
    if(![[CommonUtility shareInstance] getGuideViewHidden]){
        UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Guide" bundle:nil];
        _guideController = [storyBoard instantiateInitialViewController];
        ((GuideViewController *)_guideController).delegate = self;
        [self addChildViewController:_guideController];
        [self.view addSubview:_guideController.view];
        _guideController.view.frame = self.view.bounds;
        
    }
    
}

#pragma mark - GuideViewControllerDelegate
-(void)buttonPressedToStart:(UIViewController *)sender
{
    [sender.view removeFromSuperview];
    [[CommonUtility shareInstance] setGuideViewHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
