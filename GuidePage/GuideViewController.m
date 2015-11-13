//
//  GuideViewController.m
//  GuidePage
//
//  Created by 艾葭 on 15/11/13.
//  Copyright © 2015年 艾葭. All rights reserved.
//

#import "GuideViewController.h"

@interface GuideViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIButton *pressBtn;

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 新用户指导页面
    [self initGuide];
}

-(void)initGuide{
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    [self.scrollView setPagingEnabled:YES];
    [self.scrollView setBounces:NO];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    [self.view addSubview:self.scrollView];
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, self.scrollView.frame.size.height);
    //scrollView 开始的点
    CGPoint scrollPoint = CGPointMake(0, 0);
    [self.scrollView setContentOffset:scrollPoint animated:YES];
    
    //3个不同的页面显示
    [self createViewOne];
    [self createViewTwo];
    [self createViewThree];
}



-(void)createViewOne{
    
    UIView *view = [[UIView alloc] initWithFrame:self.view.frame];
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    backgroundImageView.image = [UIImage imageNamed:@"引导页1"];
    [view addSubview:backgroundImageView];
    
    self.scrollView.delegate = self;
    [self.scrollView addSubview:view];
    
}


-(void)createViewTwo{
    
    CGFloat originWidth = self.view.frame.size.width;
    CGFloat originHeight = self.view.frame.size.height;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(originWidth, 0, originWidth, originHeight)];
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    backgroundImageView.image = [UIImage imageNamed:@"引导页2"];
    [view addSubview:backgroundImageView];
    
    self.scrollView.delegate = self;
    [self.scrollView addSubview:view];
    
}

-(void)createViewThree{
    
    CGFloat originWidth = self.view.frame.size.width;
    CGFloat originHeight = self.view.frame.size.height;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(originWidth*2, 0, originWidth, originHeight)];
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    backgroundImageView.image = [UIImage imageNamed:@"引导页3"];
    
    self.pressBtn = [[UIButton alloc]initWithFrame:self.view.frame];
    [self.pressBtn addTarget:self action:@selector(buttonPressedToStart) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:backgroundImageView];
    [view insertSubview:self.pressBtn atIndex:0];
    
    self.scrollView.delegate = self;
    [self.scrollView addSubview:view];
    
}

-(void)buttonPressedToStart{
    if (self.delegate == nil) {
        NSLog(@"error : no delegate..\n");
    }else{
        if ([self.delegate respondsToSelector:@selector(buttonPressedToStart:)] == true) {
             [_delegate buttonPressedToStart:self];
        }else{
            NSLog(@"error: no function found..\n");
        }
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
