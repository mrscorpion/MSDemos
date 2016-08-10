//
//  BaseViewController.h
//  MSDemos
//
//  Created by mr.scorpion on 16/8/10.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
@property (nonatomic, assign) CGFloat navBarHeight;
@property (nonatomic, strong) UILabel *titleLabel;

/**
 *  初始化View
 */
- (void)initView;
@end

