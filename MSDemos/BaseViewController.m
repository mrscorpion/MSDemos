//
//  BaseViewController.m
//  MSDemos
//
//  Created by mr.scorpion on 16/8/10.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "BaseViewController.h"
#import "SWRevealViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
//    UITapGestureRecognizer *singleTapTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
//    singleTapTwo.numberOfTapsRequired = 2;
//    [self.view addGestureRecognizer:singleTapTwo];
}
- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)initView
{
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH ,60)];
    _navBarHeight = 60;
    containerView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:containerView];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    self.titleLabel = label;
    [containerView addSubview:label];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //注册该页面可以执行滑动切换
    SWRevealViewController *revealController = self.revealViewController;
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
